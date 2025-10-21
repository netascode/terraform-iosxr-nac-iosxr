resource "iosxr_evpn" "evpn" {
  for_each         = { for device in local.devices : device.name => device if try(local.device_config[device.name].evpn, null) != null || try(local.defaults.iosxr.configuration.evpn, null) != null }
  device           = each.value.name
  source_interface = try(local.device_config[each.value.name].evpn.source_interface, local.defaults.iosxr.configuration.evpn.source_interface, null)
}
