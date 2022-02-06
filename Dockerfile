FROM ubuntu:20.04
RUN apt-get update \
    && apt-get -y full-upgrade \
    && apt-get install -y default-jdk \
    && apt-get install -y git \
    && apt-get install -y maven \
    && apt-get install -y  wget

RUN mkdir /home/tomcat \
    && cd /home/tomcat \
    && wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.58/bin/apache-tomcat-9.0.58.tar.gz \
    && tar -xzvf apache-tomcat-9.0.58.tar.gz

RUN mkdir /home/boxfuse \
    && cd /home/boxfuse \
    && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git \
    && cd ./boxfuse-sample-java-war-hello/
    && mvn package \
    && cp *.war /home/tomcat/apache-tomcat-9.0.58/webapps/



EXPOSE 8080
CMD ["/home/tomcat/apache-tomcat-9.0.58/bin/catalina.sh", "run"]

