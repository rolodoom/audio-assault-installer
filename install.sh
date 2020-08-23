#!/bin/bash
#  _______   _______
# |  _____| |  ___  |
# | |       | |   | |    Rolando Ramos Torres (@rolodoom)
# | |       | |___| |    http://rolandoramostorres.com
# |_|       |_______|
#  _         _______     audio-assault-setup/install.sh
# | |       |  ___  |
# | |       | |   | |    Install script
# | |_____  | |___| |    for Audio Assault software
# |_______| |_______|    Tested on Kubuntu 20.04 LTS
#
#
#
#

# test for required commands
command -v unzip >/dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Aborting."; exit 1; }

# check if @temp exists
TEMPDIR=$(readlink -f "@temp")
if [ ! -d "$TEMPDIR" ]; then
    # Create dir if doesn't exists
    mkdir @temp
    # Unzip Audio Assult Sofware
    unzip -q 'Duality Bass Studio 1.2.51 Installer.zip' -d "$TEMPDIR"/Duality
    unzip -q 'Sigma 102.zip' -d "$TEMPDIR"/Sigma
    unzip -q 'RVXX Installer 1.0.1' -d "$TEMPDIR"/RVVX
fi

# clean mac Files from installers
find "$TEMPDIR" -name '.DS_Store' -exec rm -rf {} \;

# check if $HOME/.vst exists
VST=$(readlink -f "$HOME/.vst")
if [ ! -d "$VST" ]; then
# Create dir if doesn't exists
    mkdir "$VST"
    mkdir "$VST/Audio Assault"
fi

# check if $HOME/.vst/Audio Assault exists
AUDIOASSAULT=$(readlink -f "$HOME/.vst/Audio Assault")
if [ ! -d "$AUDIOASSAULT" ]; then
# Create dir if doesn't exists
    mkdir "$AUDIOASSAULT"
fi

# copy VST files
cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality Bass Studio.so" "$AUDIOASSAULT"
cp -r "$TEMPDIR/Sigma/SigmaVST 102.so" "$AUDIOASSAULT"
cp -r "$TEMPDIR/RVVX/RVXX Installer 1.0.1/RVXX Linux /RVXX VST 101.so" "$AUDIOASSAULT"

# check if $HOME/.audio-assault Assault exists
AUDIOASSAULTBIN=$(readlink -f "/opt/Audio Assault")
if [ ! -d "$AUDIOASSAULTBIN" ]; then
# Create dir if doesn't exists
    sudo mkdir "$AUDIOASSAULTBIN"
    sudo mkdir "$AUDIOASSAULTBIN/RVXX"
    sudo mkdir "$AUDIOASSAULTBIN/Sigma"
fi

# copy Stand Alone
sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality" "$AUDIOASSAULTBIN"
sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality Bass Studio" "$AUDIOASSAULTBIN/Duality"
sudo cp -r "$TEMPDIR/RVVX/RVXX Installer 1.0.1/RVXX Linux /RVXX STANDALONE 101" "$AUDIOASSAULTBIN/RVXX"
sudo cp -r "$TEMPDIR/Sigma/Sigma Standalone 102" "$AUDIOASSAULTBIN/Sigma"
# chmod
sudo chmod +x "$AUDIOASSAULTBIN/Duality/Duality Bass Studio"
sudo chmod +x "$AUDIOASSAULTBIN/RVXX/RVXX STANDALONE 101"
sudo chmod +x "$AUDIOASSAULTBIN/Sigma/Sigma Standalone 102"

# usr/local/bin links
sudo ln -s "$AUDIOASSAULTBIN/Duality/Duality Bass Studio" "/usr/local/bin/duality-bass-studio"
sudo ln -s "$AUDIOASSAULTBIN/RVXX/RVXX STANDALONE 101" "/usr/local/bin/rvxx"
sudo ln -s "$AUDIOASSAULTBIN/Sigma/Sigma Standalone 102" "/usr/local/bin/sigma"


# copy .local files
sudo cp -r usr/share /usr

# Remove @temp
sudo rm -rf "$TEMPDIR"