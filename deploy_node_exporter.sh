#!/bin/bash

#Setting up unit files
sudo cp Node_Exporter/node_exporter.service /etc/systemd/system/node_exporter.service

#Setting up the user, permissions
sudo useradd --no-create-home --shell /bin/false node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v0.17.0/node_exporter-0.17.0.linux-amd64.tar.gz
tar -xvf node_exporter-0.17.0.linux-amd64.tar.gz
sudo mv node_exporter-0.17.0.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

#Starting Services
sudo systemctl daemon-reload
sudo systemctl enable node_exporter
sudo systemctl start node_exporter
sudo systemctl status node_exporter