# Veiled Haven Infrastructure and Configuration

## Overview

This project contains the automation for the infrastructure and application deployments of the Veiled Haven Project utilizing OpenTofu/Terraform and Ansible.
It streamlines the process of provisioning and managing the needed resources in a cloud environment, specifically leveraging OpenStack and/or VMware Cloud Director (vcd)

## Infrastrtucture Overview

Technically, everything runs on a fairly standard Linux Virtual Machine, and could be hosted anywhere.

### Hardware/Cloud Resources

Veiled Haven currently runs on a single Virtual Machine with the following Specs:

```
System Information
==================
Hostname: pig
OS: Ubuntu 24.04 LTS

CPU Information
================
Model: AMD EPYC 7543
Cores: 8

Memory Information
===================
Mem:  16Gi
Swap:   0B

Disk Information
=================
Root Volume  50G
Data Volume  450G
```

## OpenTofu/Terraform

The `terraform` directory contains configuration files for provisioning cloud infrastructure.
Checkout the `./terraform/README.md` for detailed information!

### Basic Usage

1. Initialize the Terraform working directory:
   ```sh
   cd terraform/openstack
   terraform init
   ```
2. Apply the Terraform configuration:
   ```sh
   terraform apply
   ```

## Ansible

The `ansible` directory contains:

- **Playbooks**: Define tasks to be executed on target machines.
- **Group Variables**: Configuration files for various services.
- **Roles**: Modular units of functionality, such as managing certificates, deploying applications, and configuring load balancers.

### Basic Usage

The folowing commands are executed within the `./ansible` directory.

1. Install the required Ansible roles:
   ```bash
   ansible-galaxy install -r requirements.yml
   ```
2. Run the Ansible playbook:
   ```bash
   ansible-playbook -i openstack.yml site.yml
   ```

## Contributing

1. Fork the repository.
2. Create a feature branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a new Pull Request.

## License

This project is licensed under the MIT License. See the `LICENSE.md` file for more details.

## Contact

For questions or support, please open an issue on the GitHub repository or contact the maintainer at [contact@veiled-haven.net](mailto:contact@veiled-haven.net).
