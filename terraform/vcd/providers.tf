terraform {
  required_providers {
    vcd = {
      source  = "vmware/vcd"
      version = ">= 3.12.0"
    }
  }
}


provider "vcd" {
}
