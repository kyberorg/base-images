for tag in 17-jre jre; do
     docker build -f Dockerfile -t kio.ee/base/java:"${tag}" .
     docker push kio.ee/base/java:${tag}
     docker rmi kio.ee/base/java:${tag}
done
