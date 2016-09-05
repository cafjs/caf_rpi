Installs a security token that authenticates an RPi daemon with its CA.

It is invoked as:

    docker run --rm -e MY_ID="$1" -e PASSWD="$2" -v /config:/config registry.cafjs.com:32000/root-rpitoken

where `$1` is the device identifier, e.g., `antonio-device2`, `$2` is the password of `antonio` in the cloud, and `/config` is the directory where the token will be written. See the script `setup.sh` (top directory) for details.
