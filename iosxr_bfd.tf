resource "iosxr_bfd" "bfd" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].bfd, null) != null ||
    try(local.defaults.iosxr.configuration.bfd, null) != null
  }
  device = each.value.name

  echo_latency_detect                          = try(local.device_config[each.value.name].bfd.echo_latency_detect, local.defaults.iosxr.configuration.bfd.echo_latency_detect, null)
  echo_latency_detect_percentage               = try(local.device_config[each.value.name].bfd.echo_latency_detect_percentage, local.defaults.iosxr.configuration.bfd.echo_latency_detect_percentage, null)
  echo_latency_detect_count                    = try(local.device_config[each.value.name].bfd.echo_latency_detect_count, local.defaults.iosxr.configuration.bfd.echo_latency_detect_count, null)
  echo_startup_validate_force                  = try(local.device_config[each.value.name].bfd.echo_startup_validate_force, local.defaults.iosxr.configuration.bfd.echo_startup_validate_force, null)
  echo_disable                                 = try(local.device_config[each.value.name].bfd.echo_disable, local.defaults.iosxr.configuration.bfd.echo_disable, null)
  echo_ipv4_source                             = try(local.device_config[each.value.name].bfd.echo_ipv4_source, local.defaults.iosxr.configuration.bfd.echo_ipv4_source, null)
  echo_ipv4_bundle_per_member_minimum_interval = try(local.device_config[each.value.name].bfd.echo_ipv4_bundle_per_member_minimum_interval, local.defaults.iosxr.configuration.bfd.echo_ipv4_bundle_per_member_minimum_interval, null)
  trap_singlehop_pre_mapped                    = try(local.device_config[each.value.name].bfd.trap_singlehop_pre_mapped, local.defaults.iosxr.configuration.bfd.trap_singlehop_pre_mapped, null)
  multihop_ttl_drop_threshold                  = try(local.device_config[each.value.name].bfd.multihop_ttl_drop_threshold, local.defaults.iosxr.configuration.bfd.multihop_ttl_drop_threshold, null)
  dampening_disable                            = try(local.device_config[each.value.name].bfd.dampening_disable, local.defaults.iosxr.configuration.bfd.dampening_disable, null)
  dampening_initial_wait                       = try(local.device_config[each.value.name].bfd.dampening_initial_wait, local.defaults.iosxr.configuration.bfd.dampening_initial_wait, null)
  dampening_secondary_wait                     = try(local.device_config[each.value.name].bfd.dampening_secondary_wait, local.defaults.iosxr.configuration.bfd.dampening_secondary_wait, null)
  dampening_maximum_wait                       = try(local.device_config[each.value.name].bfd.dampening_maximum_wait, local.defaults.iosxr.configuration.bfd.dampening_maximum_wait, null)
  dampening_threshold                          = try(local.device_config[each.value.name].bfd.dampening_threshold, local.defaults.iosxr.configuration.bfd.dampening_threshold, null)
  dampening_extensions_down_monitoring         = try(local.device_config[each.value.name].bfd.dampening_extensions_down_monitoring, local.defaults.iosxr.configuration.bfd.dampening_extensions_down_monitoring, null)
  dampening_bundle_member_l3_only_mode         = try(local.device_config[each.value.name].bfd.dampening_bundle_member_l3_only_mode, local.defaults.iosxr.configuration.bfd.dampening_bundle_member_l3_only_mode, null)
  dampening_bundle_member_initial_wait         = try(local.device_config[each.value.name].bfd.dampening_bundle_member_initial_wait, local.defaults.iosxr.configuration.bfd.dampening_bundle_member_initial_wait, null)
  dampening_bundle_member_secondary_wait       = try(local.device_config[each.value.name].bfd.dampening_bundle_member_secondary_wait, local.defaults.iosxr.configuration.bfd.dampening_bundle_member_secondary_wait, null)
  dampening_bundle_member_maximum_wait         = try(local.device_config[each.value.name].bfd.dampening_bundle_member_maximum_wait, local.defaults.iosxr.configuration.bfd.dampening_bundle_member_maximum_wait, null)
  bundle_coexistence_bob_blb                   = try(local.device_config[each.value.name].bfd.bundle_coexistence_bob_blb, local.defaults.iosxr.configuration.bfd.bundle_coexistence_bob_blb, null)
  ipv6_checksum_disable                        = try(local.device_config[each.value.name].bfd.ipv6_checksum_disable, local.defaults.iosxr.configuration.bfd.ipv6_checksum_disable, null)

  multipath_locations = try(length(local.device_config[each.value.name].bfd.multipath_locations) == 0, true) ? null : [
    for location in try(local.device_config[each.value.name].bfd.multipath_locations, []) : {
      location_id = try(location.location_id, null)
    }
  ]

  interfaces = try(length(local.device_config[each.value.name].bfd.interfaces) == 0, true) ? null : [
    for interface in try(local.device_config[each.value.name].bfd.interfaces, []) : {
      interface_name        = try(interface.interface_name, null)
      disable               = try(interface.disable, null)
      echo_disable          = try(interface.echo_disable, null)
      echo_ipv4_source      = try(interface.echo_ipv4_source, null)
      ipv6_checksum_disable = try(interface.ipv6_checksum_disable, null)
      local_address         = try(interface.local_address, null)
      tx_interval           = try(interface.tx_interval, null)
      rx_interval           = try(interface.rx_interval, null)
      multiplier            = try(interface.multiplier, null)
    }
  ]
}
