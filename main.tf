# Configure the Panos provider
terraform {
  required_providers {
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = "~> 1.0"
    }
  }
}
