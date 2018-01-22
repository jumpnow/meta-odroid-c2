SUMMARY = "U-boot boot script for odroid-c2"
LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

COMPATIBLE_MACHINE = "odroid-c2"

DEPENDS = "u-boot-mkimage-native"

SRC_URI = "file://sd-boot.cmd"

do_compile() {
    mkimage -A arm -T script -C none -n "Boot script" -d "${WORKDIR}/sd-boot.cmd" boot.scr
}

do_install() {
    install -d ${D}/boot
    install -m 0644 boot.scr ${D}/boot
}

FILES_${PN} = "/boot"
