#!/bin/bash
set -e

echo "Init pacman keys"
pacman-key --init
pacman-key --populate archlinux

echo "Enable NetworkManager"
systemctl enable NetworkManager

echo "Enable SDDM"
systemctl enable sddm

echo "Enable Plymouth"
systemctl enable plymouth-start.service

echo "Create live user"
useradd -m liveuser
passwd -d liveuser
usermod -aG wheel liveuser

sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

echo "Locale"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

echo "Hostname"
echo "arch-jakib" > /etc/hostname

echo "Install yay for AUR"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo "Install AUR packages"
yay -S --noconfirm ananicy-cpp gradience flatseal
