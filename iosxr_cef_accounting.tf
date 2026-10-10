resource "iosxr_cef_accounting" "cef_accounting" {
  for_each                                                = { for device in local.devices : device.name => device if try(local.device_config[device.name].accounting, null) != null || try(local.defaults.iosxr.devices.configuration.accounting, null) != null }
  device                                                  = each.value.name
  interfaces_mpls_ipv4_rsvp_te                            = try(local.device_config[each.value.name].accounting.interfaces.mpls.ipv4_rsvp_te, local.defaults.iosxr.devices.configuration.accounting.interfaces.mpls.ipv4_rsvp_te, null)
  interfaces_segment_routing_mpls_ipv4                    = try(local.device_config[each.value.name].accounting.interfaces.segment_routing.ipv4, local.defaults.iosxr.devices.configuration.accounting.interfaces.segment_routing.ipv4, null)
  interfaces_segment_routing_mpls_ipv6                    = try(local.device_config[each.value.name].accounting.interfaces.segment_routing.ipv6, local.defaults.iosxr.devices.configuration.accounting.interfaces.segment_routing.ipv6, null)
  prefixes_ipv6_mode_per_prefix_per_nexthop_srv6_locators = try(local.device_config[each.value.name].accounting.prefixes.srv6_locators, local.defaults.iosxr.devices.configuration.accounting.prefixes.srv6_locators, null)
  segment_routing_policies_srv6_disable                   = local.device_is_25x[each.value.name] ? try(local.device_config[each.value.name].accounting.segment_routing_policies.srv6_disable, local.defaults.iosxr.devices.configuration.accounting.segment_routing_policies.srv6_disable, null) : null
}
