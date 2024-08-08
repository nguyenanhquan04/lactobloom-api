# Stage 1: Build the application
FROM maven:3.8.5-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests && ls -l target

# Stage 2: Create the final image
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=build /app/target/LactoBloom-0.0.1-SNAPSHOT.jar /app/LactoBloom.jar

# Expose the port on which the Spring Boot application will run
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-jar", "/app/LactoBloom.jar"]
