# Crafty Controller Ansible Role

This Ansible role installs and configures the Crafty Controller using a docker-compose.yml and the `community.docker` modules.

## Variables

The following variables can be customized:

- `crafty_image`: Docker image for Crafty Controller (default: "registry.gitlab.com/crafty-controller/crafty-4").
- `crafty_version`: Version of Crafty Controller to use (default: "latest").
- `crafty_container_name`: Name of the Docker container (default: "crafty").
- `crafty_host_ports`: List of ports to bind to Crafty Controller.
- `crafty_base_data_dir`: Base directory for all Crafty data on the host (default: "/srv/docker/crafty-4").
- `crafty_timezone`: Timezone for the container (default: "Etc/UTC").

## Example Playbook

```yaml
- hosts: servers
  roles:
    - role: ansible-role-crafty
      vars:
        crafty_version: "1.1.0"
        crafty_host_ports:
          - "8443:8443"
          - "8123:8123"
          - "19132:19132/udp"
          - "25500-25600:25500-25600"
        crafty_base_data_dir: "/var/lib/crafty"
```

## Usage

1. Ensure Docker is installed on the target machines.
2. Create the base data directory specified in the `crafty_base_data_dir` variable.
3. Run the playbook to deploy the Crafty Controller.

For more details on configuring and managing Crafty Controller, refer to the official [Crafty Documentation](https://docs.craftycontrol.com).
