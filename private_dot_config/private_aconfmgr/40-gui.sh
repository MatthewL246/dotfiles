## General GUI apps

# Applications useful for Chezmoi
AddPackage kompare # 2-way diffs
AddPackage kdiff3 # 3-way merges

# G502 X mouse configuration
AddPackage piper
CreateLink /etc/systemd/system/dbus-org.freedesktop.ratbag1.service /usr/lib/systemd/system/ratbagd.service

# SQLite database browser
AddPackage sqlitebrowser

# GSettings/dconf settings editor
AddPackage dconf-editor

# Steam
AddPackage steam
AddPackage ttf-liberation # Arial-compatible font

# KeePassXC password manager
AddPackage keepassxc

# YubiKey tools
AddPackage yubikey-manager
AddPackage --foreign yubico-authenticator
CreateLink /etc/systemd/system/sockets.target.wants/pcscd.socket /usr/lib/systemd/system/pcscd.socket
