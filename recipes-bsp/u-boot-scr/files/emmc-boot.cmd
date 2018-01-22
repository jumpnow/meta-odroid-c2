setenv console ttyAML0,115200
setenv fdtfile meson-gxbb-odroidc2.dtb
setenv bootpart 1:1
setenv bootdir /boot
setenv mmcroot /dev/mmcblk0p1 ro
setenv mmcrootfstype ext4 rootwait
load mmc ${bootpart} ${fdt_addr_r} ${bootdir}/${fdtfile}
load mmc ${bootpart} ${kernel_addr_r} ${bootdir}/Image
setenv bootargs console=${console} root=${mmcroot} rootfstype=${mmcrootfstype}
booti ${kernel_addr_r} - ${fdt_addr_r}
