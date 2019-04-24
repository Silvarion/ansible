# General Ansible Playbooks Repository

## Available Roles

* **aws-cli**
    * AWS CLI Installation for Linux and Windows
* **elasticsearch-base**
    * Installs Elasticsearch packages repo in Linux
* **elasticsearch-filebeat**
    * Requires the _elasticsearch-base_ playbook to run first.
    * Installs Filebeat in linux hosts.
    * Post-installation configuration required
* **elasticsearch-kibana**
    * Requires the _elasticsearch-base_ playbook to run first.
    * Installs Kibana in linux hosts.
    * Post-installation configuration required
* **elasticsearch-logstash**
    * Requires the _elasticsearch-base_ playbook to run first.
    * Installs Logstash in linux hosts.
    * Post-installation configuration required
* **elasticsearch-metricbeat**
    * Requires the _elasticsearch-base_ playbook to run first.
    * Installs Metricbeat in linux hosts.
    * Post-installation configuration required
* **elasticsearch-node**
    * Requires the _elasticsearch-base_ playbook to run first.
    * Installs Elasticsearch in linux hosts.
    * Post-installation configuration required
* **linux-base**
    * Common tools used in Linux
        * GIT
        * htop
        * Midnight Commander
        * Nano
        * PV: Pipe progress bar
        * vim
* **linux-dotnet-core**
    * Linux .Net Core for Powershell Core
* **linux-java8-openjdk**
    * Installs OpenJDK 8 and removes any packages from version 6 and 7
* **linux-mysql-57**
    * Requires: _mysql-base_
    * Installs MySQL Community Server 5.7
* linux-mysql-80
    * Requires: _mysql-base_
    * Installs MySQL Community Server 8.0
* linux-mysql-base
    * Installs MySQL Packages repo in Linux hosts
* linux-mysql-cluster-75
* linux-ndb-router
* linux-passwdless-sudoer
* linux-workstation
* python

## Available Playbooks

## TO-DOs

## Ansible Setup for Linux Academy hosts
    ansible-playbook