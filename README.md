# CAF.js (Cloud Assistant Framework)

Co-design permanent, active, stateful, reliable cloud proxies with your web app and gadgets.

See http://www.cafjs.com

## Bootstrapping a Raspberry Pi 2/3

Setting up a RPi2 or RPi3 for running CAF.js applications is easy.

Start with an up to date raspbian image, install Docker with:

    curl -sSL https://get.docker.com | sh

Register for a cloud account in https://root-launcher.cafjs.com with user, e.g., `bar`. Create a CA instance of the `root-gadget` app to manage the device `bar-device1`. See  {@link external:caf} (https://cafjs.github.io/api/caf) and {@link external:caf_dcinabox} (https://cafjs.github.io/api/caf_dcinabox) for details.

Then, execute in the RPi:

    curl -sSL  https://raw.githubusercontent.com/cafjs/caf_rpi/master/setup.sh | bash -s -- bar-device1 pleasechange

where `bar-device1` is the identifier of the  device, and `pleasechange` the cloud service password for user `bar`. After the setup is done, only a restricted authentication token will be kept in the device. To clear the shell history (with your password):

    history -c && history -w

Deployment of device apps and tokens is now managed by the `root-gadget` app.
