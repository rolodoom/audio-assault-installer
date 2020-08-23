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

TEMPDIR=$(readlink -f "@temp")
VST=$(readlink -f "$HOME/.vst")
AUDIOASSAULT=$(readlink -f "$HOME/.vst/Audio Assault")
AUDIOASSAULTBIN=$(readlink -f "/opt/Audio Assault")

# install subrutine
aa_install () {
    echo "installing..."

    # check if @temp exists
    if [ ! -d "$TEMPDIR" ]; then
        # Create dir if doesn't exists
        mkdir @temp
        # Unzip Audio Assult Sofware
        unzip -q 'Duality Bass Studio 1.2.51 Installer.zip' -d "$TEMPDIR"/Duality
        unzip -q 'Sigma 102.zip' -d "$TEMPDIR"/Sigma
        unzip -q 'RVXX Installer 1.0.1.zip' -d "$TEMPDIR"/RVXX
    fi

    # clean mac Files from installers
    find "$TEMPDIR" -name '.DS_Store' -exec rm -rf {} \;

    # check if $HOME/.vst exists
    if [ ! -d "$VST" ]; then
    # Create dir if doesn't exists
        mkdir "$VST"
        mkdir "$VST/Audio Assault"
    fi

    # check if $HOME/.vst/Audio Assault exists
    if [ ! -d "$AUDIOASSAULT" ]; then
    # Create dir if doesn't exists
        mkdir "$AUDIOASSAULT"
    fi

    # copy VST files
    cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality Bass Studio.so" "$AUDIOASSAULT"
    cp -r "$TEMPDIR/Sigma/SigmaVST 102.so" "$AUDIOASSAULT"
    cp -r "$TEMPDIR/RVXX/RVXX Installer 1.0.1/RVXX Linux /RVXX VST 101.so" "$AUDIOASSAULT"

    # check if $HOME/.audio-assault Assault exists
    if [ ! -d "$AUDIOASSAULTBIN" ]; then
    # Create dir if doesn't exists
        sudo mkdir "$AUDIOASSAULTBIN"
        sudo mkdir "$AUDIOASSAULTBIN/RVXX"
        sudo mkdir "$AUDIOASSAULTBIN/Sigma"
    fi

    # copy Stand Alone
    sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality Bass Studio" "$AUDIOASSAULTBIN/Duality"
    sudo cp -r "$TEMPDIR/RVXX/RVXX Installer 1.0.1/RVXX Linux /RVXX STANDALONE 101" "$AUDIOASSAULTBIN/RVXX"
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

    echo "Done!!!"
}

# uninstall subrutine
aa_uninstall () {
    echo "Uninstalling..."

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

    echo "Done!!!"
}


# Start
echo ""
echo "**************************************"
echo "*        Audio Assault Installer     *"
echo "**************************************"
echo "Available commands:"
echo ""
echo "  [I]nstall"
echo "  [U]ninstall"
echo "  [Q]uit"
echo ""
echo -n "Command [I,U,Q]:"
read input
echo ""

# 
case "$input" in
    install|INSTALL|I|i)
    aa_install    
    ;;

    uninstall|UNINSTALL|U|u)
    aa_uninstall
    ;;
      
    quit|QUIT|Q|q|exit|EXIT|x|X) 
    echo "Bye!!!"
    ;;
    
    # NOT IMPLEMENTED
    *)
    echo "Choose an available command!!!"
    ;;

esac
