# [Ansible role multi](#ansible-role-multi)

Apache 2.x for Linux.

|GitHub|GitLab|Downloads|Version|
|------|------|---------|-------|
|[![github](https://github.com/buluma/ansible-role-multi/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-multi/actions)|[![gitlab](https://gitlab.com/shadowwalker/ansible-role-multi/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-multi)|[![downloads](https://img.shields.io/ansible/role/d/buluma/multi)](https://galaxy.ansible.com/buluma/multi)|[![Version](https://img.shields.io/github/release/buluma/ansible-role-multi.svg)](https://github.com/buluma/ansible-role-multi/releases/)|

## [Example Playbook](#example-playbook)

This example is taken from [`molecule/default/converge.yml`](https://github.com/buluma/ansible-role-multi/blob/master/molecule/default/converge.yml) and is tested on each push, pull request and release.

```yaml
---
- become: true
  gather_facts: true
  hosts: all
  name: Converge
  pre_tasks:
  - apt: update_cache=yes cache_valid_time=600
    changed_when: false
    name: Update apt cache.
    when: ansible_os_family == 'Debian'
  roles:
  - role: buluma.multi
  strategy: free
  vars:
    _service_test_command:
      Alpine: /bin/sleep
      Debian: /bin/sleep
      Ubuntu-16: /bin/sleep
      Ubuntu-18: /bin/sleep
      default: /usr/bin/sleep
    alice:
      name: Alice Appleworth
      telephone: 123-456-7890
    bob:
      name: Bob Bananarama
      telephone: 987-654-3210
    service_test_command: '{{ _service_test_command[ansible_distribution ~ ''-'' ~
      ansible_distribution_major_version] | default(_service_test_command[ansible_os_family]
      | default(_service_test_command[''default''])) }}'
    users:
```

The machine needs to be prepared. In CI this is done using [`molecule/default/prepare.yml`](https://github.com/buluma/ansible-role-multi/blob/master/molecule/default/prepare.yml):

```yaml
---
- become: true
  gather_facts: false
  hosts: all
  name: Prepare
  roles:
  - role: buluma.bootstrap
```

Also see a [full explanation and example](https://buluma.github.io/how-to-use-these-roles.html) on how to use these roles.

## [Role Variables](#role-variables)

The default values for the variables are set in [`defaults/main.yml`](https://github.com/buluma/ansible-role-multi/blob/master/defaults/main.yml):

```yaml
---
apache_allow_override: All
apache_create_vhosts: true
apache_enabled: true
apache_enablerepo: ""
apache_global_vhost_settings: "DirectoryIndex index.php index.html\n"
apache_ignore_missing_ssl_certificate: true
apache_listen_ip: "*"
apache_listen_port: 80
apache_listen_port_ssl: 443
apache_mods_disabled: []
apache_mods_enabled:
- rewrite.load
- ssl.load
apache_options: -Indexes +FollowSymLinks
apache_packages_state: present
apache_remove_default_vhost: false
apache_restart_state: restarted
apache_ssl_cipher_suite: AES256+EECDH:AES256+EDH
apache_ssl_protocol: All -SSLv2 -SSLv3
apache_state: started
apache_vhosts:
- documentroot: /var/www/html
  servername: local.dev
apache_vhosts_filename: vhosts.conf
apache_vhosts_ssl: []
apache_vhosts_template: vhosts.conf.j2
apt_autostart_state: enabled
ip_from_ec2: 10.0.0.1
new_ip: 10.0.0.3
new_port: 8081
reboot_always: true
reboot_delay: 5
reboot_message: Ansible role buluma.reboot initiated a reboot.
reboot_up_delay: 10
users_create_home: true
users_cron_allow: true
users_shell: /bin/bash
users_ssh_key_directory: ssh_keys
```

## [Requirements](#requirements)

- pip packages listed in [requirements.txt](https://github.com/buluma/ansible-role-multi/blob/master/requirements.txt).

## [State of used roles](#state-of-used-roles)

The following roles are used to prepare a system. You can prepare your system in another way.

| Requirement | GitHub | GitLab |
|-------------|--------|--------|
|[buluma.bootstrap](https://galaxy.ansible.com/buluma/bootstrap)|[![Build Status GitHub](https://github.com/buluma/ansible-role-bootstrap/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-bootstrap/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-bootstrap/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-bootstrap)|
|[buluma.apache](https://galaxy.ansible.com/buluma/apache)|[![Build Status GitHub](https://github.com/buluma/ansible-role-apache/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-apache/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-apache/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-apache)|
|[buluma.cron](https://galaxy.ansible.com/buluma/cron)|[![Build Status GitHub](https://github.com/buluma/ansible-role-cron/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-cron/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-cron/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-cron)|
|[buluma.service](https://galaxy.ansible.com/buluma/service)|[![Build Status GitHub](https://github.com/buluma/ansible-role-service/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-service/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-service/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-service)|
|[buluma.systemd](https://galaxy.ansible.com/buluma/systemd)|[![Build Status GitHub](https://github.com/buluma/ansible-role-systemd/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-systemd/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-systemd/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-systemd)|
|[buluma.python_pip](https://galaxy.ansible.com/buluma/python_pip)|[![Build Status GitHub](https://github.com/buluma/ansible-role-python_pip/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-python_pip/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-python_pip/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-python_pip)|
|[buluma.reboot](https://galaxy.ansible.com/buluma/reboot)|[![Build Status GitHub](https://github.com/buluma/ansible-role-reboot/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-reboot/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-reboot/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-reboot)|
|[buluma.core_dependencies](https://galaxy.ansible.com/buluma/core_dependencies)|[![Build Status GitHub](https://github.com/buluma/ansible-role-core_dependencies/workflows/Ansible%20Molecule/badge.svg)](https://github.com/buluma/ansible-role-core_dependencies/actions)|[![Build Status GitLab](https://gitlab.com/shadowwalker/ansible-role-core_dependencies/badges/master/pipeline.svg)](https://gitlab.com/shadowwalker/ansible-role-core_dependencies)|

## [Context](#context)

This role is part of many compatible roles. Have a look at [the documentation of these roles](https://buluma.github.io/) for further information.

Here is an overview of related roles:
![dependencies](https://raw.githubusercontent.com/buluma/ansible-role-multi/png/requirements.png "Dependencies")

## [Compatibility](#compatibility)

This role has been tested on these [container images](https://hub.docker.com/u/buluma):

|container|tags|
|---------|----|
|[Fedora](https://hub.docker.com/r/buluma/fedora)|all|
|[Debian](https://hub.docker.com/r/buluma/debian)|all|
|[Ubuntu](https://hub.docker.com/r/buluma/ubuntu)|all|
|[Kali](https://hub.docker.com/r/buluma/kalilinux)|all|
|[opensuse](https://hub.docker.com/r/buluma/opensuse)|all|
|[ArchLinux](https://hub.docker.com/r/buluma/archlinux)|all|
|[Alpine](https://hub.docker.com/r/buluma/alpine)|all|

The minimum version of Ansible required is 2.4, tests have been done on:

- The previous version.
- The current version.
- The development version.

If you find issues, please register them on [GitHub](https://github.com/buluma/ansible-role-multi/issues).

## [License](#license)

[Apache-2.0](https://github.com/buluma/ansible-role-multi/blob/master/LICENSE).

## [Author Information](#author-information)

[buluma](https://buluma.github.io/)
