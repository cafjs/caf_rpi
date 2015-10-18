# VERSION 0.1
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 base image (armv7)
# TO_BUILD:       docker build --rm -t registry.cafjs.com:32000/root-rpi2armhf .
# TO_RUN:         docker run -p <app_port>:3000 -v /config:/config registry.cafjs.com:32000/root-rpi2armhf
#

FROM armv7/armhf-ubuntu:14.04

COPY ./qemu-arm-static /usr/bin/

RUN apt-get update && apt-get install -q -y \
      curl git

RUN curl -sL https://deb.nodesource.com/setup_0.10 | sudo -E bash -

RUN apt-get install -y nodejs

RUN rm -fr /usr/lib/node_modules/npm

#older npm versions do not work with qemu emulator
RUN  curl -sL https://registry.npmjs.org/npm/-/npm-3.3.8.tgz > /tmp/npm-3.3.8.tgz; cd /tmp ; tar -zxvf npm-3.3.8.tgz; cd package;  ./cli.js config set unsafe-perm true; ./cli.js install -gf; cd ../; rm -fr package; rm -f npm-3.3.8.tgz 

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app

ONBUILD RUN rm -fr /usr/src/app/node_modules/*

ONBUILD RUN npm install --production

CMD [ "npm", "start" ]


