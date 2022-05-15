# the first stage 
FROM maven:3.8.5-openjdk-11 AS MAVEN_BUILD

# copy the build.gradle and src code to the container
COPY src/ src/
COPY pom.xml ./ 

# Build and package our code
RUN mvn build

# the second stage of our build just needs the compiled files
FROM openjdk:11-jre
ARG SERVER_PORT=8088

# Setup tini to work better handle signals
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN addgroup --system javauser && useradd -g javauser javauser

# copy only the artifacts we need from the first stage and discard the rest
COPY --chown=javauser:javauser --from=MAVEN_BUILD target/demo-0.0.1-SNAPSHOT.jar /demo.jar
COPY --chown=javauser:javauser docker/docker-entrypoint.sh /docker-entrypoint.sh 

ENV PORT $CC_SERVER_PORT
EXPOSE $CC_SERVER_PORT

USER javauser
ENTRYPOINT [ "/tini", "--", "/docker-entrypoint.sh" ]
