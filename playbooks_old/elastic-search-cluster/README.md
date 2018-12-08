# Elastic Search Playbook
This playbook intends to install a Elastic Search Cluster on CentOS 7
## Roles
Roles for this playbook will be Base, logstash, es-master-node
### Base
This role contains basic configuration for all nodes.
#### Usage
`ansible-playbook --ask-pass --inventory=linuxacademy base.yml`