locals {
  tpa = flatten([
    for device in local.devices : [
      {
        key                         = device.name
        device_name                 = device.name
        statistics_update_frequency = try(local.device_config[device.name].tpa.statistics.update_frequency, local.defaults.iosxr.devices.configuration.tpa.statistics.update_frequency, null)
        statistics_disable          = try(local.device_config[device.name].tpa.statistics.disable, local.defaults.iosxr.devices.configuration.tpa.statistics.disable, null)
        statistics_max_lpts_events  = try(local.device_config[device.name].tpa.statistics.max_lpts_events, local.defaults.iosxr.devices.configuration.tpa.statistics.max_lpts_events, null)
        statistics_max_intf_events  = try(local.device_config[device.name].tpa.statistics.max_intf_events, local.defaults.iosxr.devices.configuration.tpa.statistics.max_intf_events, null)
        logging_file_max_size_kb    = try(local.device_config[device.name].tpa.logging.file_max_size_kb, local.defaults.iosxr.devices.configuration.tpa.logging.file_max_size_kb, null)
        logging_rotation_max_files  = try(local.device_config[device.name].tpa.logging.rotation_max_files, local.defaults.iosxr.devices.configuration.tpa.logging.rotation_max_files, null)
        vrfs = try(length(local.device_config[device.name].tpa.vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].tpa.vrfs : {
            vrf_name                                       = try(vrf.name, local.defaults.iosxr.devices.configuration.tpa.vrfs.name, null)
            ipv4_update_source_dataports_active_management = try(vrf.address_family_ipv4.update_source_active_management, local.defaults.iosxr.devices.configuration.tpa.vrfs.address_family_ipv4.update_source_active_management, null)
            ipv4_update_source_dataports                   = try(vrf.address_family_ipv4.update_source, local.defaults.iosxr.devices.configuration.tpa.vrfs.address_family_ipv4.update_source, null)
            ipv4_default_route_mgmt                        = try(vrf.address_family_ipv4.default_route_mgmt, local.defaults.iosxr.devices.configuration.tpa.vrfs.address_family_ipv4.default_route_mgmt, null)
            ipv6_update_source_dataports_active_management = try(vrf.address_family_ipv6.update_source_active_management, local.defaults.iosxr.devices.configuration.tpa.vrfs.address_family_ipv6.update_source_active_management, null)
            ipv6_update_source_dataports                   = try(vrf.address_family_ipv6.update_source, local.defaults.iosxr.devices.configuration.tpa.vrfs.address_family_ipv6.update_source, null)
            ipv6_default_route_mgmt                        = try(vrf.address_family_ipv6.default_route_mgmt, local.defaults.iosxr.devices.configuration.tpa.vrfs.address_family_ipv6.default_route_mgmt, null)
            east_west_interfaces = try(length(vrf.east_west_interfaces) == 0, true) ? null : [
              for ew in vrf.east_west_interfaces : {
                interface_name       = try(ew.name, local.defaults.iosxr.devices.configuration.tpa.vrfs.east_west_interfaces.name, null)
                referenced_vrf       = try(vrf.name, null)
                referenced_interface = try(ew.name, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].tpa, null) != null || try(local.defaults.iosxr.devices.configuration.tpa, null) != null
  ])
}

resource "iosxr_tpa" "tpa" {
  for_each                    = { for tpa in local.tpa : tpa.key => tpa }
  device                      = each.value.device_name
  statistics_update_frequency = each.value.statistics_update_frequency
  statistics_disable          = each.value.statistics_disable
  statistics_max_lpts_events  = each.value.statistics_max_lpts_events
  statistics_max_intf_events  = each.value.statistics_max_intf_events
  logging_file_max_size_kb    = each.value.logging_file_max_size_kb
  logging_rotation_max_files  = each.value.logging_rotation_max_files
  vrfs                        = each.value.vrfs
}
