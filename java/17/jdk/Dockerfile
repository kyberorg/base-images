FROM kio.ee/hub/library/eclipse-temurin:17-jdk-alpine as jdk-provider

FROM kio.ee/base/abi:edge as final
ENV JAVA_HOME=/opt/java/openjdk
COPY --from=jdk-provider $JAVA_HOME $JAVA_HOME
ENV PATH="${JAVA_HOME}/bin:${PATH}"
