for tag in latest 1.18 1.18.4; do
     docker build -f Dockerfile -t kio.ee/base/go:"${tag}" .
     docker push kio.ee/base/go:${tag}
done