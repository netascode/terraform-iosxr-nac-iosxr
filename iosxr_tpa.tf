resource "iosxr_tpa" "tpa" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].tpa, null) != null || try(local.defaults.iosxr.devices.configuration.tpa, null) != null }
  device   = each.value.name

  statistics_update_frequency = try(local.device_config[each.value.name].tpa.statistics_update_frequency, local.defaults.iosxr.devices.configuration.tpa.statistics_update_frequency, null)
  statistics_max_lpts_events  = try(local.device_config[each.value.name].tpa.statistics_max_lpts_events, local.defaults.iosxr.devices.configuration.tpa.statistics_max_lpts_events, null)
  statistics_max_intf_events  = try(local.device_config[each.value.name].tpa.statistics_max_intf_events, local.defaults.iosxr.devices.configuration.tpa.statistics_max_intf_events, null)
  statistics_disable          = try(local.device_config[each.value.name].tpa.statistics_disable, local.defaults.iosxr.devices.configuration.tpa.statistics_disable, null)
  logging_file_max_size_kb    = try(local.device_config[each.value.name].tpa.logging_file_max_size_kb, local.defaults.iosxr.devices.configuration.tpa.logging_file_max_size_kb, null)
  logging_rotation_max_files  = try(local.device_config[each.value.name].tpa.logging_rotation_max_files, local.defaults.iosxr.devices.configuration.tpa.logging_rotation_max_files, null)

  vrfs = try(length(local.device_config[each.value.name].tpa.vrfs) == 0, true) ? null : [for vrf in local.device_config[each.value.name].tpa.vrfs : {
    vrf_name                                       = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.tpa.vrfs.vrf_name, null)
    ipv4_default_route_mgmt                        = try(vrf.ipv4_default_route_mgmt, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv4_default_route_mgmt, null)
    ipv4_update_source_dataports                   = try(vrf.ipv4_update_source_dataports, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv4_update_source_dataports, null)
    ipv4_update_source_dataports_active_management = try(vrf.ipv4_update_source_dataports_active_management, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv4_update_source_dataports_active_management, null)
    ipv6_default_route_mgmt                        = try(vrf.ipv6_default_route_mgmt, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv6_default_route_mgmt, null)
    ipv6_update_source_dataports                   = try(vrf.ipv6_update_source_dataports, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv6_update_source_dataports, null)
    ipv6_update_source_dataports_active_management = try(vrf.ipv6_update_source_dataports_active_management, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv6_update_source_dataports_active_management, null)

    ipv4_update_source_destinations = try(length(vrf.ipv4_update_source_destinations) == 0, true) ? null : [for dest in vrf.ipv4_update_source_destinations : {
      destination_interface = try(dest.destination_interface, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv4_update_source_destinations.destination_interface, null)
      source_interface      = try(dest.source_interface, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv4_update_source_destinations.source_interface, null)
    }]

    ipv6_update_source_destinations = try(length(vrf.ipv6_update_source_destinations) == 0, true) ? null : [for dest in vrf.ipv6_update_source_destinations : {
      destination_interface = try(dest.destination_interface, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv6_update_source_destinations.destination_interface, null)
      source_interface      = try(dest.source_interface, local.defaults.iosxr.devices.configuration.tpa.vrfs.ipv6_update_source_destinations.source_interface, null)
    }]

    east_west_interfaces = try(length(vrf.east_west_interfaces) == 0, true) ? null : [for intf in vrf.east_west_interfaces : {
      interface_name       = try(intf.interface_name, local.defaults.iosxr.devices.configuration.tpa.vrfs.east_west_interfaces.interface_name, null)
      referenced_vrf       = try(intf.referenced_vrf, local.defaults.iosxr.devices.configuration.tpa.vrfs.east_west_interfaces.referenced_vrf, null)
      referenced_interface = try(intf.referenced_interface, local.defaults.iosxr.devices.configuration.tpa.vrfs.east_west_interfaces.referenced_interface, null)
    }]
  }]
}
