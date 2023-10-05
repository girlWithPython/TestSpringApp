FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /workspace/app

COPY gradlew gradlew
COPY gradle/wrapper gradle/wrapper
COPY build.gradle build.gradle
COPY src src

RUN ./gradlew clean build

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /workspace/app
COPY --from=builder /workspace/app/build/ ./
RUN echo $(ls -la ./)
RUN echo $(ls -la ./libs)

RUN echo $(ls -la /var/lib/docker/)
RUN echo $(ls -la /var/lib/docker/tmp/)

EXPOSE 8080
COPY ./build/libs/SpringApp-*.jar application.jar
# COPY ./workspace/app/build/libs/SpringApp-*.jar application.jar
ENTRYPOINT ["java", "-jar", "/application.jar"]
