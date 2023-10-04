FROM eclipse-temurin:17-jdk-alpine AS builder
WORKDIR /workspace/app

COPY gradlew gradlew
COPY gradle/wrapper gradle/wrapper
COPY build.gradle build.gradle
COPY src src

RUN ./gradlew clean build

FROM eclipse-temurin:17-jdk-alpine
WORKDIR /workspace/app
COPY --from=builder /workspace/app/build/ /workspace/app/build/

EXPOSE 8080
COPY ./build/libs/SpringApp-*.jar application.jar
ENTRYPOINT ["java", "-jar", "/application.jar"]
