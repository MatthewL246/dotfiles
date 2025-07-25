# Note: these are GNU find patterns, so "*" has no special behavior for directory separators


## /boot

# Boot binaries
IgnorePath "/boot/*.img"
IgnorePath "/boot/vmlinuz-*"
# Case-insensitive to match the fallback /boot/EFI/BOOT/BOOTX64.EFI
IgnorePath "/boot/*.[eE][fF][iI]"

# Auto-generated bootloader files
IgnorePath "/boot/loader/entries.srel"
IgnorePath "/boot/loader/random-seed"


## /etc

# Auto-generated config files
IgnorePath "/etc/.pwd.lock"
IgnorePath "/etc/.updated"
IgnorePath "/etc/adjtime"
IgnorePath "/etc/group-"
IgnorePath "/etc/gshadow-"
IgnorePath "/etc/ld.so.cache"
# Technically, this is supposed to be persistent and confidential, but I don't use it for anything, so it should be fine to let systemd regenerate it if needed
IgnorePath "/etc/machine-id"
IgnorePath "/etc/os-release"
IgnorePath "/etc/pacman.d/gnupg/*"
# Generated by reflector
IgnorePath "/etc/pacman.d/mirrorlist"
IgnorePath "/etc/passwd-"
IgnorePath "/etc/printcap"
IgnorePath "/etc/shadow-"
# Managed by package install scripts
IgnorePath "/etc/shells"
IgnorePath "/etc/subuid-"
IgnorePath "/etc/subgid-"

# Auto-generated SSL certificates
IgnorePath "/etc/ca-certificates/extracted/*"
IgnorePath "/etc/ssl/certs/*"

# Unnecessary parts of NetworkManager connections that can be safely regenerated on new systems
function NetworkManagerConnectionFilter() {
    grep --invert-match --extended-regexp "^(timestamp|uuid)="
}
AddFileContentFilter "/etc/NetworkManager/system-connections/*.nmconnection" NetworkManagerConnectionFilter

# CUPS old/backup config files
IgnorePath "/etc/cups/*.O"
# CUPS subscriptions: seems to track ephemeral notification subscriptions
IgnorePath "/etc/cups/subscriptions.conf"

# Unnecessary parts of CUPS config files
function CupsPrintersConfFilter() {
    grep --invert-match --extended-regexp "^(State|StateTime|ConfigTime|Reason) |Attribute marker-"
}
AddFileContentFilter "/etc/cups/printers.conf" CupsPrintersConfFilter

# Secrets
IgnorePath "/etc/cryptsetup-keys.d/*"

## /usr

# Auto-generated files
IgnorePath "/usr/lib/avahi/service-types.db*"
IgnorePath "/usr/lib/gdk-pixbuf-*/loaders.cache"
IgnorePath "/usr/lib/gio/modules/giomodule.cache"
IgnorePath "/usr/lib/gtk-*/giomodule.cache"
IgnorePath "/usr/lib/gtk-*/immodules.cache"
IgnorePath "/usr/lib/locale/locale-archive"
IgnorePath "/usr/lib/modules/*"
IgnorePath "/usr/lib/python3.*/__pycache__/*"
IgnorePath "/usr/lib/udev/hwdb.bin"
IgnorePath "/usr/lib/utempter/utempter"
IgnorePath "/usr/lib/vlc/plugins/plugins.dat"
IgnorePath "/usr/lib32/gconv/gconv-modules.cache"
IgnorePath "/usr/share/applications/mimeinfo.cache"
IgnorePath "/usr/share/glib-2.0/schemas/gschemas.compiled"
IgnorePath "/usr/share/icons/*/icon-theme.cache"
IgnorePath "/usr/share/info/dir"
IgnorePath "/usr/share/mime/*"

# Files with properties automatically modified
IgnorePath "/usr/bin/groupmems"

# Secure-Boot-signed systemd-boot files (managed by sbctl)
IgnorePath "/usr/lib/systemd/boot/efi/*.signed"

## /var

# Auto-generated files
IgnorePath "/var/.updated"

# Unnecessary program state information
IgnorePath "/var/lib/bluetooth/*"
IgnorePath "/var/lib/boltd/version"
IgnorePath "/var/lib/dbus/*"
IgnorePath "/var/lib/fwupd/*"
IgnorePath "/var/lib/iwd/*"
IgnorePath "/var/lib/lastlog/*"
IgnorePath "/var/lib/libuuid/*"
IgnorePath "/var/lib/machines/*"
IgnorePath "/var/lib/NetworkManager/*"
IgnorePath "/var/lib/passim/*"
IgnorePath "/var/lib/plocate/CACHEDIR.TAG"
IgnorePath "/var/lib/plocate/plocate.db"
IgnorePath "/var/lib/plymouth/boot-duration"
IgnorePath "/var/lib/portables/*"
IgnorePath "/var/lib/private/*"
IgnorePath "/var/lib/systemd/*"
IgnorePath "/var/lib/tailscale/*"
IgnorePath "/var/lib/tpm2-tss/*"
IgnorePath "/var/lib/upower/*"

# SDDM's "home" directory
IgnorePath "/var/lib/sddm/.cache/*"

# Annoying empty directories
IgnorePath "/var/lib/lastlog"
IgnorePath "/var/lib/libuuid"
IgnorePath "/var/lib/machines"
IgnorePath "/var/lib/portables"
IgnorePath "/var/lib/power-profiles-daemon"
IgnorePath "/var/lib/private"

# Secure Boot keys should be unique per device, and it would honestly be easier to just regenerate them and reset the UEFI back to setup mode than store them safely
IgnorePath "/var/lib/sbctl/GUID"
IgnorePath "/var/lib/sbctl/keys/*"

# Pacman database
IgnorePath "/var/lib/pacman/local/*"
IgnorePath "/var/lib/pacman/sync/*"

# Logs and temporary files
IgnorePath "/var/log/*"
IgnorePath "/var/tmp/*"

# Spool
IgnorePath "/var/spool/*"

## Other

# Swapfile
# TODO: not declarative
IgnorePath "/swap/swapfile"
