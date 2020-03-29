#!/usr/bin/env bash

loadConfig() {
    echo "Loading config"
    yes | cp -rfa /var/insurgency/cfg/. /opt/steam/insurgency/insurgency/cfg/
}

storeConfig() {
    echo "Storing config"
    yes | cp -rfa /opt/steam/insurgency/insurgency/cfg/. /var/insurgency/cfg/
}

shutdown() {
    kill ${!}
    #storeConfig
    echo "Container stopped"
    exit 143;
}

term_handler() {
    echo "SIGTERM received"
    shutdown
}

install() {
    echo "Installing Insurgency Sandstorm Dedicated Server"
    /opt/steam/steamcmd.sh +login anonymous +force_install_dir /opt/steam/insurgency +app_update 581330 validate +quit
    #cp -a /tmp/mapcycle_cooperative.txt /opt/steam/insurgency/insurgency/
    #cp -a /tmp/cfg/. /opt/steam/insurgency/insurgency/cfg/
    #mkdir -p /opt/steam/insurgency/insurgency/scripts
    #cp -a /tmp/scripts/. /opt/steam/insurgency/insurgency/scripts/
    #rm -r /tmp/
    chown -R steam:steam /opt/steam/insurgency
    echo "Installation done"
}

trap term_handler SIGTERM
[ ! -d "/opt/steam/insurgency/Insurgency/Binaries" ] && install
#loadConfig
echo "Starting Insurgency Sandstorm Dedicated Server"
cd /opt/steam/insurgency/Insurgency/Binaries/Linux
su steam -c "./InsurgencyServer-Linux-Shipping -Port=27102 -QueryPort=27131 -log -hostname=\"WAN-Party\" -NoEAC" & wait ${!}
echo "Insurgency Sandstorm Dedicated Server died"
shutdown