FROM maven:latest
RUN apt update -y
RUN apt install git -y
ENV CLONE_REP=/usr/app
WORKDIR $CLONE_REP
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
ENV BUILD_REP=/usr/app/boxfuse-sample-java-war-hello
WORKDIR $BUILD_REP
RUN mvn clean package
RUN cp -r target/hello-1.0.war /usr/local/tomcat/webapps