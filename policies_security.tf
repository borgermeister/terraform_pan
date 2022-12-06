resource "panos_security_rule_group" "public" {
  position_keyword   = "before"
  position_reference = panos_security_rule_group.internet.rule[0].name
  for_each           = var.public_policies
  rule {
    name                  = each.key
    group_tag             = each.value.group_tag
    tags                  = each.value.tags
    source_zones          = each.value.source_zones
    source_addresses      = each.value.source_addresses
    source_users          = each.value.source_users
    hip_profiles          = each.value.hip_profiles
    destination_zones     = each.value.destination_zones
    destination_addresses = each.value.destination_addresses
    applications          = each.value.applications
    services              = each.value.services
    categories            = each.value.categories
    action                = each.value.action
  }
  depends_on = [
    panos_administrative_tag.tags,
    panos_address_group.address_groups,
    panos_address_objects.addresses
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_rule_group" "internet" {
  position_keyword   = "before"
  position_reference = panos_security_rule_group.domain.rule[0].name
  rule {
    name                  = "Allow Outbound FTP"
    group_tag             = "Internet Policies"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["ftp"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
  rule {
    name                  = "Allow Outbound HTTP"
    group_tag             = "Internet Policies"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["web-browsing"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
  depends_on = [
    panos_administrative_tag.tags,
    panos_address_group.address_groups,
    panos_address_objects.addresses
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_rule_group" "domain" {
  position_keyword   = "before"
  position_reference = panos_security_rule_group.bottom.rule[0].name
  rule {
    name                  = "Allow Kerberos"
    group_tag             = "Domain Policies"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["kerberos"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "allow"
  }
  depends_on = [
    panos_administrative_tag.tags,
    panos_address_group.address_groups,
    panos_address_objects.addresses
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "panos_security_rule_group" "bottom" {
  position_keyword = "bottom"
  rule {
    name                  = "Deny something everything else"
    group_tag             = "DENY"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "deny"
  }
  rule {
    name                  = "Deny almost everything else"
    group_tag             = "DENY"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "deny"
  }
  rule {
    name                  = "Deny everything else"
    group_tag             = "DENY"
    source_zones          = ["any"]
    source_addresses      = ["any"]
    source_users          = ["any"]
    hip_profiles          = ["any"]
    destination_zones     = ["any"]
    destination_addresses = ["any"]
    applications          = ["any"]
    services              = ["application-default"]
    categories            = ["any"]
    action                = "deny"
  }
  depends_on = [
    panos_administrative_tag.tags,
    panos_address_group.address_groups,
    panos_address_objects.addresses
  ]

  lifecycle {
    create_before_destroy = true
  }
}
