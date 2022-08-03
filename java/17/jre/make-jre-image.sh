docker pull kio.ee/hub/library/eclipse-temurin:17-jre-alpine
docker pull kio.ee/base/abi:runtime

for tag in 17-jre jre; do
     docker build -f Dockerfile -t kio.ee/base/java:"${tag}" .
     docker push kio.ee/base/java:${tag}
     docker rmi -f kio.ee/base/java:${tag}
done
