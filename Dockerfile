FROM tomcat:9-jdk11
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN apt install maven -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
WORKDIR ./boxfuse-sample-java-war-hello
RUN mvn clean package
RUN cp -r target/hello-1.0.war /usr/local/tomcat/webapps