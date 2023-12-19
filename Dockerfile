FROM maven:3.8-jdk-11-slim as build
RUN apt update -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR ./boxfuse-sample-java-war-hello
RUN mvn clean package

FROM tomcat:9.0-alpine
COPY --from=build ./boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps
#ENV START_TOMCAT=/usr/local/tomcat/
#WORKDIR $START_TOMCAT
#RUN cp -r webapps.dist/* webapps