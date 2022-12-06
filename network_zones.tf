resource "panos_zone" "inside" {
  name = "INSIDE"
  mode = "layer3"
  interfaces = [
    panos_ethernet_interface.eth1-2.name
  ]
  enable_user_id = true
  # zone_profile = "CLIENTS"

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_zone" "outside" {
  name = "OUTSIDE"
  mode = "layer3"
  interfaces = [
    panos_ethernet_interface.eth1-1.name
  ]
  enable_user_id = false
  # zone_profile = "CLIENTS"

  lifecycle {
    create_before_destroy = true
  }
}
