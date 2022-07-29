# Alpine Base image (ABI)
Alpine Base image (ABI) is [alpinelinux](https://alpinelinux.org) minirootfs 
with some [modifications](#Modifications) and latest updates applied.

The idea is to simulate rolling release distro (like Gentoo,Archlinux or Manjaro) behaivor.

It has: 
* latest updates
* non-root application user

## Motivation
Security. 

The purpose of this image is base image with 0 vulnerabilities.

Normally, even base images like `ubuntu` or RedHat's `ubi` contain tons of rarely needed stuff, 
which is hardly needed for your application to run and brings additional vulnerabilities.   


## Editions
### Edge edition
This is standard [alpinelinux](https://alpinelinux.org) image 
with [edge repository](https://wiki.alpinelinux.org/wiki/Edge) enabled.

### Runtime edition
Contains only minimalistic linux runtime needed to run your application.

Technically this is `edge` edition, but without package manager (apk) and shell (busybox). 
It is replaced by `/bin/true` binary.

Since it has no shell, container cannot be accessed using standard approaches like `docker exec`.
This make runtime secure, but debug and similar stuff is no longer possible. 

## Modifications
Despite been build from same built from the same [minirootfs](https://cz.alpinelinux.org/alpine/edge/releases/x86_64/) 
as [official alpine image](https://hub.docker.com/_/alpine), 
ABI contains non-root application user and group(`appuser:appgroup`). 
So you can just add this single line to your `Dockerfile`
```dockerfile
USER appuser
```

also it contains less system users than [official alpine image](https://hub.docker.com/_/alpine).
For example, you'd barely need to access to printing queue of your container, so `lp` user is no longer needed.

### Creating new user
* For `edge` edition it is fairly easy. Just run standard commands:
```dockerfile
RUN addgroup mygroup && adduser myuser mygroup
```
* For `runtime` edition you have to copy you own `/etc/passwd` and `/etc/group` files.
```dockerfile
FROM kio.ee/base/abi:edge as build
RUN addgroup mygroup && adduser myuser mygroup

FROM kio.ee/base/abi:runtime as final
COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /etc/group /etc/group
```