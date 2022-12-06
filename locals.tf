# Example to use locals instead of variables
# Change 'for_each = var.xxx' to 'for_each = local.xxx'

locals {
  tags = {
    "TERRAFORM" = {
      color   = "color41"
      comment = "Objects created with Terraform"
    }
  }
  objects = {
    "NET4_TERRAFORM" = {
      type  = "ip-netmask"
      value = "10.20.30.0/24"
      tags  = ["CLIENTS", "TERRAFORM"]
    }
  }
}
