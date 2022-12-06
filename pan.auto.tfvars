pan_hostname            = "fw999"
pan_domain              = "netsecurity.no"
pan_timezone            = "Europe/Oslo"
dns_primary             = "9.9.9.9"
dns_secondary           = "8.8.4.4"
ntp_primary             = "0.no.pool.ntp.org"
ntp_primary_auth_type   = "none"
ntp_secondary           = "1.no.pool.ntp.org"
ntp_secondary_auth_type = "none"

pan_mgmt_profile = {
  CLIENTS   = { ping = true, ssh = true, http = false, https = true, permitted_ips = ["10.100.1.0/24"] }
  INSIDE    = { ping = true, ssh = true, http = false, https = true, permitted_ips = ["10.100.1.0/24"] }
  OUTSIDE   = { ping = true, ssh = false, http = false, https = false, permitted_ips = [] }
  PING      = { ping = true, ssh = false, http = false, https = false, permitted_ips = [] }
  TERRAFORM = { ping = true, ssh = true, http = false, https = true, permitted_ips = ["10.100.1.0/24", "99.99.99.0/24"] }
  TEST      = { ping = true, ssh = false, http = true, https = false, permitted_ips = ["99.99.99.0/24", "7.7.7.7/32"] }
}

pan_tags = {
  ALLOW               = { color = "color2", comment = "Allowed traffic" }
  CLIENTS             = { color = "color2", comment = "Zone CLIENTS" }
  DENY                = { color = "color1", comment = "Denied traffic" }
  GLOBAL              = { color = "color1", comment = "Global resources" }
  INSIDE              = { color = "color2", comment = "Zone INSIDE" }
  INTERNET            = { color = "color1", comment = "Zone INTERNET" }
  LAN                 = { color = "color2", comment = "Zone LAN" }
  LOCAL               = { color = "color2", comment = "Local resources" }
  OUTSIDE             = { color = "color1", comment = "Zone OUTSIDE" }
  TERRAFORM           = { color = "color41", comment = "Objects created with Terraform" }
  "Domain Policies"   = { color = "color2", comment = "Domain policies" }
  "Internet Policies" = { color = "color6", comment = "Internet policies" }
  "Public Policies"   = { color = "color1", comment = "Public policies" }
}

pan_addresses = {
  NET4_CLASS_A        = { type = "ip-netmask", value = "10.0.0.0/8", description = "RFC1918 Class A network", tags = ["LOCAL", "TERRAFORM"] }
  NET4_CLASS_B        = { type = "ip-netmask", value = "172.16.0.0/12", description = "RFC1918 Class B network", tags = ["LOCAL", "TERRAFORM"] }
  NET4_CLASS_C        = { type = "ip-netmask", value = "192.168.0.0/16", description = "RFC1918 Class C network", tags = ["LOCAL", "TERRAFORM"] }
  NET4_NETSECURITY    = { type = "ip-netmask", value = "11.21.31.0/24", description = "Netsecurity network", tags = ["CLIENTS", "TERRAFORM"] }
  NET4_TERRAFORM      = { type = "ip-netmask", value = "10.20.30.0/24", description = "Terraform network", tags = ["CLIENTS", "TERRAFORM"] }
  NET6_GLOBAL_UNICAST = { type = "ip-netmask", value = "2000::/3", description = "IPv6 Global Unicast addresses", tags = ["GLOBAL", "TERRAFORM"] }
  NET6_LINK-LOCAL     = { type = "ip-netmask", value = "fe80::/10", description = "IPv6 Link-Local addresses", tags = ["LOCAL", "TERRAFORM"] }
}

pan_address_groups = {
  GRP4_RFC1918 = { description = "RFC1918 networks", static_addresses = ["NET4_CLASS_A", "NET4_CLASS_B", "NET4_CLASS_C"], tags = ["LOCAL", "TERRAFORM"] }
}

public_policies = {
  "Allow FTP"   = { name = "Allow Inbound FTP", group_tag = "Public Policies", tags = ["ALLOW"], source_zones = ["OUTSIDE"], source_addresses = ["NET4_NETSECURITY"], source_users = ["any"], hip_profiles = ["any"], destination_zones = ["INSIDE"], destination_addresses = ["NET4_TERRAFORM"], applications = ["ftp"], services = ["application-default"], categories = ["any"], action = "allow" }
  "Allow ICMP"  = { name = "Allow Inbound ICMP", group_tag = "Public Policies", tags = ["ALLOW"], source_zones = ["OUTSIDE"], source_addresses = ["NET4_CLASS_A"], source_users = ["any"], hip_profiles = ["any"], destination_zones = ["INSIDE"], destination_addresses = ["NET4_TERRAFORM"], applications = ["icmp"], services = ["application-default"], categories = ["any"], action = "allow" }
  "Allow SSH"   = { name = "Allow Inbound SSH", group_tag = "Public Policies", tags = ["ALLOW"], source_zones = ["OUTSIDE"], source_addresses = ["NET4_CLASS_B"], source_users = ["any"], hip_profiles = ["any"], destination_zones = ["INSIDE"], destination_addresses = ["NET4_TERRAFORM"], applications = ["ssh"], services = ["application-default"], categories = ["any"], action = "allow" }
  "Allow HTTP"  = { name = "Allow Inbound HTTP", group_tag = "Public Policies", tags = ["ALLOW"], source_zones = ["OUTSIDE"], source_addresses = ["NET4_CLASS_C"], source_users = ["any"], hip_profiles = ["any"], destination_zones = ["INSIDE"], destination_addresses = ["NET4_TERRAFORM"], applications = ["web-browsing"], services = ["application-default"], categories = ["any"], action = "allow" }
  "Allow HTTPS" = { name = "Allow Inbound HTTPS", group_tag = "Public Policies", tags = ["ALLOW"], source_zones = ["OUTSIDE"], source_addresses = ["GRP4_RFC1918"], source_users = ["any"], hip_profiles = ["any"], destination_zones = ["INSIDE"], destination_addresses = ["NET4_TERRAFORM"], applications = ["ssl"], services = ["application-default"], categories = ["any"], action = "allow" }
}
