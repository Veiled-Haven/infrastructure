# Ansible Role: Btrfs Docker

This Ansible role sets up Btrfs for Docker storage with subvolumes for projects and snapshot capabilities.

## Role Variables

Available variables are listed below, along with default values (see `defaults/main.yml`):

\`\`\`yaml
# List of Btrfs volumes, their mount points, and corresponding project subvolumes
btrfs_volumes:
  - device: /dev/sdX1
    mount_point: /srv/docker/volume1
    subvolumes:
      - project1
      - project2
  - device: /dev/sdX2
    mount_point: /srv/docker/volume2
    subvolumes:
      - project3
      - project4

# Docker configuration
docker_config:
  storage-driver: btrfs
  data-root: /srv/docker

# Docker service name
docker_service_name: docker
\`\`\`

## Example Playbook

\`\`\`yaml
- hosts: servers
  roles:
    - role: ansible-role-btrfs-docker
      vars:
        btrfs_volumes:
          - device: /dev/sdX1
            mount_point: /srv/docker/volume1
            subvolumes:
              - project1
              - project2
          - device: /dev/sdX2
            mount_point: /srv/docker/volume2
            subvolumes:
              - project3
              - project4
\`\`\`

## License

MIT

## Author Information

This role was created by [Your Name].
