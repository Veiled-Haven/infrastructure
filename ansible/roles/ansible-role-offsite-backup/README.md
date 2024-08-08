# Ansible Role: offsite backups

This ansible role is very specific to the Setup in which veiled-haven runs, as it created backup precedures on a local NAS System of one of the Admins, if you cloned the infrastructure repository and are now wondering what this is about, its probably best to ignore this role, and/or get rid of it.

## configuration

This ansible role does not include the initialization of the restic repository, nor the exchange of ssh Keys.
these things need to be done manually beforehand via:

- ssh-copy-id
- restic init
