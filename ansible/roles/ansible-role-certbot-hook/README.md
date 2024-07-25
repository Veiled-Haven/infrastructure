# Ansible Role: Certbot Hook

This Ansible role configures a system to handle SSL certificate renewals with Certbot and deploys a hook script to concatenate certificates for HAProxy. It also sets up a systemd override to use the deploy hook.

## Requirements

- Ansible 2.9 or higher
- Ubuntu/Debian-based systems (for `apt` module)
- Certbot installed and configured (see `ansible-role-certbot`)

## Role Variables

No variables are required for this role.

## Files

- `concat_certificates.sh`: A script to concatenate SSL certificates and prepare them for use with HAProxy.
- `certbot.service`: A systemd service override for Certbot to trigger the hook upon renewal.


## Dependencies

None.

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: ansible-role-certbot-hook
```

## License

MIT
