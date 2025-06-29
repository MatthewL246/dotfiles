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

# KDE user settings
CopyFile /var/lib/AccountsService/icons/matthew
CopyFile /var/lib/AccountsService/users/matthew

# Applications useful for Chezmoi
AddPackage kompare # 2-way diffs
AddPackage kdiff3 # 3-way merges

# G502 X mouse configuration
AddPackage piper
CreateLink /etc/systemd/system/dbus-org.freedesktop.ratbag1.service /usr/lib/systemd/system/ratbagd.service
