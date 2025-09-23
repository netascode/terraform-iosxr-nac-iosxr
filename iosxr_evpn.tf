locals {
  device_evpn = flatten([
    for device in local.devices : [
      {
        device_name      = device.name
        key              = "${device.name}-evpn"
        source_interface = try(local.device_config[device.name].evpn.source_interface, local.defaults.iosxr.configuration.evpn.source_interface, null)
      }
    ]
    if try(local.device_config[device.name].evpn, null) != null || try(local.defaults.iosxr.configuration.evpn, null) != null
  ])
}

resource "iosxr_evpn" "evpn" {
  for_each = { for evpn in local.device_evpn : evpn.key => evpn }

  device           = each.value.device_name
  source_interface = each.value.source_interface
}