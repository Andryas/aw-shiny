FROM openjdk:8-jre

RUN mkdir -p /opt/shinyproxy/
# RUN wget https://www.shinyproxy.io/downloads/shinyproxy-2.6.1.jar -O /opt/shinyproxy/shinyproxy.jar
RUN wget https://www.shinyproxy.io/downloads/shinyproxy-3.0.1.jar -O /opt/shinyproxy/shinyproxy.jar

COPY templates/ /opt/shinyproxy/templates/
COPY application.yml /opt/shinyproxy/application.yml

WORKDIR /opt/shinyproxy/
CMD ["java", "-jar", "/opt/shinyproxy/shinyproxy.jar"]
