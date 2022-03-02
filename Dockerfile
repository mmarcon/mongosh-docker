FROM ubuntu:focal

RUN groupadd -r mongodb && useradd -r -m -g mongodb mongodb

RUN apt-get update
RUN apt-get install -y wget gnupg

# MongoDB PPAs
RUN wget -qO - "https://www.mongodb.org/static/pgp/server-5.0.asc" | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
RUN apt-get update
RUN apt-get install -y mongodb-mongosh

# Node 14
RUN wget -qO nodesource.sh https://deb.nodesource.com/setup_14.x
RUN bash nodesource.sh
RUN apt install nodejs

USER mongodb
WORKDIR /home/mongodb

# Useful packages
RUN npm install node-fetch@2 @ngneat/falso@2 chalk@4

# .mongoshrc.js
COPY mongoshrc.js .mongoshrc.js

# Disable telemetry
RUN mongosh --nodb --eval "disableTelemetry()"
ENTRYPOINT [ "mongosh" ]