apt-get install -y qemu
wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/kernel-qemu-4.19.50-buster
wget https://github.com/dhruvvyas90/qemu-rpi-kernel/raw/master/versatile-pb.dtb
wget https://downloads.raspberrypi.org/raspbian_full_latest
unzip raspbian_full_latest
mv *.img raspbian_full_latest.img
qemu-system-arm -kernel kernel-qemu-4.19.50-buster -dtb versatile-pb.dtb -m 256 -M versatilepb -cpu arm1176 -serial stdio -append "rw console=ttyAMA0 root=/dev/sda2 rootfstype=ext4 loglevel=8 rootwait fsck.repair=yes memtest=1" -drive file=fullraspbian_full_latest.img,format=raw -no-reboot -vga std -nographic -vnc :0