## Secure Boot and unified kernel image configuration

# UKI generation
AddPackage systemd-ukify

CopyFileTo /etc/mkinitcpio.d/linux.preset-uki-enabled /etc/mkinitcpio.d/linux.preset
CopyFile /etc/cmdline.d/root.conf
CopyFile /etc/crypttab.initramfs 600

# Apparently necessary to do this even when a file is removed - seems like an aconfmgr bug
SetFileProperty /boot/loader/entries/arch-fallback.conf mode ''
SetFileProperty /boot/loader/entries/arch.conf mode ''
RemoveFile /boot/loader/entries/arch.conf
RemoveFile /boot/loader/entries/arch-fallback.conf
RemoveFile /boot/EFI/Linux
RemoveFile /boot/EFI

# Secure Boot signing
# TODO: This is not declarative - enrolling the keys and setting up TPM unlocking requires manual setup
AddPackage sbctl

CreateFile /var/lib/sbctl/bundles.json >/dev/null
CopyFile /var/lib/sbctl/files.json
