resource "panos_ethernet_interface" "eth1-1" {
  name                      = "ethernet1/1"
  vsys                      = "vsys1"
  mode                      = "layer3"
  enable_dhcp               = true
  create_dhcp_default_route = true
  dhcp_default_route_metric = 10
  management_profile        = "OUTSIDE"
  comment                   = "External network"
  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_ethernet_interface" "eth1-2" {
  name               = "ethernet1/2"
  vsys               = "vsys1"
  mode               = "layer3"
  static_ips         = ["10.100.1.1/24"]
  management_profile = "INSIDE"
  comment            = "Internal network"
  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_ethernet_interface" "eth1-3" {
  name               = "ethernet1/3"
  vsys               = "vsys1"
  mode               = "layer3"
  static_ips         = ["10.222.1.1/24"]
  management_profile = "INSIDE"
  comment            = "Internal test network"
  lifecycle {
    create_before_destroy = true
  }
}
