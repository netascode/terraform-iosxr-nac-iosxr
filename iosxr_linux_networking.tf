locals {
  linux_networking = flatten([
    for device in local.devices : [
      {
        key                                       = device.name
        device_name                               = device.name
        statistics_synchronization_thirty_seconds = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "30s" ? true : null
        statistics_synchronization_sixty_seconds  = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "60s" ? true : null
        statistics_synchronization_two_minutes    = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "2m" ? true : null
        statistics_synchronization_three_minutes  = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "3m" ? true : null
        statistics_synchronization_four_minutes   = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "4m" ? true : null
        statistics_synchronization_five_minutes   = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "5m" ? true : null
        statistics_synchronization_six_minutes    = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "6m" ? true : null
        statistics_synchronization_seven_minutes  = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "7m" ? true : null
        statistics_synchronization_eight_minutes  = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "8m" ? true : null
        statistics_synchronization_nine_minutes   = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "9m" ? true : null
        statistics_synchronization_ten_minutes    = try(local.device_config[device.name].linux_networking.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.statistics_synchronization, null) == "10m" ? true : null
        linux_owned_vrf                           = try(local.device_config[device.name].linux_networking.linux_owned_vrf, local.defaults.iosxr.devices.configuration.linux_networking.linux_owned_vrf, null)
        exposed_interfaces = try(length(local.device_config[device.name].linux_networking.exposed_interfaces) == 0, true) ? null : [
          for iface in local.device_config[device.name].linux_networking.exposed_interfaces : {
            interface_name                            = try(iface.name, local.defaults.iosxr.devices.configuration.linux_networking.exposed_interfaces.name, null)
            linux_managed                             = try(iface.linux_managed, local.defaults.iosxr.devices.configuration.linux_networking.exposed_interfaces.linux_managed, "disable")
            statistics_synchronization_five_seconds   = try(iface.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.exposed_interfaces.statistics_synchronization, null) == "5s" ? true : null
            statistics_synchronization_ten_seconds    = try(iface.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.exposed_interfaces.statistics_synchronization, null) == "10s" ? true : null
            statistics_synchronization_thirty_seconds = try(iface.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.exposed_interfaces.statistics_synchronization, null) == "30s" ? true : null
            statistics_synchronization_sixty_seconds  = try(iface.statistics_synchronization, local.defaults.iosxr.devices.configuration.linux_networking.exposed_interfaces.statistics_synchronization, null) == "60s" ? true : null
          }
        ]
        vrfs = try(length(local.device_config[device.name].linux_networking.vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].linux_networking.vrfs : {
            vrf_name                                    = try(vrf.name, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.name, null)
            disable                                     = try(vrf.disable, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.disable, null)
            ipv4_source_interface_default_route         = try(vrf.address_family_ipv4.default_route.interface, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv4.default_route.interface, null)
            ipv4_source_default_route_active_management = try(vrf.address_family_ipv4.default_route.active_management, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv4.default_route.active_management, null)
            ipv4_source_interface_management_route      = try(vrf.address_family_ipv4.management_route.interface, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv4.management_route.interface, null)
            ipv4_default_route_software_forwarding      = try(vrf.address_family_ipv4.software_forwarding, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv4.software_forwarding, null)
            ipv6_source_interface_default_route         = try(vrf.address_family_ipv6.default_route.interface, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv6.default_route.interface, null)
            ipv6_source_default_route_active_management = try(vrf.address_family_ipv6.default_route.active_management, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv6.default_route.active_management, null)
            ipv6_source_interface_management_route      = try(vrf.address_family_ipv6.management_route.interface, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv6.management_route.interface, null)
            ipv6_default_route_software_forwarding      = try(vrf.address_family_ipv6.software_forwarding, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.address_family_ipv6.software_forwarding, null)
            east_west_interfaces = try(length(vrf.east_west_interfaces) == 0, true) ? null : [
              for ew in vrf.east_west_interfaces : {
                interface_name = try(ew.name, local.defaults.iosxr.devices.configuration.linux_networking.vrfs.east_west_interfaces.name, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].linux_networking, null) != null || try(local.defaults.iosxr.devices.configuration.linux_networking, null) != null
  ])
}

resource "iosxr_linux_networking" "linux_networking" {
  for_each                                  = { for ln in local.linux_networking : ln.key => ln }
  device                                    = each.value.device_name
  statistics_synchronization_thirty_seconds = each.value.statistics_synchronization_thirty_seconds
  statistics_synchronization_sixty_seconds  = each.value.statistics_synchronization_sixty_seconds
  statistics_synchronization_two_minutes    = each.value.statistics_synchronization_two_minutes
  statistics_synchronization_three_minutes  = each.value.statistics_synchronization_three_minutes
  statistics_synchronization_four_minutes   = each.value.statistics_synchronization_four_minutes
  statistics_synchronization_five_minutes   = each.value.statistics_synchronization_five_minutes
  statistics_synchronization_six_minutes    = each.value.statistics_synchronization_six_minutes
  statistics_synchronization_seven_minutes  = each.value.statistics_synchronization_seven_minutes
  statistics_synchronization_eight_minutes  = each.value.statistics_synchronization_eight_minutes
  statistics_synchronization_nine_minutes   = each.value.statistics_synchronization_nine_minutes
  statistics_synchronization_ten_minutes    = each.value.statistics_synchronization_ten_minutes
  linux_owned_vrf                           = each.value.linux_owned_vrf
  exposed_interfaces                        = each.value.exposed_interfaces
  vrfs                                      = each.value.vrfs
}
