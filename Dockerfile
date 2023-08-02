FROM alpine:3.17
LABEL AUTHOR="Ramakanta Samal"
RUN apk add openjdk17-jre
WORKDIR /opt
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
RUN tar xf apache-tomcat-9.0.78.tar.gz
RUN rm -rf apache-tomcat-9.0.78.tar.gz
RUN mv apache-tomcat-9.0.78 tomcat9
EXPOSE 8080
CMD ['/opt/tomcat9/bin/catalina.sh','run']
