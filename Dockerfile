# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 base image (armv7)
# TO_BUILD:       docker build --rm -t gcr.io/cafjs-k8/root-rpi2armhf .
# TO_RUN:         base image
#

FROM arm32v6/node:8-alpine

COPY ./qemu-arm-static /usr/bin/

RUN apk add --update --no-cache make gcc g++ python linux-headers

ENV PATH="/usr/src/node_modules/.bin:${PATH}"

RUN mkdir -p /usr/src

WORKDIR /usr/src/app

ONBUILD COPY . /usr/src

ONBUILD RUN  cd /usr/src/app && yarn install  --production --ignore-optional && cafjs build && yarn cache clean

ENTRYPOINT ["node"]

CMD [ "./index.js" ]
