require recipes-kernel/linux/linux-yocto.inc

COMPATIBLE_MACHINE = "odroid-c2"

RDEPENDS_kernel-base += "kernel-devicetree"

KERNEL_DEVICETREE ?= "amlogic/meson-gxbb-odroidc2.dtb"

LINUX_VERSION = "4.16"
LINUX_VERSION_EXTENSION = "-jumpnow"

FILESEXTRAPATHS_prepend := "${THISDIR}/linux-stable-${LINUX_VERSION}:"

S = "${WORKDIR}/git"

PV = "4.16.1"
SRCREV = "11454943b264b548e714d8edf932ebf306e5f808"
SRC_URI = " \
    git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git;branch=linux-${LINUX_VERSION}.y \
    file://defconfig \
"
