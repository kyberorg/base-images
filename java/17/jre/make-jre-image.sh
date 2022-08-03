for tag in 17-jre jre; do
     docker build --pull -f Dockerfile -t kio.ee/base/java:"${tag}" .
     docker push kio.ee/base/java:${tag}
     echo "Done building ${tag}"
done
