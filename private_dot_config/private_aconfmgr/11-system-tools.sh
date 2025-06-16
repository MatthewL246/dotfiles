## System tools and services

# Firmware updates
AddPackage fwupd
# Used for fwupd UEFI updates
AddPackage udisks2

# fwupd configuration
CopyFile /etc/fwupd/remotes.d/lvfs-testing.conf
CopyFile /etc/fwupd/remotes.d/lvfs.conf
CreateLink /etc/systemd/system/timers.target.wants/fwupd-refresh.timer /usr/lib/systemd/system/fwupd-refresh.timer
