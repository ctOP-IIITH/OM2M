# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

# Make port 8080 available to the world outside this container
EXPOSE 8200

# Copy current directory files into the docker image
COPY om2m-mongo/ .

# Run the shell script
ENTRYPOINT [ "sh", "start.sh" ]
