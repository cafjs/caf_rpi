# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 minimal base image (armv7)
# TO_BUILD:       docker build --rm -t gcr.io/cafjs-k8/root-rpitoken .
# TO_RUN:         docker run --rm -e MY_ID="$1" -e PASSWD="$2" -v /config:/config gcr.io/cafjs-k8/root-rpitoken
#

FROM arm32v7/node:14

COPY ./qemu-arm-static /usr/bin/

ENV PATH="/usr/src/node_modules/.bin:${PATH}"

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY . /usr/src/app

RUN  cd /usr/src/app && yarn install  --production --ignore-optional && yarn run build && yarn cache clean


ENTRYPOINT [ "./start.js"]
