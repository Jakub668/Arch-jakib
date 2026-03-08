#!/bin/bash

echo "Aktualizacja systemu"
sudo pacman -Syu --noconfirm

echo "Instalacja środowisk graficznych"
sudo pacman -S --noconfirm \
gnome gnome-extra \
plasma kde-applications \
cinnamon

echo "Menedżer logowania"
sudo pacman -S --noconfirm sddm
sudo systemctl enable sddm

echo "Programy podstawowe"
sudo pacman -S --noconfirm \
firefox vlc libreoffice-fresh \
gimp inkscape obs-studio \
steam wine winetricks \
git reflector \
timeshift bitwarden-cli \
flameshot peazip \
tilix btop fastfetch \
kvantum-qt5 kvantum-qt6 \
pywal stacer \
rclone \
distrobox \
appimagelauncher \
flatpak

echo "Najlepszy menedżer plików"
sudo pacman -S --noconfirm dolphin

echo "Dodanie Flathub"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

echo "Instalacja yay (AUR)"
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..

echo "Programy z AUR"
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

echo "Optymalizacja mirrorów"
sudo reflector --latest 10 --sort rate --save /etc/pacman.d/mirrorlist

echo "Gotowe!"
