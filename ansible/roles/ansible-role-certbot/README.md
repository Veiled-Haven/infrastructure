# Ansible Role: Certbot

This Ansible role installs Certbot, ensures the required dependencies are present, and generates SSL certificates using Certbot's standalone mode on a specified port.

## Requirements

- Ansible 2.9 or higher
- Ubuntu/Debian-based systems (for `apt` module)

## Role Variables

- `certificates`: A list of dictionaries containing the certificate information. Each dictionary should include:
  - `name`: The name of the certificate (used for identification purposes).
  - `email`: The email address for registration and recovery.
  - `port`: The port to use for the standalone server during certificate generation.
  - `domains`: A list of domains to include in the certificate.

Example:

```yaml
certificates:
  - name: example.com
    email: admin@example.com
    port: 8080
    domains:
      - example.com
      - www.example.com
  - name: another-example.com
    email: admin@another-example.com
    port: 8081
    domains:
      - another-example.com
      - www.another-example.com
      - api.another-example.com
```

## Dependencies

None.

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: ansible-role-certbot
  vars:
    certificates:
    - name: example.com
        email: admin@example.com
        port: 8080
        domains:
        - example.com
        - www.example.com
    - name: another-example.com
        email: admin@another-example.com
        port: 8081
        domains:
        - another-example.com
        - www.another-example.com
        - api.another-example.com
```

## License

MIT

## Author Information

This role was created by [Your Name].
