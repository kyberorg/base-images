#TAG=x
TAG="${TAG:=edge}"

docker build --pull -f Dockerfile -t kio.ee/base/abi:${TAG} .
docker push kio.ee/base/abi:${TAG}
echo "Done building ${TAG}"
