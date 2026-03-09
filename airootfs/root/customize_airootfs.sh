#!/bin/bash
set -e

echo "Init pacman keys"
pacman-key --init
pacman-key --populate archlinux

echo "Enable services"
systemctl enable NetworkManager
systemctl enable sddm
systemctl enable plymouth-start.service
systemctl enable ananicy-cpp

echo "Create live user"
useradd -m liveuser
passwd -d liveuser
usermod -aG wheel,audio,video liveuser

sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

echo "Locale"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "Hostname"
echo "arch-jakib" > /etc/hostname

echo "Enable Plymouth theme"
plymouth-set-default-theme -R arch-jakib

echo "Enable ZRAM"
mkdir -p /etc/systemd/zram-generator.conf.d
cat <<EOF > /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
EOF
