FROM alpine:edge

ENV ISO_ARCH x86_64
ENV ISO_REPOSITORY http://dl-cdn.alpinelinux.org/alpine/edge/main
ENV ISO_TAG edge

RUN apk update
RUN apk add alpine-conf alpine-sdk apk-tools build-base busybox dosfstools fakeroot grub-efi squashfs-tools shadow \
  syslinux xorriso

# The user building the ISO has to be part of the 'abuild' group and because we're in Docker things are a lot easier if
# we run as root, so we need to set a root password, unlock the user, and add it to the group.  We also need to run
# abuild-keygen through sudo in order for it to pick up root's new group membership.

RUN usermod -p `mkpasswd password` root
RUN usermod -U -G abuild root
RUN sudo -s abuild-keygen -i -a
RUN git clone git://git.alpinelinux.org/aports

COPY container/aports/scripts/* /aports/scripts/

VOLUME /iso

WORKDIR /aports/scripts

CMD ["sh","./build.sh"]
