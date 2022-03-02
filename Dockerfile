FROM ubuntu:focal

RUN groupadd -r mongodb && useradd -r -m -g mongodb mongodb

RUN apt-get update
RUN apt-get install -y wget gnupg
RUN wget -qO - "https://www.mongodb.org/static/pgp/server-5.0.asc" | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update
RUN apt-get install -y mongodb-mongosh

USER mongodb
RUN mongosh --nodb --eval "disableTelemetry()"
WORKDIR /home/mongodb
ENTRYPOINT [ "mongosh" ]