# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app
COPY . .
RUN mvn clean package

# Copy the application's jar file to the container
COPY target/LactoBloom-0.0.1-SNAPSHOT.jar /app/LactoBloom.jar

# Expose the port on which the Spring Boot application will run
EXPOSE 8080
# Run the application
ENTRYPOINT ["java", "-jar", "/app/LactoBloom.jar"]