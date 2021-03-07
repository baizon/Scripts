#!/bin/sh

WOL_CONFIG="[Unit]
Description=Configure Wake-up on LAN

[Service]
Type=oneshot
ExecStart=/sbin/ethtool -s eno1 wol g

[Install]
WantedBy=basic.target"
INSTALL_PATH="/etc/systemd/system/wol.service"

echo "Writing config to $INSTALL_PATH"
sudo sh -c "echo '$WOL_CONFIG' >> $INSTALL_PATH"

echo "Enabling Wake On Lan Service"
sudo systemctl enable wol.service

echo "Reloading the daemon"
sudo systemctl daemon-reload
