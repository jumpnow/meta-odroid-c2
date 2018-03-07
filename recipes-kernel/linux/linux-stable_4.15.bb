require recipes-kernel/linux/linux-yocto.inc

COMPATIBLE_MACHINE = "odroid-c2"

RDEPENDS_kernel-base += "kernel-devicetree"

KERNEL_DEVICETREE ?= "amlogic/meson-gxbb-odroidc2.dtb"

LINUX_VERSION = "4.15"
LINUX_VERSION_EXTENSION = "-jumpnow"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-${LINUX_VERSION}:"

S = "${WORKDIR}/git"

PV = "4.15.7"
SRCREV = "cb4a115a42867def71fdcbf0d7b714f268ff37fd"
SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=linux-${LINUX_VERSION}.y \
    file://defconfig \
    file://0001-Set-eMMC-max-frequency-to-100-MHz.patch \
"
