#!/bin/bash
set -e
docker pull arm32v7/node:12
docker pull gcr.io/cafjs-k8/root-rpidaemon
docker pull gcr.io/cafjs-k8/root-rpi2armhf
docker pull gcr.io/cafjs-k8/root-rpi2bluearmhf
mkdir -p /config
pushd /config
if [ -e "token" ]
then
    echo "Token already exists"
else
    echo "Missing token, creating..."
    docker pull gcr.io/cafjs-k8/root-rpitoken
    docker run --rm -e ACCOUNTS_URL=https://root-accounts.cafjs.com -e MY_ID="$1" -e PASSWD="$2" -v /config:/config gcr.io/cafjs-k8/root-rpitoken
fi
chmod 600 token
popd #/config

docker rm -f root-rpidaemon || true
docker run -d --name=root-rpidaemon --restart=always -e IS_REGISTRY_PRIVATE=false -e APP_SUFFIX=cafjs.com -e MY_ID="$1" -v /var/run/docker.sock:/var/run/docker.sock  -v /config:/config  -e CONFIG_VOLUME=/config gcr.io/cafjs-k8/root-rpidaemon
