FROM kio.ee/base/abi:edge as base

RUN apk add --no-cache git make musl-dev go=1.18.4-r2 upx

# Configure Go
ENV GOROOT /usr/lib/go
ENV GOPATH /go
ENV PATH /go/bin:$PATH

RUN mkdir -p ${GOPATH}/src ${GOPATH}/bin

WORKDIR $GOPATH