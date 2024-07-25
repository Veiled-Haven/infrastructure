terraform {
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = ">= 1.0.0"
    }
  }
}

provider "openstack" {
  cloud = "my_cloud"
}

