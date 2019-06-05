# General Ansible Playbooks Repository

## Available Roles

* **aws-cli**
    * AWS CLI Installation for Linux and Windows
* **base-tools**
    * Installs common tools and repos
        * EPEL Release (RHEL distros)
        * Midnight Commander (Linux)
        * PV - Progress Bar (Linux)
        * Tops - atop/htop/iotop (Linux)
        * Lynx - Text-based web browser (Linux)
* **cassandra-node**
    * Installs Cassandra (cluster-ready)
* **couchdb-node**
    * Installs CouchDB (cluster-ready)
* **dotnet-core**
    * Linux .Net Core for Powershell Core
* **editors**
    * Installs common editors and clipboard support
        * micro
        * nano
        * vim
        * xclip (clipboard support)
* **elasticstack-base**
    * Installs Elasticsearch packages repo in Linux
* **elasticsearch-node**
    * Requires the _elasticstack-base_ playbook.
    * Installs Elasticsearch in linux hosts.
    * Post-installation configuration required
* **filebeat**
    * Requires the _elasticstack-base_ playbook.
    * Installs Filebeat in linux hosts.
    * Post-installation configuration required
* **java8-openjdk**
    * Installs OpenJDK 8 and removes any packages from version 6 and 7
* **kibana**
    * Requires the _elasticstack-base_ playbook.
    * Installs Kibana in linux hosts.
    * Post-installation configuration required
* **logstash**
    * Requires the _elasticstack-base_ playbook.
    * Installs Logstash in linux hosts.
    * Post-installation configuration required
* **metricbeat**
    * Requires the _elasticstack-base_ playbook.
    * Installs Metricbeat in linux hosts.
    * Post-installation configuration required
* **passwordless-sudoer**
* **python2**
* **python3**
* **snapd**

## Available Playbooks

## TO-DOs

## Adding interactive Username/Password request to any playbook

```
- hosts: all
  vars_prompt:
  - name: "prompt_for_user"
    prompt: "Do you want to provide remote user info [Y/n]?"
    private: no
  - name: "username"
    prompt: "Enter remote user"
    private: no
    when: prompt_for_user == "Y" or prompt_for_user == "y"
  - name: "password"
    prompt: "Enter password"
    when: prompt_for_user == "Y" or prompt_for_user == "y"
  vars:
    - ansible_ssh_pass: "{{ password }}"
    - ansible_sudo_pass: "{{ password }}"
  remote_user: "{{ username }}"
  become: yes
  become_method: sudo
```

## Ansible Setup for Linux Academy hosts
    ansible-playbook