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
# |_______| |_______|    Tested on Manjaro Qonos
#
#
#
#

# test for required commands
command -v unzip >/dev/null 2>&1 || { echo >&2 "I require unzip but it's not installed. Aborting."; exit 1; }

TEMPDIR=$(readlink -f "@temp")
VST=$(readlink -f "/usr/lib/vst")
VST3=$(readlink -f "/usr/lib/vst3")
AUDIOASSAULT=$(readlink -f "/usr/lib/vst/Audio Assault")
AUDIOASSAULTBIN=$(readlink -f "/opt/Audio Assault")

# install subrutine
aa_install () {
    echo "installing..."

    # installing required libcurl-gnutls
    # sudo pacman -S libcurl-gnutls

    # check if @temp exists
    if [ ! -d "$TEMPDIR" ]; then
        # Create dir if doesn't exists
        mkdir @temp
        # Unzip Audio Assult Sofware
        #EX
        unzip -q 'SigmaEXFeb27.zip' -d "$TEMPDIR"/SigmaEX
        unzip -q 'DualityEXInstallers.zip' -d "$TEMPDIR"/DualityEX
        #v3
        unzip -q 'AHMv3.zip' -d "$TEMPDIR"/AHM5050
        #v2
        unzip -q 'Sigma v2 upd103.zip' -d "$TEMPDIR"/Sigma
        unzip -q 'RVXX v2 upd103.zip' -d "$TEMPDIR"/RVXX
        #v1
        unzip -q 'Duality Bass Studio 1.2.51 Installer.zip' -d "$TEMPDIR"/Duality
        unzip -q 'RVXX Installer 1.0.1.zip' -d "$TEMPDIR"/RVXX
        unzip -q 'Sigma 102.zip' -d "$TEMPDIR"/Sigma
        unzip -q 'Blacksun+Installers+v1.zip' -d "$TEMPDIR"/BlackSun
        
    fi

    # clean mac Files from installers
    find "$TEMPDIR" -name '.DS_Store' -exec rm -rf {} \;

    # check if /usr/lib/vst/Audio Assault exists
    if [ ! -d "$AUDIOASSAULT" ]; then
    # Create dir if doesn't exists
        sudo mkdir "$AUDIOASSAULT"
    fi

    # copy VST files
    #EX
    sudo cp -r "$TEMPDIR/SigmaEX/Sigma EX Linux/Linux/Sigma EX vst2.so" "$AUDIOASSAULT"
    sudo cp -r "$TEMPDIR/DualityEX/Duality EX Linux/Duality EX vst2.so" "$AUDIOASSAULT"
    sudo cp -r "$TEMPDIR/SigmaEX/Sigma EX Linux/Linux/Sigma EX.vst3" "$VST3"
    sudo cp -r "$TEMPDIR/DualityEX/Duality EX Linux/Duality EX.vst3" "$VST3"
    #v3
    sudo cp -r "$TEMPDIR/AHM5050/AHM5050v3 Linux/AHM 5050 v3 vst2.so" "$AUDIOASSAULT"
    #v2
    sudo cp -r "$TEMPDIR/Sigma/Sigma v2/Sigma v2 Linux/Sigma v2.so" "$AUDIOASSAULT"
    sudo cp -r "$TEMPDIR/RVXX/RVXX v2/RVXX v2 Linux/RVXX v2.so" "$AUDIOASSAULT"
    #v1
    sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality Bass Studio.so" "$AUDIOASSAULT"
    sudo cp -r "$TEMPDIR/Sigma/SigmaVST 102.so" "$AUDIOASSAULT"
    sudo cp -r "$TEMPDIR/RVXX/RVXX Installer 1.0.1/RVXX Linux /RVXX VST 101.so" "$AUDIOASSAULT"
    sudo cp -r "$TEMPDIR/BlackSun/Blacksun Linux/Blacksunvst2.so" "$AUDIOASSAULT"

    # check if /opt/Audio exists
    if [ ! -d "$AUDIOASSAULTBIN" ]; then
    # Create dir if doesn't exists
        sudo mkdir "$AUDIOASSAULTBIN"
        sudo mkdir "$AUDIOASSAULTBIN/RVXX"
        sudo mkdir "$AUDIOASSAULTBIN/Sigma"
        sudo mkdir "$AUDIOASSAULTBIN/Sigma EX"
        sudo mkdir "$AUDIOASSAULTBIN/Duality EX"
        sudo mkdir "$AUDIOASSAULTBIN/Duality"
        sudo mkdir "$AUDIOASSAULTBIN/Blacksun"
        sudo mkdir "$AUDIOASSAULTBIN/AHM5050"

    fi

    # copy Stand Alone
    #EX
    sudo cp -r "$TEMPDIR/SigmaEX/Sigma EX Linux/Linux/Sigma EX" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/SigmaEX/Sigma EX Linux/Linux/Sigma EX Standalone" "$AUDIOASSAULTBIN/Sigma EX"
    sudo cp -r "$TEMPDIR/DualityEX/Duality EX Linux/Duality EX" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/DualityEX/Duality EX Linux/Duality EX Standalone" "$AUDIOASSAULTBIN/Duality EX"

    #v3
    sudo cp -r "$TEMPDIR/AHM5050/AHM5050v3 Linux/AHM5050" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/AHM5050/AHM5050v3 Linux/AHM 5050 v3 Standalone" "$AUDIOASSAULTBIN/AHM5050"

    #v2
    sudo cp -r "$TEMPDIR/RVXX/RVXX v2/RVXX v2 Linux/RVXX" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/RVXX/RVXX v2/RVXX v2 Linux/RVXX v2 Standalone" "$AUDIOASSAULTBIN/RVXX"
    
    sudo cp -r "$TEMPDIR/Sigma/Sigma v2/Sigma v2 Linux/Sigma" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/Sigma/Sigma v2/Sigma v2 Linux/Sigma v2 Standalone" "$AUDIOASSAULTBIN/Sigma"

    # v1
    sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/Duality/Linux 1.2.5/Duality Bass Studio" "$AUDIOASSAULTBIN/Duality"

    sudo cp -r "$TEMPDIR/RVXX/RVXX Installer 1.0.1/RVXX Linux /RVXX STANDALONE 101" "$AUDIOASSAULTBIN/RVXX"
    sudo cp -r "$TEMPDIR/Sigma/Sigma Standalone 102" "$AUDIOASSAULTBIN/Sigma"

    sudo cp -r "$TEMPDIR/BlackSun/Blacksun Linux/Blacksun" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/BlackSun/Blacksun Linux/Blacksun Standalone" "$AUDIOASSAULTBIN/Blacksun"

    #chmod 777
    sudo chmod -R 777 "$AUDIOASSAULTBIN/Duality/"
    sudo chmod -R 777 "$AUDIOASSAULTBIN/RVXX/"
    sudo chmod -R 777 "$AUDIOASSAULTBIN/Sigma/"
    sudo chmod -R 777 "$AUDIOASSAULTBIN/Sigma EX/"
    sudo chmod -R 777 "$AUDIOASSAULTBIN/Duality EX/"
    sudo chmod -R 777 "$AUDIOASSAULTBIN/Blacksun/"
    sudo chmod -R 777 "$AUDIOASSAULTBIN/AHM5050/"

    # chmod
    #EX
    sudo chmod +x "$AUDIOASSAULTBIN/Sigma EX/Sigma EX Standalone"
    sudo chmod +x "$AUDIOASSAULTBIN/Duality EX/Duality EX Standalone"
    #v3
    sudo chmod +x "$AUDIOASSAULTBIN/AHM5050/AHM 5050 v3 Standalone"

    #v2
    sudo chmod +x "$AUDIOASSAULTBIN/RVXX/RVXX v2 Standalone"
    sudo chmod +x "$AUDIOASSAULTBIN/Sigma/Sigma v2 Standalone"
    #v1
    sudo chmod +x "$AUDIOASSAULTBIN/Duality/Duality Bass Studio"
    sudo chmod +x "$AUDIOASSAULTBIN/RVXX/RVXX STANDALONE 101"
    sudo chmod +x "$AUDIOASSAULTBIN/Sigma/Sigma Standalone 102"
    sudo chmod +x "$AUDIOASSAULTBIN/Blacksun/Blacksun Standalone"

    # usr/local/bin links
    #EX
    sudo ln -s "$AUDIOASSAULTBIN/Sigma EX/Sigma EX Standalone" "/usr/local/bin/sigma_ex"
    sudo ln -s "$AUDIOASSAULTBIN/Duality EX/Duality EX Standalone" "/usr/local/bin/duality_ex"
    #v3
    sudo ln -s "$AUDIOASSAULTBIN/AHM5050/AHM 5050 v3 Standalone" "/usr/local/bin/ahm5050_v3"

    #v2
    sudo ln -s "$AUDIOASSAULTBIN/RVXX/RVXX v2 Standalone" "/usr/local/bin/rvxx_v2"
    sudo ln -s "$AUDIOASSAULTBIN/Sigma/Sigma v2 Standalone" "/usr/local/bin/sigma_v2"
    #v1
    sudo ln -s "$AUDIOASSAULTBIN/Duality/Duality Bass Studio" "/usr/local/bin/duality-bass-studio_v1"
    sudo ln -s "$AUDIOASSAULTBIN/RVXX/RVXX STANDALONE 101" "/usr/local/bin/rvxx_v1"
    sudo ln -s "$AUDIOASSAULTBIN/Sigma/Sigma Standalone 102" "/usr/local/bin/sigma_v1"
    sudo ln -s "$AUDIOASSAULTBIN/Blacksun/Blacksun Standalone" "/usr/local/bin/blacksun_v1"

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
    #EX
    sudo rm -rf /usr/share/applications/sigma_ex.desktop
    sudo rm -rf /usr/share/applications/duality-ex.desktop
    #v3
    sudo rm -rf /usr/share/applications/ahm5050_v3.desktop
    #v2
    sudo rm -rf /usr/share/applications/rvxx_v2.desktop
    sudo rm -rf /usr/share/applications/sigma_v2.desktop
    #v1
    sudo rm -rf /usr/share/applications/duality-bass-studio_v1.desktop
    sudo rm -rf /usr/share/applications/rvxx_v1.desktop
    sudo rm -rf /usr/share/applications/sigma_v1.desktop
    sudo rm -rf /usr/share/applications/blacksun_v1.desktop

    # icons
    sudo rm -rf /usr/share/icons/ahm5050.png
    sudo rm -rf /usr/share/icons/rvxx.png
    sudo rm -rf /usr/share/icons/sigma.png
    sudo rm -rf /usr/share/icons/duality-ex.png
    sudo rm -rf /usr/share/icons/duality-bass-studio.png
    sudo rm -rf /usr/share/icons/blacksun.png

    # vst
    sudo rm -rf "$AUDIOASSAULT"

    #vst3
    sudo rm -rf "$VST3/Duality EX.vst3"
    sudo rm -rf "$VST3/Sigma EX.vst3"

    # bin
    sudo rm -rf "$AUDIOASSAULTBIN"

    #EX
    sudo rm -rf /usr/local/bin/sigma_ex
    sudo rm -rf /usr/local/bin/duality_ex
    #v3
    sudo rm -rf /usr/local/bin/ahm5050_v3
    #v2
    sudo rm -rf /usr/local/bin/rvxx_v2
    sudo rm -rf /usr/local/bin/sigma_v2
    #v1
    sudo rm -rf /usr/local/bin/duality-bass-studio_v1
    sudo rm -rf /usr/local/bin/rvxx_v1
    sudo rm -rf /usr/local/bin/sigma_v1
    sudo rm -rf /usr/local/bin/blacksun_v1

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
