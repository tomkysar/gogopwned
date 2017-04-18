#!/bin/bash

set -e

SERVER_IP=$(host myip.opendns.com. resolver1.opendns.com | awk '/has address/ { print $4 }')

OVPN_DATA="ovpn-data"

echo "[*] Generating server config..."
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$SERVER_IP:3128
echo "[+] Generated server config..."

echo "[*] Initialzing PKI (insecurely) -- this is really bad security, but it works!"
docker run -v $OVPN_DATA:/etc/openvpn --rm -e "EASYRSA_BATCH=1" kylemanna/openvpn ovpn_initpki nopass
echo "[+] Initialized PKI..."

echo "[*] OpenVPN server starting up..."
docker run -v $OVPN_DATA:/etc/openvpn -d -p 3128:1194/udp --cap-add=NET_ADMIN kylemanna/openvpn
echo "[+] OpenVPN server up and running..."

CLIENT=client1
echo "[*] Generating client certificate..."
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn easyrsa build-client-full $CLIENT nopass
docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $CLIENT > $CLIENT.ovpn
echo "[*] Client certificate ready!"

cat <<EOF

EOF

echo "Done - exiting..."