FROM ubuntu:16.04

# Install prerequisites
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN apt-get -y install curl
RUN mkdir /opt/tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar -xf tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-9.0.72/* /opt/tomcat/
# Deploy war file
COPY ./target/*.war /opt/tomcat/webapps/
#entrypoint ["/opt/tomcat/bin/catalina.sh", "run"]
EXPOSE 8080
# adding following section for starting tomcat server
CMD ["catalina.sh", "run"]
