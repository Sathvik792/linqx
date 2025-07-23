FROM openjdk:8-jdk-alpine
RUN apk update && apk upgrade && apk add netcat-openbsd
RUN mkdir -p /usr/local/checklistservice
ARG JAR_FILE
ENV JAR_FILE=$JAR_FILE
ADD $JAR_FILE /usr/local/checklistservice/
ADD run.sh run.sh
RUN chmod +x run.sh
CMD ./run.sh
