# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 base image with bluetooth support (armv7)
# TO_BUILD:       docker build --rm -t registry.cafjs.com:32000/root-rpi2bluearmhf .
# TO_RUN:         base image
#

FROM armhf/ubuntu:15.10

COPY ./qemu-arm-static /usr/bin/

RUN apt-get update; apt-get install -y git curl python build-essential pkg-config libical-dev

RUN curl -sL https://deb.nodesource.com/setup_4.x |  bash -

RUN apt-get install -y nodejs libudev-dev libudev1 libglib2.0-dev libdbus-1-dev  libreadline-dev libtool autotools-dev automake

RUN  git clone https://git.kernel.org/pub/scm/bluetooth/bluez.git; cd bluez; ./bootstrap ;  ./configure --enable-maintainer-mode --prefix=/usr --sysconfdir=/etc -localstatedir=/var --enable-experimental; make -j 4; cp tools/btmgmt /usr/bin; cp tools/sdptool /usr/bin; cp tools/rfcomm /usr/bin; cd ..; rm -fr bluez; echo "done"

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

RUN npm install bignum; rm -fr node_modules/bignum

ONBUILD COPY . /usr/src/app

ONBUILD RUN   rm -fr /usr/src/app/node_modules/* ; touch /usr/src/app/http_proxy_build ; . /usr/src/app/http_proxy_build;  if test -f all.tgz; then tar zxvf all.tgz; npm rebuild; fi; npm install --production . ; npm run build

ENTRYPOINT ["node"]

CMD [ "./index.js" ]
