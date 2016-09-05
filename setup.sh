#!/bin/bash
FOO_PASSWORD=${FOO_PASSWORD:-'pleasechange'}
set -e
docker login registry.cafjs.com:32000 -u foo -p "${FOO_PASSWORD}"
docker pull registry.cafjs.com:32000/root-rpidaemon
docker pull registry.cafjs.com:32000/root-rpi2armhf
docker pull registry.cafjs.com:32000/root-rpi2bluearmhf
mkdir -p /config
pushd /config
if [ -e "token"]
then
    echo "Token already exists"
else
    echo "Missing token, creating..."
    docker run --rm -e MY_ID="$1" -e PASSWD="$2" -v /config:/config registry.cafjs.com:32000/root-rpitoken
fi
chmod 600 token
popd #/config

docker rm -f root-rpidaemon
docker run -d --name=root-rpidaemon --restart=always -e MY_ID="$1" -v /var/run/docker.sock:/var/run/docker.sock  -v /config:/config  -e CONFIG_VOLUME=/config registry.cafjs.com:32000/root-rpidaemon
