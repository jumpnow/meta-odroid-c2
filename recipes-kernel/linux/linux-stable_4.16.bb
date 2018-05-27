require recipes-kernel/linux/linux-yocto.inc

COMPATIBLE_MACHINE = "odroid-c2"

RDEPENDS_kernel-base += "kernel-devicetree"

KERNEL_DEVICETREE ?= "amlogic/meson-gxbb-odroidc2.dtb"

LINUX_VERSION = "4.16"
LINUX_VERSION_EXTENSION = "-jumpnow"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-${LINUX_VERSION}:"

S = "${WORKDIR}/git"

PV = "4.16.12"
SRCREV = "e2a75b6d2e9de22858bb2bfa14fea56a2c6e4761"
SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=linux-${LINUX_VERSION}.y \
    file://defconfig \
"
