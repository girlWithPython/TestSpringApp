FROM eclipse-temurin:17-jdk-alpine
EXPOSE 8080
COPY ./build/libs/SpringApp-*.jar application.jar
ENTRYPOINT ["java", "-jar", "/application.jar"]
