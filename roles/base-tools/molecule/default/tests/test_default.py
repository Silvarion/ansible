import os

import testinfra.utils.ansible_runner

testinfra_hosts = testinfra.utils.ansible_runner.AnsibleRunner(
    os.environ['MOLECULE_INVENTORY_FILE']).get_hosts('all')


def test_hosts_file(host):
    f = host.file('/etc/hosts')

    assert f.exists
    assert f.user == 'root'
    assert f.group == 'root'

def test_epel_release_repo(host):
    yum_repo = int(host.check_putput("find /etc/yum.repos.d/ -type f -exec gre 'epel' '{}' \; -print | wc -l").strip())
    assert yum_repo > 0

def test_packages(host):
    assert host.package("mc").is_installed
    