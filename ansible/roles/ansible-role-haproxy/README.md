# Ansible Role: HAProxy

An Ansible role to install, configure, and manage HAProxy on Debian-based systems.

## Role Variables

Some available variables are listed below. For the complete list and default values, see `defaults/main.yml`:

- `haproxy_manage_haproxy_cfg`: Manage HAProxy configuration file (default: `true`)
- `haproxy_manage_service`: Manage HAProxy service (default: `true`)
- `haproxy_use_debian_repo`: Use HAProxy Debian repository (default: `true`)
- `haproxy_version`: HAProxy version (used if `haproxy_use_debian_repo` is `true`)

## Example Playbook

This example playbook installs HAProxy but doesnt alter the configuration in any way
```yaml
- hosts: servers
  roles:
    - role: ansible-role-haproxy
      vars:
        haproxy_use_debian_repo: true
        haproxy_version: 2.9
        haproxy_manage_haproxy_cfg: false
        haproxy_manage_service: true
```
