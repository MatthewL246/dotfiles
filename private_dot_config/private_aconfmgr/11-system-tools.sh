## System tools and services

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
CreateLink /etc/systemd/system/multi-user.target.wants/ufw.service /usr/lib/systemd/system/ufw.service
CopyFile /etc/ufw/after.rules
CopyFile /etc/ufw/after6.rules
CopyFile /etc/ufw/ufw.conf
CopyFile /etc/ufw/user.rules
CopyFile /etc/ufw/user6.rules
