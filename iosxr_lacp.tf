resource "iosxr_lacp" "lacp" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].lacp, null) != null || try(local.defaults.iosxr.devices.configuration.lacp, null) != null }
  device   = each.value.name
  mac = try(
    provider::utils::normalize_mac(
      try(local.device_config[each.value.name].lacp.system_mac, local.defaults.iosxr.devices.configuration.lacp.system_mac),
      "colon"
    ),
    null
  )
  priority = try(local.device_config[each.value.name].lacp.system_priority, local.defaults.iosxr.devices.configuration.lacp.system_priority, null)
}
