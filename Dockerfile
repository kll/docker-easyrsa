FROM gslime/alpine-base

RUN apk add --no-cache \
      easy-rsa \
      && ln -s /usr/share/easy-rsa/easyrsa /usr/bin/easyrsa

# No need to follow the normal advice to copy the contents of the easy-rsa
# directory to a new location because we won't be making any modifications
# to the default configuration and since this is docker and everything is
# ephemeral we will never be applying updates to an existing installation.
ENV EASYRSA="/usr/share/easy-rsa" EASYRSA_PKI="/data/pki"

VOLUME /data
WORKDIR /data

CMD [ "easyrsa" ]