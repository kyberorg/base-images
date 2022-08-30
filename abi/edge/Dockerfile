FROM kio.ee/hub/library/alpine:edge as edge
RUN echo "net.ipv4.ip_forward=0" > /etc/sysctl.conf
RUN sed -i 's/dl-cdn.alpinelinux.org\/alpine/alpine.kyberorg.fi/g' /etc/apk/repositories
RUN apk --no-cache upgrade
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

FROM scratch
COPY --from=edge / /
