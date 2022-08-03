for tag in latest 1.18 1.18.5; do
     docker build --no-cache -f Dockerfile -t kio.ee/base/go:"${tag}" .
     docker push kio.ee/base/go:${tag}
     docker rmi -f kio.ee/base/go:${tag}
done
