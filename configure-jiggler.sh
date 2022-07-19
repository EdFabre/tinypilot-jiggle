#!/bin/bash
echo "Running Jiggler installer. Requires Root"
mkdir -p /opt/scripts
systemctl stop jiggler.service
systemctl stop jiggler.timer
cp ./jiggler.* /etc/systemd/system/
cp ./tinypilot-jiggle.bash /opt/scripts/
systemctl daemon-reload
systemctl enable jiggler.timer
echo "Jiggler configuration completed. Please reboot!"
