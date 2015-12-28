# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 base image (armv7)
# TO_BUILD:       docker build --rm -t registry.cafjs.com:32000/root-rpi2armhf .
# TO_RUN:         docker run -p <app_port>:3000 -v /config:/config registry.cafjs.com:32000/root-rpi2armhf
#

FROM armv7/armhf-ubuntu:14.04

COPY ./qemu-arm-static /usr/bin/

RUN apt-get update && apt-get install -q -y \
      curl git python make g++

RUN curl -sL https://deb.nodesource.com/setup_0.10 | sudo -E bash -

RUN apt-get install -y nodejs

RUN sudo npm install -g npm@v2 

RUN sudo npm install -g node-gyp

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app

ONBUILD RUN rm -fr /usr/src/app/node_modules/*

ONBUILD RUN  touch /usr/src/app/http_proxy_build ; . /usr/src/app/http_proxy_build;  if test -f all.tgz; then tar xvf all.tgz; npm rebuild; fi; npm install --production . ; npm run build

CMD [ "npm", "start" ]


