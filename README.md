# Setting Up Prometheus/Node Exporter on AWS Instance and Service Auto Discovery using Tags

Prometheus 2.7.1 will be installed and enable service auto discovery for the newly deployed instances. Also, Node Exporter 0.17.0 is used on the AWS instances to export the Node Matrices. 

Single Repository for Prometheus and Node Exporters. 

`Makefile` will be used to setup prometheus and node exporters on the instances. 

## Usage: 
`make prometheus` - Install and setup Prometheus on the Prometheus node. (install  Prometheus, setup unit files, daemon reload, enable and start the  service)

`make node` - Install the Node Exporters on the EC2 instances to export the node matrices (install Node Exporter, setup unit files, daemon reload, enable, start the service)

## AWS Service Discovery for EC2 instances

Below Job is configured to discover the EC2 instances

```
  - job_name: 'tc_kube_nodes'
    ec2_sd_configs:
      - region: us-east-1
        port: 9100
    relabel_configs:
      - source_labels: [__meta_ec2_tag_monitor]
        regex: prometheus
        action: keep
      - source_labels: [__meta_ec2_instance_id]
        target_label: instance
```

`__meta_ec2_tag_monitor` - label is used to identify the `monitor` tag  in the EC2 instances with the  value `prometheus`.

`__meta_ec2_instance_id` - pass the instance id as the `instance` label.
