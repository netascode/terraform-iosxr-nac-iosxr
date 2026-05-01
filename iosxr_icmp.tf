resource "iosxr_icmp" "icmp" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].icmp, null) != null ||
    try(local.defaults.iosxr.devices.configuration.icmp, null) != null
  }
  device                                 = each.value.name
  ipv4_source_vrf                        = try(local.device_config[each.value.name].icmp.ipv4.source_vrf, local.defaults.iosxr.devices.configuration.icmp.ipv4.source_vrf, null)
  ipv4_source_rfc                        = try(local.device_config[each.value.name].icmp.ipv4.source_rfc, local.defaults.iosxr.devices.configuration.icmp.ipv4.source_rfc, null)
  ipv4_rate_limit_unreachable_rate       = try(local.device_config[each.value.name].icmp.ipv4.rate_limit_unreachable_rate, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_rate, null)
  ipv4_rate_limit_unreachable_disable    = try(local.device_config[each.value.name].icmp.ipv4.rate_limit_unreachable_disable, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_disable, null)
  ipv4_rate_limit_unreachable_df_rate    = try(local.device_config[each.value.name].icmp.ipv4.rate_limit_unreachable_df_rate, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_df_rate, null)
  ipv4_rate_limit_unreachable_df_disable = try(local.device_config[each.value.name].icmp.ipv4.rate_limit_unreachable_df_disable, local.defaults.iosxr.devices.configuration.icmp.ipv4.rate_limit_unreachable_df_disable, null)
  ipv6_source_vrf                        = try(local.device_config[each.value.name].icmp.ipv6.source_vrf, local.defaults.iosxr.devices.configuration.icmp.ipv6.source_vrf, null)
  ipv6_source_rfc                        = try(local.device_config[each.value.name].icmp.ipv6.source_rfc, local.defaults.iosxr.devices.configuration.icmp.ipv6.source_rfc, null)
}
