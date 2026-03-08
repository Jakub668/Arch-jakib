#!/bin/bash

echo "Enable NetworkManager"
systemctl enable NetworkManager

echo "Install yay"

useradd -m user
echo "user:user" | chpasswd
echo "user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

su user <<'EOF'

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

yay -S --noconfirm \
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
