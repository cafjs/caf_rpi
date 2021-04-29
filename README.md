# Caf.js

Co-design cloud assistants with your web app and IoT devices.

See https://www.cafjs.com

## Bootstrapping a Raspberry Pi 2/3/4

Setting up a Raspberry Pi for running `Caf.js` applications is easy.

Start with an up to date raspbian image, install Docker with:
```
    curl -sSL https://get.docker.com | sh
```
Sign up for a cloud account in https://root-launcher.cafjs.com with user, e.g., `bar`.

And now, to register your device with name, e.g., `device1`, login and create a CA instance of the `root-gadget` app to manage the device `bar-device1`. See  {@link external:caf} (https://cafjs.github.io/api/caf) and {@link external:caf_dcinabox} (https://cafjs.github.io/api/caf_dcinabox) for details.

Finally, in the RPi:
```
    curl -sSL  https://raw.githubusercontent.com/cafjs/caf_rpi/master/setup.sh | bash -s -- bar-device1 pleasechange
```
where `bar-device1` is the identifier of the  device, and `pleasechange` the cloud service password for user `bar`. After the setup is done, only a restricted authentication token will be kept in the device. To clear the shell history (with your password):
```
    history -c && history -w
```
Deployment of device apps and tokens is now managed by the `root-gadget` app.
