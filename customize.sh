#!/bin/bash

echo "Enable NetworkManager"
systemctl enable NetworkManager

echo "Create user"
useradd -m user
echo "user:user" | chpasswd
echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

echo "Enable multilib (for Steam)"
sed -i '/\[multilib\]/,/Include/s/^#//' /etc/pacman.conf
pacman -Sy

echo "Install Steam"
pacman -S --noconfirm steam

echo "Install yay"

su user <<'EOF'

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S --noconfirm \
linux-cachyos \
linux-cachyos-headers \
appimagelauncher \
tilix \
peazip \
stacer \
kvantum-qt6 \
pywal \
obsidian \
localsend \
cursor-bin \
opera-gx \
prismlauncher \
lunar-client \
curseforge \
davinci-resolve \
upscayl

EOF
