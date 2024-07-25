
data "vcd_nsxt_edgegateway" "edge_gateway" {
  name = "edge-gateway"
}


resource "vcd_nsxt_nat_rule" "dnat" {
  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  name        = "test-dnat-rule"
  rule_type   = "DNAT"
  description = "description"

  # Using primary_ip from edge gateway
  external_address = tolist(data.vcd_nsxt_edgegateway.edge_gateway.subnet)[0].primary_ip
  internal_address = vcd_vm.virtual_machine.network.0.ip
  logging          = false
}

resource "vcd_nsxt_firewall" "firewall" {

  edge_gateway_id = data.vcd_nsxt_edgegateway.edge_gateway.id

  rule {
    action      = "ALLOW"
    name        = "allow all IPv4 traffic"
    direction   = "IN_OUT"
    ip_protocol = "IPV4"
  }
}

output "vcd_instance_ip" {
  value = vcd_nsxt_nat_rule.dnat.external_address
}
