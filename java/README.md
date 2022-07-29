# Java image

Java image is [abi](../abi)-based image with 
JDK or JRE from [official eclipse-temurin docker image](https://hub.docker.com/_/eclipse-temurin)

## Editions
### JDK
JDK stands for Java Developer Kit and contains compiler and other useful tools, 
that are used in development process.

JDK image is based on [kio.ee/base/abi:edge](../abi/README.md#Edge edition).

### JRE
JRE aka Java Runtime Edition contains only JVM and tools needed to run you application.

JRE image is based on [kio.ee/base/abi:runtime](../abi/README.md#Runtime edition). 

## Versions supported
Currently, only supported version is `17` from `eclipse-temurin` project. 
If you other versions or JVM providers, please [raise an issue](https://github.com/kyberorg/base-images/issues).