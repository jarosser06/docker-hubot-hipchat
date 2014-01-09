# DOCKER-VERSION 0.7.2

FROM keyvanfatehi/precise-nodejs-from-binary

MAINTAINER Jim Rosser "jarosser06@gmail.com"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install wget python-dev g++ make
RUN apt-get -y install libexpat1-dev libicu-dev
RUN apt-get -y install supervisor
RUN apt-get -y install redis-server

RUN npm install --global coffee-script hubot@v2.6.4
RUN hubot --create /opt/hubot
WORKDIR /opt/hubot
RUN npm install
RUN npm install --save hubot-hipchat
RUN npm install --save nodepie

ADD ./supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD ./hubot-scripts.json /opt/hubot/hubot-scripts.json

CMD ["supervisord", "-n"]
