#!/sbin/runscript

# sudo mount -o rbind /dev/ /mnt/gentoo/dev/
# sudo mount -t proc none /mnt/gentoo/proc/
# sudo mount -o bind /sys/ /mnt/gentoo/sys/
# sudo mount -o bind /tmp/ /mnt/gentoo/tmp/
# sudo chroot /mnt/gentoo/ /bin/bash

depend() {
		need localmount
		need bootmisc
}

start() {
		ebegin "Mounting chroot directories"
		mount -o rbind /dev /mnt/gentoo/dev > /dev/null &
		mount -t proc none /mnt/gentoo/proc > /dev/null &
		mount -o bind /sys /mnt/gentoo/sys > /dev/null &
		mount -o bind /tmp /mnt/gentoo/tmp > /dev/null &
		eend $? "An error occurred while mounting chroot directories"
}

stop() {
		ebegin "Unmounting chroot directories"
		umount -f /mnt/gentoo/dev > /dev/null &
		umount -f /mnt/gentoo/proc > /dev/null &
		umount -f /mnt/gentoo/sys > /dev/null &
		umount -f /mnt/gentoo/tmp > /dev/null &
		eend $? "An error occurred while unmounting chroot directories"
}
