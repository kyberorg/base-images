# Base images
Small and security-oriented docker base images. Based on alpine edge.

## Alpine Base Image (ABI)

Alpine Base image (ABI) is [alpine linux minirootfs](https://cz.alpinelinux.org/alpine/edge/releases/x86_64/) 
with non-root user and latest updates applied.

The idea is to simulate rolling release distro behavior.

For more info see [ABI's README](abi/README.md)

## Golang
This is [ABI](abi)-based image with pre-installed and configured golang environment.

## Java
Java image is [ABI](abi)-based image with
JDK or JRE from official [eclipse-temurin](https://hub.docker.com/_/eclipse-temurin) docker image.

## Examples
Some use cases.

* Running simple binary [Dockerfile.gobinary](examples/Dockerfile.gobinary)