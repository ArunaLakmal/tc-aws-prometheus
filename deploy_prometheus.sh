#!/bin/bash

#Adding prometheus user and setting up the permissions
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus
sudo mv Prometheus/prometheus.yml /etc/prometheus
sudo cp Prometheus/prometheus.service /etc/systemd/system/prometheus.service
sudo cp Prometheus/Rules/node_rules.yml /etc/prometheus

#Download Prometheus and setting up
wget https://github.com/prometheus/prometheus/releases/download/v2.7.1/prometheus-2.7.1.linux-amd64.tar.gz
tar -xvf prometheus-2.7.1.linux-amd64.tar.gz
sudo mv prometheus-2.7.1.linux-amd64/console* /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus
sudo mv prometheus-2.7.1.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-2.7.1.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

#Setting up the service and starting
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus
sudo systemctl status prometheus
