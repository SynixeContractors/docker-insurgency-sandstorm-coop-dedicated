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
    mv /tmp/ini/ /opt/steam/insurgency/Insurgency/Saved/Config/LinuxServer
    mv /tmp/txt/ /opt/steam/insurgency/Insurgency/Config/Server
    rm -r /tmp
    chown -R steam:steam /opt/steam/insurgency
    echo "Installation done"
}

trap term_handler SIGTERM
[ ! -d "/opt/steam/insurgency/Insurgency/Binaries" ] && install
#loadConfig
echo "Starting Insurgency Sandstorm Dedicated Server"
cd /opt/steam/insurgency/Insurgency/Binaries/Linux
su steam -c "./InsurgencyServer-Linux-Shipping ?Password=$PASSWORD -Port=27102 -QueryPort=27131 -log -hostname=\"$HOSTNAME\" -NoEAC -MapCycle=MapCycle" & wait ${!}
echo "Insurgency Sandstorm Dedicated Server died"
shutdown