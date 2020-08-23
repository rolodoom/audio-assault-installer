#!/bin/bash
#  _______   _______
# |  _____| |  ___  |
# | |       | |   | |    Rolando Ramos Torres (@rolodoom)
# | |       | |___| |    http://rolandoramostorres.com
# |_|       |_______|
#  _         _______     audio-assault-setup/uninstall.sh
# | |       |  ___  |
# | |       | |   | |    Uninstaller script
# | |_____  | |___| |    for Audio Assault software
# |_______| |_______|    Tested on Kubuntu 20.04 LTS
#
#
# 


TEMPDIR=$(readlink -f "@temp")
AUDIOASSAULT=$(readlink -f "$HOME/.vst/Audio Assault")
AUDIOASSAULTBIN=$(readlink -f "/opt/Audio Assault")
# @temp
sudo rm -rf "$TEMPDIR"
# desktop files
sudo rm -rf /usr/share/applications/sigma.desktop
sudo rm -rf /usr/share/applications/rvxx.desktop
sudo rm -rf /usr/share/applications/duality-bass-studio.desktop
# icons
sudo rm -rf /usr/share/icons/hicolor/48x48/apps/sigma.png
sudo rm -rf /usr/share/icons/hicolor/48x48/apps/rvxx.png
sudo rm -rf /usr/share/icons/hicolor/48x48/apps/duality-bass-studio.png
sudo rm -rf /usr/share/icons/hicolor/256x256/apps/sigma.png
sudo rm -rf /usr/share/icons/hicolor/256x256/apps/duality-bass-studio.png
# vst
rm -rf "$AUDIOASSAULT"
# bin
sudo rm -rf "$AUDIOASSAULTBIN"
sudo rm -rf /usr/local/bin/duality-bass-studio
sudo rm -rf /usr/local/bin/rvxx
sudo rm -rf /usr/local/bin/sigma