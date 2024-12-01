#!/bin/bash

# Check if the script is being run as root (sudo)
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root (use sudo)."
    exit 1
fi

# Enable rsyslog to start on boot
echo "Enabling rsyslog service to start on boot..."
sudo systemctl enable rsyslog

# Start the rsyslog service immediately
echo "Starting rsyslog service..."
sudo systemctl start rsyslog

# Hardcode remote syslog server IP and port
echo "Configuring remote syslog server..."

# Append the remote syslog configuration to /etc/rsyslog.conf
echo "*.* @@4.240.112.210:9997" | sudo tee -a /etc/rsyslog.conf

# Restart the rsyslog service to apply the changes
echo "Restarting rsyslog service to apply new configuration..."
sudo systemctl restart rsyslog

# Check the status of rsyslog service to ensure it is running
echo "Checking rsyslog service status..."
sudo systemctl status rsyslog

echo "Rsyslog configuration and setup completed successfully."
