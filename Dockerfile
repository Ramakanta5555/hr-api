#Stage 1 - Build
FROM maven:3.8.1-jdk-11-slim AS build
LABEL AUTHOR="Ramakanta Samal"
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2 - create the final Dockeer image 
FROM openjdk:11-jre-slim
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar xf apache-tomcat-9.0.78.tar.gz
RUN rm -rf apache-tomcat-9.0.78.tar.gz
RUN mv apache-tomcat-9.0.78 tomcat9
COPY --from=build  /app/target/hr-api.war /opt/tomcat9/webapps
EXPOSE 8080
CMD ["/opt/tomcat9/bin/catalina.sh","run"]



