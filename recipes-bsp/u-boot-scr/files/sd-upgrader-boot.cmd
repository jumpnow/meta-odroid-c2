setenv console ttyAML0,115200
setenv fdtfile meson-gxbb-odroidc2.dtb
setenv bootpart 0:1
setenv flagpart 0:3
setenv bootdir /boot
setenv mmcroot /dev/mmcblk1p1 ro
setenv mmcrootfstype ext4 rootwait
if test -e mmc ${flagpart} two; then
    if test -e mmc ${flagpart} two_ok; then
        setenv bootpart 0:2
        setenv mmcroot /dev/mmcblk1p2 ro
    elif test ! -e mmc ${flagpart} two_tried; then
        fatwrite mmc ${flagpart} ${fdt_addr_r} two_tried 4;
        setenv bootpart 0:2
        setenv mmcroot /dev/mmcblk1p2 ro
    fi;
elif test -e mmc ${flagpart} one; then
    if test ! -e mmc ${flagpart} one_ok; then
        if test -e mmc ${flagpart} one_tried; then
            setenv bootpart 0:2
            setenv mmcroot /dev/mmcblk1p2 ro
        else
            fatwrite mmc ${flagpart} ${fdt_addr_r} one_tried 4;
        fi;
    fi;
fi;
load mmc ${bootpart} ${fdt_addr_r} ${bootdir}/${fdtfile}
load mmc ${bootpart} ${kernel_addr_r} ${bootdir}/Image
setenv bootargs console=${console} root=${mmcroot} rootfstype=${mmcrootfstype}
booti ${kernel_addr_r} - ${fdt_addr_r}
