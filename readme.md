# easy-rsa in Docker

[![pipeline status](https://gitlab.com/kll/docker-easyrsa/badges/master/pipeline.svg)](https://gitlab.com/kll/docker-easyrsa/commits/master)

This repository contains an [easy-rsa](https://github.com/OpenVPN/easy-rsa)
installation on an Alpine Linux base image.

## Why

Easily run easy-rsa anywhere Docker is available without having to worry about
having the correct dependencies installed and correctly configured.

## Usage

Mount a volume to `/data` in the container and set the `LOCAL_USER_ID`
environment variable to your UID. You can technically skip those steps but it
will be much harder to access the resulting PKI files if you do not. I suggest
using an alias to make it super easy since generally you will be issuing
numerous commands.

```console
alias easyrsa="docker run --rm -it -v ~/.easyrsa:/data -e LOCAL_USER_ID=`id -u $USER` gslime/easyrsa easyrsa"
```

Make sure the local directory for the bind mount already exists so the
permissions will be correct.

```console
mkdir -p ~/.easyrsa
```

Then use it like you would a normal local installation of easy-rsa.

```console
# create a new PKI and generate a certificate request
easyrsa init-pki
easyrsa gen-req EntityName
```

If you would rather you can also launch a shell and then issue all the commands
from inside the container and then exit.

```console
docker run --rm -it -v ~/.easyrsa:/data -e LOCAL_USER_ID=`id -u $USER` gslime/easyrsa /bin/sh
easyrsa init-pki
easyrsa gen-req EntityName
exit
```

## License

The code in this repository, unless otherwise noted, is MIT licensed. See the [LICENSE](LICENSE) file in this repository.