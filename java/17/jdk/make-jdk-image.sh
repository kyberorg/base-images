docker pull kio.ee/hub/library/eclipse-temurin:17-jdk-alpine
docker pull kio.ee/base/abi:edge

for tag in 17-jdk jdk; do
     docker build -f Dockerfile -t kio.ee/base/java:"${tag}" .
     docker push kio.ee/base/java:${tag}
     docker rmi -f kio.ee/base/java:${tag}
done
