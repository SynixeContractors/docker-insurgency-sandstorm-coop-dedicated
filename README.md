# Insurgency Sandstorm dedicated server
This image provides an Insurgency Sandstorm dedicated server for cooperative play.

## DEPRECATED!
This image is deprecated and will is not under development anymore.
Feel free to fork and build your own.

## Server properties
* Port: 27102
* Query port: 27131
* Max players: 40
* Checkpoint mapcycle

## System requirements
The server is not contained by the image, to keep it small.
It will download and install on first start of the container.
You will need at least **5GB** of HDD space, for the container to inflate.

## Create a GSLT (Game Server Login Token)
To start a Insurgency Sandstorm dedicated server, you need to get a GSLT from Valve first.
Go to https://steamcommunity.com/dev/managegameservers to start the process.
The game ID for Insurgency Sandstorm is 581330.
The token has to be used in the `docker run` command in the following section.

## Usage
To start the container, run `docker run -d --init --name inusrgency-sandstorm-coop-dedicated --restart unless-stopped -v insurgency-sandstorm-coop-dedicated-config:/var/insurgency/cfg -p 27102:27102 -p 27102:27102/udp -p 27131:27131 -e HOSTNAME=myservername -e PASSWORD=mypassword -e GSLT=xxx nilsramsperger/insurgency-sandstorm-coop-dedicated`.

Change the ENV variables `PASSWORD` and `HOSTNAME` as you like.
Don't forget to set `GSLT` to your GSLT token.