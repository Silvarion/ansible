#!/bin/bash
sudo su -

# EBS Configuration
/sbin/parted -a optimal /dev/xvde mklabel gpt mkpart primary 0% 100% --script
mkfs.xfs -f /dev/xvde1
mount -t xfs /dev/xvde1 /var/lib/elasticsearch
chown elasticsearch:elasticsearch /var/lib/elasticsearch

# Persist the mount on fstab
echo '/dev/xvdf1  /var/lib/elasticsearch xfs  defaults  0  0' >> /etc/fstab

# Elastic Search Configuration
echo 'cluster.name: <env>-es-cluster' >> /etc/elasticsearch/elasticsearch.yml
echo 'node.master: false' >> /etc/elasticsearch/elasticsearch.yml
echo 'node.data: true' >> /etc/elasticsearch/elasticsearch.yml
echo 'node.ingest: true' >> /etc/elasticsearch/elasticsearch.yml
echo 'network.host: _site_' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.zen.hosts_provider: ec2' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.zen.ping_timeout: 15s' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.zen.minimum_master_nodes: 2' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.any_group: true' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.host_type: private_ip' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.tag.Service: elasticsearch' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.tag.Environment: <env>' >> /etc/elasticsearch/elasticsearch.yml
echo 'discovery.ec2.endpoint: ec2.cn-northwest-1.amazonaws.com.cn' >> /etc/elasticsearch/elasticsearch.yml

# Start Elasticsearch
systemctl daemon-reload
systemctl enable elasticsearch.service
systemctl start elasticsearch.service
