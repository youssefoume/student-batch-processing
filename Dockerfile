FROM eclipse-temurin:21-jdk-alpine
# Install Maven
RUN apk add --no-cache maven

WORKDIR /app
COPY src /app/src
COPY pom.xml /app
RUN mvn -f /app/pom.xml clean package -D skipTests


EXPOSE 9090

ENTRYPOINT ["java", "-jar", "/app/target/batch-0.0.1-SNAPSHOT.jar"]
