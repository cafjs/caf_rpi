# VERSION 0.2
# DOCKER-VERSION  1.7.0
# AUTHOR:         Antonio Lain <antlai@cafjs.com>
# DESCRIPTION:    Cloud Assistants Raspberry Pi 2 minimal base image (armv7)
# TO_BUILD:       docker build --rm -t registry.cafjs.com:32000/root-rpitoken .
# TO_RUN:         docker run --rm -e MY_ID="$1" -e PASSWD="$2" -v /config:/config registry.cafjs.com:32000/root-rpitoken
#

FROM registry.cafjs.com:32000/root-rpi2armhf

ENTRYPOINT [ "./start.js"]
