resource "panos_virtual_router" "virtual-router" {
  name        = "default"
  static_dist = 10
  interfaces = [
    panos_ethernet_interface.eth1-1.name,
    panos_ethernet_interface.eth1-2.name,
    panos_ethernet_interface.eth1-3.name
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_static_route_ipv4" "ipsec" {
  name           = "IPSec"
  virtual_router = panos_virtual_router.virtual-router.name
  destination    = "172.16.0.0/12"
  next_hop       = "10.10.10.254"

  lifecycle {
    create_before_destroy = true
  }
}