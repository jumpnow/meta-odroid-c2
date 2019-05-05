FILESEXTRAPATHS_prepend := "${THISDIR}/u-boot-2019.01:"

COMPATIBLE_MACHINE = "odroid-c2"

UBOOT_SUFFIX = "bin"
UBOOT_BINARY = "u-boot-dtb.${UBOOT_SUFFIX}"

DEPENDS += "atf-native"

SRC_URI += " \
    file://odroid-c2/aml_encrypt_gxb \
    file://odroid-c2/bl2.package  \
    file://odroid-c2/bl301.bin \
    file://odroid-c2/bl30.bin \
    file://odroid-c2/bl31.bin \
    file://0001-Add-FAT-write-support.patch \
"

do_compile_append () {
    fip_create \
        --bl30 ${WORKDIR}/odroid-c2/bl30.bin \
        --bl301 ${WORKDIR}/odroid-c2/bl301.bin \
        --bl31 ${WORKDIR}/odroid-c2/bl31.bin \
        --bl33 ${B}/${UBOOT_BINARY} \
        ${B}/fip.bin

    fip_create --dump ${B}/fip.bin

    cat ${WORKDIR}/odroid-c2/bl2.package fip.bin > ${B}/boot_new.bin

    ${WORKDIR}/odroid-c2/aml_encrypt_gxb \
        --bootsig \
        --input ${B}/boot_new.bin \
        --output ${B}/${UBOOT_BINARY}.tmp

    dd if=${B}/${UBOOT_BINARY}.tmp of=${B}/${UBOOT_BINARY} bs=512 skip=96
}
