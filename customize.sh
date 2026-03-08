#!/bin/bash

echo "Instalacja yay"

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm

echo "Instalacja aplikacji AUR"

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

systemctl enable sddm
