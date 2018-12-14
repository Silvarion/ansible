#!/bin/bash
sudo su -

# Push Kibana Configuration
echo 'server.name: "<env>-upc-kibana-cn"' >> /etc/kibana/kibana.yml
echo "server.host: $(hostname -I)" >> /etc/kibana/kibana.yml
#echo 'server.port: 5601' >> /etc/kibana/kibana.yml
echo 'elasticsearch.url: "http://<env>-upc-elasticsearch-cluster.dev.c.upc.ubisoft.onbe"' >> /etc/kibana/kibana.yml

# Enable and start Kibana
systemctl daemon-reload
systemctl enable kibana.service
systemctl start kibana.service