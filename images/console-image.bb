SUMMARY = "A console development image customized for the rpi"
HOMEPAGE = "http://www.jumpnowtek.com"

require images/basic-dev-image.bb

IMAGE_INSTALL += " \
    firewall \
    systemd-analyze systemd-bash-completion \
    u-boot-scr \
    ${WIREGUARD} \
"

export IMAGE_BASENAME = "console-image"
