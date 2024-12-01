#!/bin/bash

sudo systemctl enable rsyslog
sudo systemctl start rsyslog
echo "*.* @@4.240.112.210:9997" | sudo tee -a /etc/rsyslog.conf