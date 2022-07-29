#!/bin/zsh +x
VERSION=20220715

STAGE_1_TAR=alpine-minirootfs-${VERSION}-x86_64.tar.gz
STAGE_1_SHA256=alpine-minirootfs-${VERSION}-x86_64.tar.gz.sha256
STAGE_1_SHA512=alpine-minirootfs-${VERSION}-x86_64.tar.gz.sha512
STAGE_2_TAR=stage2-x86_64.tar.gz
STAGE_3_IMAGE_TAR=stage3-image-x86_64.tar.gz
STAGE_3_TAR_FILE=stage3-x86_64.tar
STAGE_3_TAR=stage3-x86_64.tar.gz

TMP_DIR=tmp
STAGE_3_IMAGE=abi:stage3

DOCKER_REPO=kio.ee/base/abi
#TAG=x
TAG="${TAG:=edge}"

# Getting Stage 1 aka MiniRootFS
wget https://cz.alpinelinux.org/alpine/edge/releases/x86_64/${STAGE_1_TAR}
# Getting checksum files
wget https://cz.alpinelinux.org/alpine/edge/releases/x86_64/${STAGE_1_SHA256}
wget https://cz.alpinelinux.org/alpine/edge/releases/x86_64/${STAGE_1_SHA512}

sha256sum -c ${STAGE_1_SHA256} || exit 1
sha512sum -c ${STAGE_1_SHA512} || exit 1

# Extract Stage 1 for modifications
mkdir ${TMP_DIR}
tar --same-owner -C ${TMP_DIR} -xzf ./${STAGE_1_TAR} || exit 1
rm -rf ${STAGE_1_TAR}

cd ${TMP_DIR} || exit 1

# Replacing passwd and group files with our version
cp ../files/passwd etc/passwd
cp ../files/group etc/group

# Adding adding home for appuser
mkdir -p home/appuser

# Pack Stage2 to tar.gz and make Stage2 image
tar -czf ${STAGE_2_TAR} ./* || exit 1
cd ..
mv ${TMP_DIR}/${STAGE_2_TAR} . || exit 1

# Finally, make stage3 docker image and save it as tar
docker build -f Dockerfile.stage3 -t ${STAGE_3_IMAGE} . || exit 1

docker save ${STAGE_3_IMAGE} | gzip > ${STAGE_3_IMAGE_TAR}

# extract layer.tar from docker image tar
rm -rf ${TMP_DIR} && mkdir ${TMP_DIR}
tar --same-owner -C ${TMP_DIR} -xzf ./${STAGE_3_IMAGE_TAR} || exit 1

cd ${TMP_DIR} || exit 1
FIRST_DIR=$(ls -d */|head -n 1)
LAYER_TAR=${FIRST_DIR}/layer.tar
mv "${LAYER_TAR}" ../${STAGE_3_TAR_FILE}
cd .. || exit 1
gzip ${STAGE_3_TAR_FILE}

# Tag it
docker build -f Dockerfile -t ${DOCKER_REPO}:${TAG} . || exit 1

# Cleanup
docker rmi ${STAGE_3_IMAGE}
rm -rf ${STAGE_1_SHA256}
rm -rf ${STAGE_1_SHA512}
rm -rf ${STAGE_1_TAR}
rm -rf ${STAGE_2_TAR}
rm -rf ${STAGE_3_IMAGE_TAR}
rm -rf ${STAGE_3_TAR}
rm -rf ${TMP_DIR}

# Ship it to kio.ee
docker push ${DOCKER_REPO}:${TAG}

# Docker images cleanup
docker rmi ${DOCKER_REPO}:${TAG}