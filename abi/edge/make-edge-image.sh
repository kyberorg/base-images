#TAG=x
TAG="${TAG:=edge}"

docker build -f Dockerfile -t kio.ee/base/abi:${TAG} .
docker push kio.ee/base/abi:${TAG}
docker rmi kio.ee/base/abi:${TAG}
