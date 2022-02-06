FROM tomcat:9.0
RUN apt-get update \
    && apt-get install -y maven
RUN mkdir /home/boxfuse \
    && cd /home/boxfuse \
    && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git \
    && cd ./boxfuse-sample-java-war-hello \
    && mvn package \
    && cp ./target/*.war ~/webapps/


