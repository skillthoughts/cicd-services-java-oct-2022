FROM ibtech/tomcat9
RUN /target/*.war /usr/local/tomcat/webapps/
