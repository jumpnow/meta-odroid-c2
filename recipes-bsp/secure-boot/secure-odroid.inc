DESCRIPTION = "Secure bootloader for Odroid devices supported by the hardkernel product"
SECTION = "bootloaders"
LICENSE = "GPLv2"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/GPL-2.0;md5=801f80980d171dd6425610833a22dbe6"

S = "${WORKDIR}"

SRC_URI = "file://bl1.bin.hardkernel"

do_patch[noexec] = "1"
do_configure[noexec] = "1"
do_compile[noexec] = "1"

do_install () {
	install -d ${D}/boot
    	install -m 755  ${S}/bl1.bin.hardkernel ${D}/boot
}

FILES_${PN} = "/boot"

inherit deploy

do_deploy () {
    install -d ${DEPLOYDIR}
    install -m 755  ${S}/bl1.bin.hardkernel ${DEPLOYDIR}
}

addtask deploy before do_build after do_compile

PACKAGE_ARCH = "${MACHINE_ARCH}"
