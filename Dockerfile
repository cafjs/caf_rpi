# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 base image (armv7)
# TO_BUILD:       docker build --rm -t registry.cafjs.com:32000/root-rpi2armhf .
# TO_RUN:         docker run -p <app_port>:3000 -v /config:/config registry.cafjs.com:32000/root-rpi2armhf
#

FROM armhf/alpine:3.3

COPY ./qemu-arm-static /usr/bin/

RUN apk add --update curl nodejs python make g++ linux-headers && rm -rf /var/cache/apk/*

RUN curl -sL https://registry.npmjs.org/npm/-/npm-2.14.15.tgz > /tmp/npm-2.14.15.tgz; cd /tmp ; tar -zxvf npm-2.14.15.tgz; cd package;  ./cli.js config set unsafe-perm true; ./cli.js install -gf; cd ../; rm -fr package; rm -f npm-2.14.15.tgz

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm install bignum; rm -fr node_modules/bignum

ONBUILD COPY . /usr/src/app

ONBUILD RUN rm -fr /usr/src/app/node_modules/*

ONBUILD RUN  touch /usr/src/app/http_proxy_build ; . /usr/src/app/http_proxy_build;  if test -f all.tgz; then tar zxvf all.tgz; npm rebuild; fi; npm install --production . ; npm run build

CMD [ "npm", "start" ]


