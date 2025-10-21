
resource "iosxr_snmp_server_mib" "snmp_server_mib" {
  for_each           = { for device in local.devices : device.name => device if try(local.device_config[device.name].snmp_server_mib, null) != null || try(local.defaults.iosxr.configuration.snmp_server_mib, null) != null }
  device             = each.value.name
  ifmib_ifalias_long = try(local.device_config[each.value.name].snmp_server_mib.ifmib_ifalias_long, local.defaults.iosxr.configuration.snmp_server_mib.ifmib_ifalias_long, null)
  ifindex_persist    = try(local.device_config[each.value.name].snmp_server_mib.ifindex_persist, local.defaults.iosxr.configuration.snmp_server_mib.ifindex_persist, null)
}
