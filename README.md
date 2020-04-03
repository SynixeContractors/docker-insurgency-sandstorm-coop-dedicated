# Insurgency Sandstorm dedicated server
This image provides an Insurgency Sandstorm dedicated server for cooperative play.

*Work in progress*
*Not for productive usage*

## Server properties
_tbd_

## System requirements
The server is not contained by the image, to keep it small.
It will download and install on first start of the container.
You will need at least **xGB** of HDD space, for the container to inflate.

## Usage
To start the container, run `docker run -d --init --name inusrgency-sandstorm-coop-dedicated --restart unless-stopped -v insurgency-sandstorm-coop-dedicated-config:/var/insurgency/cfg -p 27102:27102 -p 27102:27102/udp -p 27131:27131 -e HOSTNAME=myservername -e PASSWORD=mypassword nilsramsperger/insurgency-sandstorm-coop-dedicated`.

Change the ENV variables `PASSWORD` and `HOSTNAME` as you like.