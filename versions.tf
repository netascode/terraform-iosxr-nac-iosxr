terraform {
  required_version = ">= 1.8.0"

  required_providers {
    iosxr = {
      source  = "CiscoDevNet/iosxr"
      version = ">= 0.6.0"
    }
    utils = {
      source  = "netascode/utils"
      version = ">= 0.2.6"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.3.0"
    }
  }
}
