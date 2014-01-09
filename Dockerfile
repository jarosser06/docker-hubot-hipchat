# DOCKER-VERSION 0.7.2

FROM keyvanfatehi/precise-nodejs-from-binary

MAINTAINER Jim Rosser "jarosser06@gmail.com"

RUN apt-get update
RUN apt-get -y install wget python-dev g++ make
RUN apt-get -y install libexpat1-dev libicu-dev

RUN npm install --global coffee-script hubot@v2.6.4
RUN hubot --create /opt/hubot
WORKDIR /opt/hubot
RUN npm install
RUN npm install --save hubot-hipchat

CMD ["bin/hubot", "--adapter", "hipchat"]
