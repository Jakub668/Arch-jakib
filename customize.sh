#!/bin/bash
set -e

echo ">>> Enabling display managers"
systemctl enable sddm
systemctl enable gdm
systemctl enable lightdm

echo ">>> Creating default user"
useradd -m -G wheel -s /bin/bash jakub
echo "jakub:changeme" | chpasswd

echo ">>> Setting locale"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo ">>> Setting hostname"
echo "Arch-Jakib" > /etc/hostname

echo ">>> Installing yay for AUR packages"
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay
makepkg -si --noconfirm
cd /
rm -rf /tmp/yay

echo ">>> Optional: configure Calamares"
mkdir -p /etc/calamares
# tutaj możesz wkleić swój profil Calamares np. z CachyOS/Garuda
