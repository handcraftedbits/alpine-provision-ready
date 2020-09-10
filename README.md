# alpine-provision-ready

Used to create an ISO that installs [Alpine Linux](https://alpinelinux.org) onto a VM or a bare
metal machine, completely unattended.  By default version little will be installed, so you should
use another provisioning tool to install necessary software.

## Usage

```sh
  docker run -it --rm -v $(pwd)/iso:/iso -e ISO_GID=$(id -g) -e ISO_UID=$(id -u) handcraftedbits/alpine-provision-ready
```
