FROM maven:3.8.3-openjdk-11-slim
RUN apt update && apt upgrade -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello
RUN mvn clean package && cp -r ./target/hello-1.0 /usr/local/tomcat/webapps