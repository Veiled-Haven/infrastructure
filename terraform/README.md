# Terraform configuration

This folder contains the terraform/infrastructure configuration for Veiled Haven.


The Server was both hosted in an Openstack Cloud environment and in a VMware Cloud Director environment, the terraform configuration for either cloud can be found in their respEctive subdirectroy!

> At its core Veiled Haven is running on a, pretty simple, single Virtual Machine that could run basically anywhere.


## Provider configuration

The Provider configuration is held

### OpenStack Provider Configuration

To properly configure the OpenStack provider in Terraform, you need to use the clouds.yaml configuration file. This file contains the credentials and endpoint information required for Terraform to interact with your OpenStack cloud.

#### 1. Create or Update clouds.yaml File.

The clouds.yaml file should be located at ~/.config/openstack/clouds.yaml. If it does not exist, create it. Here's an example of what the file might look like:

```yaml
clouds:
  my-openstack:
    auth:
      auth_url: https://your-auth-url.com:5000/v3
      username: your-username
      password: your-password
      project_name: your-project-name
      user_domain_name: Default
      project_domain_name: Default
    region_name: RegionOne
    interface: public
```
#### 2. Set the Cloud in `providers.tf`

In your Terraform configuration file, set the cloud parameter to the name you specified in the clouds.yaml file:

```
provider "openstack" {
  cloud = "my-openstack"
}
```

### VCD (VMware Cloud Director) Provider Configuration

To properly configure the VMware Cloud Director (VCD) provider in Terraform, you can set specific environment variables in your shell. These variables will be automatically detected by the VCD provider to authenticate and communicate with your VCD instance.

#### 1. Set Environment Variables

Set the following environment variables in your shell before running Terraform commands:

```bash
    export VCD_URL="https://your-vcd-url.com/api"
    export VCD_USER="your-username"
    export VCD_PASSWORD="your-password"
    export VCD_ORG="your-org"
    export VCD_VDC="your-vdc"
    export VCD_AUTH_TYPE="integrated"
```

> Note: If you have a VCD api token instead of a password, you can set the `VCD_API_TOKEN` variable instead of `VCD_PASSWORD` and `VCD_USER`:

```bash
export VCD_API_TOKEN="your-token"
export VCD_AUTH_TYPE="api_token"
```

#### 2. Configure the VCD Provider in Terraform

In your Terraform configuration file, include the VCD provider without specifying any authentication details. The provider will automatically detect the environment variables:

```
provider "vcd" {}
```

That's it! By setting the environment variables and leaving the VCD provider configuration empty, Terraform will automatically pick up the authentication details from the environment and use them to connect to your VCD instance.
