
resource "iosxr_snmp_server_mib" "snmp_server_mib" {
  for_each           = { for device in local.devices : device.name => device if try(local.device_config[device.name].snmp_server_mibs, null) != null || try(local.defaults.iosxr.devices.configuration.snmp_server_mibs, null) != null }
  device             = each.value.name
  ifmib_ifalias_long = try(local.device_config[each.value.name].snmp_server_mibs.ifmib_ifalias_long, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifmib_ifalias_long, null)
  ifindex_persist    = try(local.device_config[each.value.name].snmp_server_mibs.ifindex_persist, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifindex_persist, null)
}
