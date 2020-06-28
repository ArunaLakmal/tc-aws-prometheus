SHELL := /usr/bin/env bash

NDEF = $(if $(value $(1)),,$(error $(1) not set))

.PHONY: prometheus node

prometheus:
        @source deploy_prometheus.sh

node:
        @source deploy_node_exporter.sh