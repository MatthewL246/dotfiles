## Base system

# TODO: Decide how automated this should be. This could potentially run setup commands like bootctl install, mkinitcpio -P, or locale-gen, for example. However, aconfmgr doesn't seem to be designed for this, and fully automating the Arch install process is not the goal here. It really depends on what the state of the system is at the time this is run.

# Base system packages
AddPackage base
AddPackage linux
AddPackage linux-firmware
AddPackage dosfstools
AddPackage e2fsprogs
AddPackage nano

# For AMD CPUs
AddPackage amd-ucode

# For BTRFS
AddPackage btrfs-progs

# Base system configuration
CopyFile /etc/fstab
CopyFile /etc/hostname
CopyFile /etc/locale.conf
CopyFile /etc/locale.gen
CreateLink /etc/localtime /usr/share/zoneinfo/America/New_York
CreateLink /etc/systemd/system/dbus-org.freedesktop.timesync1.service /usr/lib/systemd/system/systemd-timesyncd.service
CreateLink /etc/systemd/system/getty.target.wants/getty@tty1.service /usr/lib/systemd/system/getty@.service
# Automatically created by the standard Arch installation
CreateLink /etc/systemd/system/sockets.target.wants/systemd-userdbd.socket /usr/lib/systemd/system/systemd-userdbd.socket
CreateLink /etc/systemd/user/sockets.target.wants/p11-kit-server.socket /usr/lib/systemd/user/p11-kit-server.socket


## Users and sudo

# User configuration
CopyFile /etc/group
CopyFile /etc/passwd
CopyFile /etc/subgid
CopyFile /etc/subuid

# Sudo setup
AddPackage sudo
CopyFile /etc/sudoers
CreateFile /var/db/sudo/lectured/1000 600 '' matthew > /dev/null


## Internet connection and Wi-Fi setup

# Network management packages
AddPackage networkmanager
AddPackage iwd
AddPackage wireless-regdb

# Network configuration
CopyFile /etc/NetworkManager/conf.d/use_iwd.conf
CopyFile /etc/conf.d/wireless-regdom
CreateDir /etc/iwd
CreateLink /etc/systemd/system/dbus-org.freedesktop.nm-dispatcher.service /usr/lib/systemd/system/NetworkManager-dispatcher.service
CreateLink /etc/systemd/system/multi-user.target.wants/NetworkManager.service /usr/lib/systemd/system/NetworkManager.service
CreateLink /etc/systemd/system/network-online.target.wants/NetworkManager-wait-online.service /usr/lib/systemd/system/NetworkManager-wait-online.service
# Prevent any conflicts with IWD
CreateLink /etc/systemd/system/wpa_supplicant.service /dev/null

# Systemd-resolved DNS configuration
CreateLink /etc/resolv.conf /run/systemd/resolve/stub-resolv.conf
CopyFile /etc/systemd/resolved.conf.d/dns-servers.conf
CopyFile /etc/systemd/resolved.conf.d/security.conf
CreateLink /etc/systemd/system/dbus-org.freedesktop.resolve1.service /usr/lib/systemd/system/systemd-resolved.service
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-resolved.service /usr/lib/systemd/system/systemd-resolved.service


## Boot configuration

# Initramfs configuration
CopyFile /etc/mkinitcpio.conf
CopyFile /etc/mkinitcpio.d/linux.preset

# Bootloader configuration
CreateDir /boot/EFI/Linux
CreateDir /boot/loader/keys
CopyFile /boot/loader/loader.conf 755
CopyFile /boot/loader/entries/arch-fallback.conf 755
CopyFile /boot/loader/entries/arch.conf 755


## Miscellaneous

# Offline documentation files
AddPackage man-db
AddPackage man-pages
AddPackage texinfo

# Time syncing
CreateLink /etc/systemd/system/sysinit.target.wants/systemd-timesyncd.service /usr/lib/systemd/system/systemd-timesyncd.service

# Font configuration
AddPackage terminus-font
CopyFile /etc/vconsole.conf

# Config management
AddPackage chezmoi
AddPackage git
# TODO: aconfmgr seems to leave behind base-devel when installing AUR packages by itself. Manage this better.
AddPackage --foreign aconfmgr-git
