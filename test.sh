    
    TEMPDIR=$(readlink -f "@temp")
    VST=$(readlink -f "/usr/lib/vst")
    AUDIOASSAULT=$(readlink -f "/usr/lib/vst/Audio Assault")
    AUDIOASSAULTBIN=$(readlink -f "/opt/Audio Assault")

    # check if @temp exists
    if [ ! -d "$TEMPDIR" ]; then
        # Create dir if doesn't exists
        mkdir @temp
        # Unzip Audio Assult Sofware
        #v1
        unzip -q 'Blacksun+Installers+v1.zip' -d "$TEMPDIR"/BlackSun
        
    fi

    # clean mac Files from installers
    find "$TEMPDIR" -name '.DS_Store' -exec rm -rf {} \;

    # copy VST files
    sudo cp -r "$TEMPDIR/BlackSun/Blacksun Linux/Blacksunvst2.so" "$AUDIOASSAULT"


    # check if /opt/Audio Assault exists
    if [ ! -d "$AUDIOASSAULTBIN" ]; then
    # Create dir if doesn't exists
        sudo mkdir "$AUDIOASSAULTBIN"
    fi

    sudo cp -r "$TEMPDIR/BlackSun/Blacksun Linux/Blacksun" "$AUDIOASSAULTBIN"
    sudo cp -r "$TEMPDIR/BlackSun/Blacksun Linux/Blacksun Standalone" "$AUDIOASSAULTBIN/Blacksun"

    #chmod 777
    sudo chmod -R 777 "$AUDIOASSAULTBIN/Blacksun/"

    # chmod
    sudo chmod +x "$AUDIOASSAULTBIN/Blacksun/Blacksun Standalone"


    # usr/local/bin links
    #v1
    sudo ln -s "$AUDIOASSAULTBIN/Blacksun/Blacksun Standalone" "/usr/local/bin/blacksun_v1"