# Setting Up Prometheus/Node Exporter on AWS Instance and Service Auto Discovery

Prometheus 2.7.1 will be installed and enable service auto discovery for the newly deployed instances. Also, Node Exporter 0.17.0 is used on the AWS instances to export the Node Matrices. 

Single Repository for Prometheus and Node Exporters. 

`Makefile` will be used to setup prometheus and node exporters on the instances. 

## Usage: 
`make prometheus` - Install and setup Prometheus on the Prometheus node. (install  Prometheus, setup unit files, daemon reload, enable and start the  service)

`make node` - Install the Node Exporters on the EC2 instances to export the node matrices (install Node Exporter, setup unit files, daemon reload, enable, start the service)
