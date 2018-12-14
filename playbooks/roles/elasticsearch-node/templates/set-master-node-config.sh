#!/bin/bash
sudo su -

echo 'cluster.name: <env>-es-cluster' >> /etc/elasticsearch/elasticsearch.yml
echo 'node.master: true' >> /etc/elasticsearch/elasticsearch.yml
echo 'node.data: false' >> /etc/elasticsearch/elasticsearch.yml
echo 'node.ingest: false' >> /etc/elasticsearch/elasticsearch.yml
echo 'network.host: _site_' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.zen.hosts_provider: ec2' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.zen.ping_timeout: 15s' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.zen.minimum_master_nodes: 2' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.any_group: true' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.host_type: private_ip' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.tag.Service: elasticsearch' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.tag.Environment: <env>' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.endpoint: ec2.cn-northwest-1.amazonaws.com.cn' >> /etc/elasticsearch/elasticsearch.yml

# Enable and Start Elasticsearch
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service
