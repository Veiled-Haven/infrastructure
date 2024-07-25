data "openstack_networking_network_v2" "external" {
  name = "ext01"
}

resource "openstack_networking_network_v2" "network" {
  name = "int01"
}

resource "openstack_networking_subnet_v2" "subnet" {
  name            = "my_subnet"
  network_id      = openstack_networking_network_v2.network.id
  cidr            = "192.168.0.0/24"
  ip_version      = 4
  gateway_ip      = "192.168.0.1"
}

resource "openstack_networking_router_v2" "router" {
  name                = "router01"
  external_network_id = data.openstack_networking_network_v2.external.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}

resource "openstack_networking_floatingip_v2" "fip" {
  pool = "ext01"
}

output "openstack_instance_ip" {
  value = openstack_networking_floatingip_v2.fip.address
}
