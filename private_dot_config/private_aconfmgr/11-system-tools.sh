## System tools and services

## Automatic TRIM for SSDs
CreateLink /etc/systemd/system/timers.target.wants/fstrim.timer /usr/lib/systemd/system/fstrim.timer


## Firmware updates
AddPackage fwupd
# Used for fwupd UEFI updates
AddPackage udisks2

# fwupd configuration
CopyFile /etc/fwupd/remotes.d/lvfs-testing.conf
CopyFile /etc/fwupd/remotes.d/lvfs.conf
CreateLink /etc/systemd/system/timers.target.wants/fwupd-refresh.timer /usr/lib/systemd/system/fwupd-refresh.timer


## Tools for UEFI and TPM management
AddPackage efibootmgr
AddPackage efitools
AddPackage mokutil
AddPackage tpm2-tools


## Firewall
# Using nftables because I don't rely on any legacy iptables stuff
AddPackage iptables-nft
# Using UFW because it is simple and integrates with KDE Plasma
AddPackage ufw

# UFW configuration
CopyFile /etc/default/ufw
CopyFile /etc/ufw/applications.d/custom
CopyFile /etc/ufw/after.rules
CopyFile /etc/ufw/after6.rules
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules
CreateDir /etc/kcm_ufw
CreateLink /etc/systemd/system/multi-user.target.wants/ufw.service /usr/lib/systemd/system/ufw.service


## Pacman tools
AddPackage expac # Pacman database query utility
AddPackage reflector # Automatic mirrorlist updates
AddPackage pkgstats # Installed packages telemetry
AddPackage pacutils # Most pac* scripts
AddPackage pacman-contrib # checkupdates, some other pac* scripts, updpkgsums
AddPackage archlinux-contrib # checkservices, a few other scripts

# Automatically refresh mirrors
CopyFile /etc/xdg/reflector/reflector.conf
CreateLink /etc/systemd/system/timers.target.wants/reflector.timer /usr/lib/systemd/system/reflector.timer

# Automatically update files database
CreateLink /etc/systemd/system/timers.target.wants/pacman-filesdb-refresh.timer /usr/lib/systemd/system/pacman-filesdb-refresh.timer

# Automatically clean up cache
CreateLink /etc/systemd/system/timers.target.wants/paccache.timer /usr/lib/systemd/system/paccache.timer

# Automatically submit package statistics
CopyFile /etc/systemd/system/pkgstats.timer.d/allow-enabling.conf
CreateLink /etc/systemd/system/timers.target.wants/pkgstats.timer /usr/lib/systemd/system/pkgstats.timer


## USB utilities
AddPackage usbutils


## Locate for finding files
AddPackage plocate

# Automatically update the database
CopyFile /etc/systemd/system/plocate-updatedb.timer.d/allow-enabling.conf
CopyFile /etc/systemd/system/plocate-updatedb.timer.d/make-hourly.conf
CreateLink /etc/systemd/system/timers.target.wants/plocate-updatedb.timer /usr/lib/systemd/system/plocate-updatedb.timer


## Nvidia driver
AddPackage nvidia-open
AddPackage nvidia-settings
AddPackage nvidia-utils
AddPackage lib32-nvidia-utils

# Pacman hook that automatically updates the initramfs when the Nvidia driver is updated, necessary due to early Nvidia kernel module loading
# TODO: yet another thing that modifies mkinitramfs.conf
CopyFile /etc/pacman.d/hooks/nvidia-initramfs.hook

CreateLink /etc/systemd/system/systemd-hibernate.service.wants/nvidia-hibernate.service /usr/lib/systemd/system/nvidia-hibernate.service
CreateLink /etc/systemd/system/systemd-hibernate.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend-then-hibernate.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend.service.wants/nvidia-resume.service /usr/lib/systemd/system/nvidia-resume.service
CreateLink /etc/systemd/system/systemd-suspend.service.wants/nvidia-suspend.service /usr/lib/systemd/system/nvidia-suspend.service


## Avahi mDNS/DNS-SD discovery
AddPackage avahi
CreateLink /etc/systemd/system/dbus-org.freedesktop.Avahi.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/multi-user.target.wants/avahi-daemon.service /usr/lib/systemd/system/avahi-daemon.service
CreateLink /etc/systemd/system/sockets.target.wants/avahi-daemon.socket /usr/lib/systemd/system/avahi-daemon.socket


## Bluetooth
AddPackage bluez-utils
CreateLink /etc/systemd/system/bluetooth.target.wants/bluetooth.service /usr/lib/systemd/system/bluetooth.service
CreateLink /etc/systemd/system/dbus-org.bluez.service /usr/lib/systemd/system/bluetooth.service


## Power profiles (used in KDE Plasma)
AddPackage power-profiles-daemon
CreateLink /etc/systemd/system/graphical.target.wants/power-profiles-daemon.service /usr/lib/systemd/system/power-profiles-daemon.service


## Tailscale (TODO: not configured declaratively)
AddPackage tailscale
CreateLink /etc/systemd/system/multi-user.target.wants/tailscaled.service /usr/lib/systemd/system/tailscaled.service


## Paru AUR helper
AddPackage base-devel
AddPackage --foreign paru
CopyFile /etc/paru.conf
