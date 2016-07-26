# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 minimal base image (armv7)
# TO_BUILD:       docker build --rm -t registry.cafjs.com:32000/root-rpi2minimalarmhf .
# TO_RUN:         base image
#

FROM armhf/alpine:3.3

COPY ./qemu-arm-static /usr/bin/

RUN apk add --update nodejs && rm -rf /var/cache/apk/*

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

ONBUILD COPY . /usr/src/app

ONBUILD RUN rm -fr /usr/src/app/node_modules/*

ONBUILD RUN  touch /usr/src/app/http_proxy_build ; . /usr/src/app/http_proxy_build;  if test -f all.tgz; then tar zxvf all.tgz; npm rebuild; fi; npm install --production . ; npm run build

CMD [ "npm", "start" ]
