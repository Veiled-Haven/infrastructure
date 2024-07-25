
data "vcd_catalog" "catalog" {
  org  = "templates"
  name = "selfservice"
}

data "vcd_catalog_vapp_template" "ubuntu_22_04" {
  catalog_id = data.vcd_catalog.catalog.id
  name       = "ubuntu-24.04-amd64-selfservice"
}


resource "vcd_vm" "virtual_machine" {
  name             = "virtual_machine"
  vapp_template_id = data.vcd_catalog_vapp_template.ubuntu_22_04.id
  cpus             = 8
  memory           = 1000 * 16
  power_on        = true

  network {
    name               = "default-network"
    type               = "org"
    ip_allocation_mode = "POOL"
  }

  disk {
    name        = vcd_independent_disk.data_disk.name
    bus_number  = 1
    unit_number = 0
  }

  override_template_disk {
    bus_type        = "paravirtual"
    size_in_mb      = 45000
    bus_number      = 0
    unit_number     = 0
  }

 guest_properties = {
   "user-data" = base64encode(file("cloud-config.yaml"))
   "hostname" = "pig"
 }
  lifecycle {
    ignore_changes = [ power_on ]
  }
}

resource "vcd_independent_disk" "data_disk" {
  name            = "dataDisk"
  size_in_mb      = 450 * 1000
}
