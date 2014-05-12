# DOCKER-VERSION 0.7.2

FROM jarosser06/nodejs

MAINTAINER Jim Rosser "jarosser06@gmail.com"

RUN apt-get update && apt-get -y install libexpat1-dev libicu-dev

RUN npm install --global coffee-script hubot@v2.6.4
RUN hubot --create /opt/hubot
WORKDIR /opt/hubot
RUN npm install
RUN npm install --save hubot-hipchat
RUN npm install --save nodepie

ADD ./hubot-scripts.json /opt/hubot/hubot-scripts.json

CMD ["/opt/hubot/bin/hubot", "--adapter", "hipchat", "--name", "Hubot"]
