## Desktop environment

# KDE Plasma
AddPackage plasma-meta

# Reference for recommended packages: https://community.kde.org/Distributions/Packaging_Recommendations

# Choices made for providers during Plasma installation
AddPackage noto-fonts # Already required by other KDE packages
AddPackage phonon-qt6-vlc # Official and listed in the packaging recommendations
AddPackage pipewire-jack # Pipewire is the modern sound protocol
AddPackage qt6-multimedia-ffmpeg # Not sure that this one really matters, just using ffmpeg

# Default service configuration
CreateLink /etc/systemd/user/default.target.wants/xdg-user-dirs-update.service /usr/lib/systemd/user/xdg-user-dirs-update.service
CreateLink /etc/systemd/user/pipewire-session-manager.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/pipewire.service.wants/wireplumber.service /usr/lib/systemd/user/wireplumber.service
CreateLink /etc/systemd/user/sockets.target.wants/pipewire-pulse.socket /usr/lib/systemd/user/pipewire-pulse.socket
CreateLink /etc/systemd/user/sockets.target.wants/pipewire.socket /usr/lib/systemd/user/pipewire.socket

# Noto fonts default configuration
CreateLink /etc/fonts/conf.d/46-noto-mono.conf /usr/share/fontconfig/conf.default/46-noto-mono.conf
CreateLink /etc/fonts/conf.d/46-noto-sans.conf /usr/share/fontconfig/conf.default/46-noto-sans.conf
CreateLink /etc/fonts/conf.d/46-noto-serif.conf /usr/share/fontconfig/conf.default/46-noto-serif.conf
CreateLink /etc/fonts/conf.d/66-noto-mono.conf /usr/share/fontconfig/conf.default/66-noto-mono.conf
CreateLink /etc/fonts/conf.d/66-noto-sans.conf /usr/share/fontconfig/conf.default/66-noto-sans.conf
CreateLink /etc/fonts/conf.d/66-noto-serif.conf /usr/share/fontconfig/conf.default/66-noto-serif.conf

# Enable SDDM start on boot
CreateLink /etc/systemd/system/display-manager.service /usr/lib/systemd/system/sddm.service

# Basic, necessary applications
AddPackage dolphin # File manager
AddPackage konsole # Terminal
AddPackage kate # Text editor
AddPackage firefox # Browser

# Additional optional dependencies from the packaging recommendations
# Dolphin utilities
AddPackage dolphin-plugins # Extra Dolphin plugins (including ISO mounting)
AddPackage kio-admin # Safely browse and edit files as an administrator in Dolphin
AddPackage kio-gdrive # Access Google Drive files in Dolphin
AddPackage kdenetwork-filesharing # Local network file sharing support for Dolphin

# Media support
AddPackage ffmpegthumbs # Thumbnails for videos
AddPackage icoutils # Thumbnails for Windows icons (ICO, EXE, etc.)
AddPackage kdegraphics-thumbnailers # Thumbnails for PDFs and other graphics formats
AddPackage kimageformats # Support for image formats in KDE applications (AVIF, JXL, etc.)

# Applications
AddPackage kde-inotify-survey # Warns when apps are using up all inotify watches
AddPackage kdeconnect # Mobile phone control and integration with KDE
AddPackage kwalletmanager # KDE Wallet management

# Other extras
AddPackage noto-fonts-cjk # Chinese, Japanese, and Korean characters for Noto Fonts
AddPackage noto-fonts-extra # Extra variants of Noto Fonts
AddPackage xdg-desktop-portal-gtk # Sync some settings from KDE to GTK apps
AddPackage sshfs # KDE connect phone filesystem browsing
AddPackage bluez-obex # Bluetooth file sharing

# KDE user settings
CopyFile /var/lib/AccountsService/icons/matthew
CopyFile /var/lib/AccountsService/users/matthew

# KDE SDDM settings
CreateFile /etc/sddm.conf > /dev/null
CopyFile /etc/sddm.conf.d/kde_settings.conf
CopyFile /usr/share/sddm/themes/breeze/theme.conf.user

# SDDM's "home" directory
# Originally set up by KDE Settings > Colors & Themes > Login Screen (SDDM) > Apply Plasma Settings...
CopyFile /var/lib/sddm/.config/fontconfig/fonts.conf "" sddm sddm
CopyFile /var/lib/sddm/.config/kcminputrc 600 sddm sddm
CopyFile /var/lib/sddm/.config/kdeglobals 600 sddm sddm
CopyFile /var/lib/sddm/.config/kwinoutputconfig.json "" sddm sddm
CopyFile /var/lib/sddm/.config/plasmarc 600 sddm sddm
CopyFile /var/lib/sddm/.config/user-dirs.dirs 600 sddm sddm
CopyFile /var/lib/sddm/.config/user-dirs.locale "" sddm sddm
CopyFile /var/lib/sddm/state.conf

CreateDir /var/lib/sddm/.config/qtvirtualkeyboard "" sddm sddm
CreateDir /var/lib/sddm/Desktop "" sddm sddm
CreateDir /var/lib/sddm/Documents "" sddm sddm
CreateDir /var/lib/sddm/Downloads "" sddm sddm
CreateDir /var/lib/sddm/Music "" sddm sddm
CreateDir /var/lib/sddm/Pictures "" sddm sddm
CreateDir /var/lib/sddm/Public "" sddm sddm
CreateDir /var/lib/sddm/Templates "" sddm sddm
CreateDir /var/lib/sddm/Videos "" sddm sddm

SetFileProperty /var/lib/sddm/.config/fontconfig group sddm
SetFileProperty /var/lib/sddm/.config/fontconfig owner sddm
SetFileProperty /var/lib/sddm/.config group sddm
SetFileProperty /var/lib/sddm/.config mode 700
SetFileProperty /var/lib/sddm/.config owner sddm
SetFileProperty /var/lib/sddm group sddm
SetFileProperty /var/lib/sddm mode 750
SetFileProperty /var/lib/sddm owner sddm

# Monitor ICC profiles
CopyFile "/etc/icc-profiles/ASUS PB278QV.icm"


## Printer setup with CUPS

# Packages
AddPackage cups
AddPackage system-config-printer

# CUPS configuration
CopyFile /etc/cups/classes.conf 600
CopyFile /etc/cups/ppd/ET-2850.ppd 640 "" cups
CopyFile /etc/cups/ppd/HL-L2350DW.ppd 640 "" cups
CopyFile /etc/cups/printers.conf 600

# CUPS daemon
CreateLink /etc/systemd/system/multi-user.target.wants/cups.path /usr/lib/systemd/system/cups.path
CreateLink /etc/systemd/system/multi-user.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/printer.target.wants/cups.service /usr/lib/systemd/system/cups.service
CreateLink /etc/systemd/system/sockets.target.wants/cups.socket /usr/lib/systemd/system/cups.socket
