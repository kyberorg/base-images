#TAG=x
TAG="${TAG:=edge}"

docker build -f Dockerfile -t kio.ee/base/abi:${TAG} .
docker push kio.ee/base/abi:${TAG}
docker rmi -f kio.ee/base/abi:${TAG}
