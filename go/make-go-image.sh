for tag in latest 1.19; do
     docker build -f Dockerfile -t kio.ee/base/go:"${tag}" .
     docker push kio.ee/base/go:${tag}
     echo "Done building ${tag}"
done
