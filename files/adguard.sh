#! /bin/sh

BASEDIR=/home/pi/AdGuard
IMAGE=adguard/adguardhome

NETOPT="-p 53:53/tcp -p 53:53/udp \
    -p 80:80/tcp -p 3000:3000/tcp \
    -p 443:443/tcp \
    -p 853:853/tcp"

# Use this one if we want to server DHCP (requires static IP on eth0):
# NETOPT="-p 53:53/tcp -p 53:53/udp \
#     -p 80:80/tcp -p 3000:3000/tcp \
#     -p 67:67/udp -p 68:68/tcp -p 68:68/udp \
#     -p 443:443/tcp \
#     -p 853:853/tcp"

# This can supercede the list of all -p options:
#NETOPT="--network host"


docker run -d --restart unless-stopped --name adguardhome \
    -v ${BASEDIR}/workdir:/opt/adguardhome/work \
    -v ${BASEDIR}/confdir:/opt/adguardhome/conf \
    ${NETOPT}  ${IMAGE}


