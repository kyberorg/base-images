FROM kio.ee/hub/library/eclipse-temurin:17-jre-alpine as jre-provider

# Define base image
FROM kio.ee/base/abi:runtime as final
ENV JAVA_HOME=/opt/java/openjdk
ENV PATH "${JAVA_HOME}/bin:${PATH}"
COPY --from=jre-provider $JAVA_HOME $JAVA_HOME
