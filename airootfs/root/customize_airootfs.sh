#!/bin/bash
set -e

echo ">>> Initializing pacman keys"
pacman-key --init
pacman-key --populate archlinux

echo ">>> Enable NetworkManager"
systemctl enable NetworkManager

echo ">>> Enable SDDM"
systemctl enable sddm

echo ">>> Enable Plymouth boot splash"
plymouth-set-default-theme -R arch-jakib

echo ">>> Create live user"
useradd -m liveuser
passwd -d liveuser
usermod -aG wheel,audio,video,storage liveuser

echo ">>> Enable sudo for wheel group"
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

echo ">>> Locale configuration"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo ">>> Hostname"
echo "arch-jakib" > /etc/hostname

echo ">>> Enable zram"
mkdir -p /etc/systemd/zram-generator.conf.d
cat <<EOF > /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
EOF

echo ">>> Installing yay for AUR packages"
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo ">>> Installing AUR apps"
sudo -u liveuser yay -S --noconfirm \
ananicy-cpp \
gradience \
flatseal

echo ">>> Enable ananicy service"
systemctl enable ananicy-cpp

echo ">>> Enable Plymouth service"
systemctl enable plymouth-start.service

echo ">>> Done!"git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo "Install AUR packages"
yay -S --noconfirm ananicy-cpp gradience flatseal
