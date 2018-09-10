#pull down centos image
FROM centos
MAINTAINER wtaoh_tm@126.com

#copy jdk and tomcat into image
ADD ./jdk-8u111-linux-x64.tar.gz /opt/software
ADD ./apache-tomcat-8.5.9.tar.gz /opt/software

#set environment variable
ENV JAVA_HOME /opt/software/jdk1.8.0_111
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV CATALINA_HOME /opt/software/apache-tomcat-8.5.9
ENV CATALINA_BASE /opt/software/apache-tomcat-8.5.9
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/lib:$CATALINA_HOME/bin

RUN rm -rf /opt/software/apache-tomcat-8.5.9/webapps/*

VOLUME ["/opt/software/apache-tomcat-8.5.9/webapps"]

#容器运行时监听的端口
EXPOSE  8080

#define entry point which will be run first when the container starts up
ENTRYPOINT /opt/software/apache-tomcat-8.5.9/bin/startup.sh && tail -F /opt/software/apache-tomcat-8.5.9/logs/catalina.out