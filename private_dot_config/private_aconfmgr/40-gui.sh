## General GUI apps

# Applications useful for Chezmoi
AddPackage kompare # 2-way diffs
AddPackage kdiff3 # 3-way merges

# G502 X mouse configuration
AddPackage piper
CreateLink /etc/systemd/system/dbus-org.freedesktop.ratbag1.service /usr/lib/systemd/system/ratbagd.service

# SQLite database browser
AddPackage sqlitebrowser
