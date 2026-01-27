terraform {
  required_version = ">= 1.8.0"

  required_providers {
    iosxr = {
      source  = "CiscoDevNet/iosxr"
      version = "0.6.0"
    }
    utils = {
      source  = "netascode/utils"
      version = "1.1.0-beta3"
    }
  }
}
