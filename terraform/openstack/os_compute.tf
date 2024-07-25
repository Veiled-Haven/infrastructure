resource "openstack_compute_keypair_v2" "keypair" {
  name       = "my_keypair"
  public_key = file("~/.ssh/keys/id_rsa_legacy.pub")
}

data "openstack_images_image_v2" "image" {
  name = "Ubuntu 24.04"
}

data "openstack_compute_flavor_v2" "flavor" {
  name = "SCS-8V:32:100"
}

resource "openstack_compute_instance_v2" "instance" {
  name            = "hog"
  image_id        = data.openstack_images_image_v2.image.id
  flavor_id       = data.openstack_compute_flavor_v2.flavor.id
  key_pair        = openstack_compute_keypair_v2.keypair.id
  security_groups = [openstack_networking_secgroup_v2.default_secgroup.name]
  network {
    uuid = openstack_networking_network_v2.network.id
  }
  lifecycle {
    ignore_changes = [
      image_id
    ]
  }

}

resource "openstack_compute_floatingip_associate_v2" "fip_association" {
  floating_ip = openstack_networking_floatingip_v2.fip.address
  instance_id = openstack_compute_instance_v2.instance.id
}

resource "openstack_compute_volume_attach_v2" "va_1" {
  instance_id = openstack_compute_instance_v2.instance.id
  volume_id   = openstack_blockstorage_volume_v3.volume.id
}

resource "openstack_blockstorage_volume_v3" "volume" {
  name        = "data_volume"
  size        = 500
  description = "A volume for data"

}
