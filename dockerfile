FROM ubuntu AS Builder
MAINTAINER MEMPAGE
RUN apt-get update -y
RUN apt install openjdk-11-jdk -y && apt install wget -y
RUN mkdir /opt/tomcat
WORKDIR /opt/tomcat
RUN wget http://dlcdn.apache.org/tomcat/tomcat-9/v9.0.72/bin/apache-tomcat-9.0.72.tar.gz
RUN tar -zxvf apache-tomcat-9.0.72.tar.gz


FROM scratch
COPY --from=Builder /opt/tomcat/  /apache-tomcat-9.0.72/bin
EXPOSE 9090
CMD ["/opt/tomcat/apache-tomcat-9.0.72/bin/catalina.sh","run"]
