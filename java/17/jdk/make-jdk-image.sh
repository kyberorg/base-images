for tag in 17-jdk jdk; do
     docker build -f Dockerfile -t kio.ee/base/java:"${tag}" .
     docker push kio.ee/base/java:${tag}
done
