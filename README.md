# GoGo In Flight WiFi for $0.007 / Hour

1. Start by spinning up a Digital Ocean Droplet ($0.007/hour) as a "One-Click-App" with Docker running on Ubuntu 16.04. 

2. Download a VPN client for your system: 

- OSX: Tunnelblick Project VPN
- Windows / Linux / iOS / Android: OpenVPN

3. SSH into the Digital Ocean Droplet. 

4. Run the following script: 

```bash
curl -L https://github.com/tomkysar/gogopwned/setup.sh | sudo bash
```

5. Once completed, scp the `client1.ovpn` file off your server to your device:

```bash
scp root@[your-box-IP] ./client1.ovpn ~/Desktop
```

6. Configure Tunnelblick / OpenVPN with the new `.ovpn` file you now have. 

7. Connect, and enjoy your $0.007 / hour WiFi from 30,000 feet above the earth!