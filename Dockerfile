FROM ubuntu:latest
ADD ./files/supervisor.sh /
RUN apt-get update \
    && apt-get install -y wget lib32gcc1 lib32tinfo5 unzip net-tools \
    && wget -O /tmp/steamcmd_linux.tar.gz http://media.steampowered.com/installer/steamcmd_linux.tar.gz \
    && mkdir -p /opt/steam \
    && tar -C /opt/steam -xvzf /tmp/steamcmd_linux.tar.gz \
    && rm /tmp/steamcmd_linux.tar.gz \
    && chmod +x /supervisor.sh \
    && apt-get remove -y unzip wget \
    && useradd -ms /bin/bash steam
ADD ./files/ini/ /tmp/ini
ADD ./files/txt/ /tmp/txt
ENV HOSTNAME Insurgency Sandstorm Dedicated Server
ENV PASSWORD ""
ENV GSLT = ""
EXPOSE 27102/udp
EXPOSE 27102
EXPOSE 27131
VOLUME ["/var/insurgency/cfg"]
CMD ["/supervisor.sh"]