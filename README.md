# CAF (Cloud Assistant Framework)

Co-design permanent, active, stateful, reliable cloud proxies with your web app.

See http://www.cafjs.com

## CAF bootstrapping for a Raspberry PI 2/3

Sets-up a Raspberry PI 2/3 to be used with CAF.

Starting with an up to date raspbian image, install docker using:

    curl -sSL https://get.docker.com | sh

then, after creating a cloud account, e.g., for user `foo`,  and an instance of the `root-gadget` app for device `foo-device1`, execute in the RPi:

    curl -sSL  https://raw.githubusercontent.com/cafjs/caf_rpi/master/setup.sh | bash -s -- foo-device1 pleasechange

where `foo-device1` is the identifier of the  device and `pleasechange` the password to login in the cloud for user `foo`.

Deployment of device apps and tokens is now managed by the `root-gadget` app.
