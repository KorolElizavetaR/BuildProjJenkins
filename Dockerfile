FROM maven:3.9.8-eclipse-temurin-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package

FROM eclipse-temurin:21
WORKDIR /app
COPY --from=build /app/target/laba3-0.0.1-SNAPSHOT.jar /app/laba9.jar
EXPOSE 8080
CMD ["java", "-jar", "laba9.jar"]