SUMMARY = "A console development image customized for the rpi"
HOMEPAGE = "http://www.jumpnowtek.com"

require images/basic-dev-image.bb

IMAGE_INSTALL += " \
    firewall \
    root-upgrader \
    u-boot-scr \
    ${SECURITY_TOOLS} \
    ${WIREGUARD} \
"

export IMAGE_BASENAME = "console-image"
