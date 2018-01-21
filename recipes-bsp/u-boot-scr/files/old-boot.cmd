setenv console ttyAML0,115200
setenv fdtfile meson-gxbb-odroidc2.dtb
fatload mmc 0:1 ${fdt_addr_r} ${fdtfile}
fatload mmc 0:1 ${kernel_addr_r} uImage
setenv bootargs console=${console} root=/dev/mmcblk1p2 rw rootfstype=ext4 rootwait
booti ${kernel_addr_r} - ${fdt_addr_r}
