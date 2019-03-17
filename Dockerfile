FROM adoptopenjdk/maven-openjdk11:latest as builder
RUN mkdir /tmp/build
WORKDIR /tmp/build
COPY . /tmp/build
RUN mvn clean package

FROM adoptopenjdk/openjdk11:latest
RUN mkdir /opt/webapp
WORKDIR /opt/webapp
EXPOSE 8080
COPY --from=builder /tmp/build/target/ping*-thorntail.jar /opt/webapp/service.jar
ENV JAVA_TOOL_OPTIONS "-Djava.net.preferIPv4Stack=true" 
CMD ["java","-jar","/opt/webapp/service.jar"]
