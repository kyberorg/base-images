for tag in 17-jdk jdk; do
     docker build --no-cache -f Dockerfile -t kio.ee/base/java:"${tag}" .
     docker push kio.ee/base/java:${tag}
     docker rmi -f kio.ee/base/java:${tag}
done
