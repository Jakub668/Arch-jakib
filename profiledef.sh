profile_name="arch-jakib"
iso_label="ARCH_JAKIB"
iso_publisher="Jakub"
iso_application="Arch Jakib ISO"
iso_version="$(date +%Y.%m.%d)"
install_dir="arch"

bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-x64.systemd-boot.esp'
           'uefi-x64.systemd-boot.eltorito')

arch="x86_64"

pacman_conf="pacman.conf"

airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'zstd')
