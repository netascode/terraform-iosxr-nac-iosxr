##### HSRP Interface #####

locals {
  router_hsrp_interfaces = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].router_hsrp.interfaces, []) : {
        key                       = format("%s/%s", device.name, intf.name)
        device_name               = device.name
        interface_name            = try(intf.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.name, null)
        hsrp_use_bia              = try(intf.use_bia, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.use_bia, null)
        hsrp_redirects_disable    = try(intf.redirects_disable, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.redirects_disable, null)
        hsrp_delay_minimum        = try(intf.delay_minimum, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.delay_minimum, null)
        hsrp_delay_reload         = try(intf.delay_reload, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.delay_reload, null)
        hsrp_bfd_minimum_interval = try(intf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.bfd_minimum_interval, null)
        hsrp_bfd_multiplier       = try(intf.bfd_multiplier, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.bfd_multiplier, null)
        hsrp_mac_refresh          = try(intf.mac_refresh, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.mac_refresh, null)
      }
    ]
  ])
}

resource "iosxr_router_hsrp_interface" "router_hsrp_interface" {
  for_each                  = { for intf in local.router_hsrp_interfaces : intf.key => intf }
  device                    = each.value.device_name
  interface_name            = each.value.interface_name
  hsrp_use_bia              = each.value.hsrp_use_bia
  hsrp_redirects_disable    = each.value.hsrp_redirects_disable
  hsrp_delay_minimum        = each.value.hsrp_delay_minimum
  hsrp_delay_reload         = each.value.hsrp_delay_reload
  hsrp_bfd_minimum_interval = each.value.hsrp_bfd_minimum_interval
  hsrp_bfd_multiplier       = each.value.hsrp_bfd_multiplier
  hsrp_mac_refresh          = each.value.hsrp_mac_refresh
}

##### HSRP Interface IPv4 Group V1 / V2 #####

locals {
  router_hsrp_ipv4_groups = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].router_hsrp.interfaces, []) : [
        for group in try(intf.ipv4, []) : {
          key            = format("%s/%s/%s", device.name, intf.name, group.group)
          device_name    = device.name
          interface_name = try(intf.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.name, null)
          version        = try(group.version, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.version, 2)
          group_id       = try(group.group, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.group, null)
          address        = try(group.address, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.address, null)
          address_learn  = try(group.address_learn, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.address_learn, null)
          priority       = try(group.priority, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.priority, null)
          mac_address = try(
            provider::utils::normalize_mac(
              try(group.mac_address, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.mac_address),
              "colon"
            ),
            null
          )
          name                           = try(group.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.name, null)
          preempt_delay                  = try(group.preempt_delay, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.preempt_delay, null)
          timers_msec                    = try(group.timers_msec, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.timers_msec, null)
          timers_msec_holdtime           = try(group.timers_msec_holdtime, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.timers_msec_holdtime, null)
          timers_seconds                 = try(group.timers_seconds, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.timers_seconds, null)
          timers_seconds_holdtime        = try(group.timers_seconds_holdtime, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.timers_seconds_holdtime, null)
          bfd_fast_detect_peer_ipv4      = try(group.bfd_fast_detect_peer_ipv4, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.bfd_fast_detect_peer_ipv4, null)
          bfd_fast_detect_peer_interface = try(group.bfd_fast_detect_peer_interface, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.bfd_fast_detect_peer_interface, null)
          secondary_ipv4_addresses = try(length(group.secondary_ipv4_addresses) == 0, true) ? null : [
            for secondary in group.secondary_ipv4_addresses : {
              address = try(secondary.address, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.secondary_ipv4_addresses.address, null)
            }
          ]
          track_interfaces = try(length(group.track_interfaces) == 0, true) ? null : [
            for track_intf in group.track_interfaces : {
              track_name         = try(track_intf.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.track_interfaces.name, null)
              priority_decrement = try(track_intf.priority_decrement, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.track_interfaces.priority_decrement, null)
            }
          ]
          track_objects = try(length(group.track_objects) == 0, true) ? null : [
            for track_obj in group.track_objects : {
              object_name        = try(track_obj.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.track_objects.name, null)
              priority_decrement = try(track_obj.priority_decrement, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv4.track_objects.priority_decrement, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_hsrp_interface_ipv4_group_v1" "router_hsrp_interface_ipv4_group_v1" {
  for_each                       = { for group in local.router_hsrp_ipv4_groups : group.key => group if group.version == 1 }
  device                         = each.value.device_name
  interface_name                 = each.value.interface_name
  group_id                       = each.value.group_id
  address                        = each.value.address
  address_learn                  = each.value.address_learn
  priority                       = each.value.priority
  mac_address                    = each.value.mac_address
  name                           = each.value.name
  preempt_delay                  = each.value.preempt_delay
  timers_msec                    = each.value.timers_msec
  timers_msec_holdtime           = each.value.timers_msec_holdtime
  timers_seconds                 = each.value.timers_seconds
  timers_seconds_holdtime        = each.value.timers_seconds_holdtime
  bfd_fast_detect_peer_ipv4      = each.value.bfd_fast_detect_peer_ipv4
  bfd_fast_detect_peer_interface = each.value.bfd_fast_detect_peer_interface
  secondary_ipv4_addresses       = each.value.secondary_ipv4_addresses
  track_interfaces               = each.value.track_interfaces
  track_objects                  = each.value.track_objects
  depends_on                     = [iosxr_router_hsrp_interface.router_hsrp_interface]
}

resource "iosxr_router_hsrp_interface_ipv4_group_v2" "router_hsrp_interface_ipv4_group_v2" {
  for_each                       = { for group in local.router_hsrp_ipv4_groups : group.key => group if group.version == 2 }
  device                         = each.value.device_name
  interface_name                 = each.value.interface_name
  group_id                       = each.value.group_id
  address                        = each.value.address
  address_learn                  = each.value.address_learn
  priority                       = each.value.priority
  mac_address                    = each.value.mac_address
  name                           = each.value.name
  preempt_delay                  = each.value.preempt_delay
  timers_msec                    = each.value.timers_msec
  timers_msec_holdtime           = each.value.timers_msec_holdtime
  timers_seconds                 = each.value.timers_seconds
  timers_seconds_holdtime        = each.value.timers_seconds_holdtime
  bfd_fast_detect_peer_ipv4      = each.value.bfd_fast_detect_peer_ipv4
  bfd_fast_detect_peer_interface = each.value.bfd_fast_detect_peer_interface
  secondary_ipv4_addresses       = each.value.secondary_ipv4_addresses
  track_interfaces               = each.value.track_interfaces
  track_objects                  = each.value.track_objects
  depends_on                     = [iosxr_router_hsrp_interface.router_hsrp_interface]
}

##### HSRP Interface IPv6 Group V2 #####

locals {
  router_hsrp_ipv6_groups = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].router_hsrp.interfaces, []) : [
        for group in try(intf.ipv6, []) : {
          key            = format("%s/%s/%s", device.name, intf.name, group.group)
          device_name    = device.name
          interface_name = try(intf.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.name, null)
          group_id       = try(group.group, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.group, null)
          addresses = try(length(group.addresses) == 0, true) ? null : [
            for addr in group.addresses : {
              address = try(addr.address, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.addresses.address, null)
            }
          ]
          linklocal_address                   = try(group.linklocal_address, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.linklocal_address, null)
          linklocal_address_autoconfig        = try(group.linklocal_address_autoconfig, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.linklocal_address_autoconfig, null)
          linklocal_address_autoconfig_legacy = try(group.linklocal_address_autoconfig_legacy, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.linklocal_address_autoconfig_legacy, null)
          priority                            = try(group.priority, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.priority, null)
          preempt_delay                       = try(group.preempt_delay, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.preempt_delay, null)
          timers_msec                         = try(group.timers_msec, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.timers_msec, null)
          timers_msec_holdtime                = try(group.timers_msec_holdtime, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.timers_msec_holdtime, null)
          timers_seconds                      = try(group.timers_seconds, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.timers_seconds, null)
          timers_seconds_holdtime             = try(group.timers_seconds_holdtime, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.timers_seconds_holdtime, null)
          mac_address = try(
            provider::utils::normalize_mac(
              try(group.mac_address, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.mac_address),
              "colon"
            ),
            null
          )
          name                           = try(group.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.name, null)
          bfd_fast_detect_peer_ipv6      = try(group.bfd_fast_detect_peer_ipv6, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.bfd_fast_detect_peer_ipv6, null)
          bfd_fast_detect_peer_interface = try(group.bfd_fast_detect_peer_interface, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.bfd_fast_detect_peer_interface, null)
          track_interfaces = try(length(group.track_interfaces) == 0, true) ? null : [
            for track_intf in group.track_interfaces : {
              track_name         = try(track_intf.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.track_interfaces.name, null)
              priority_decrement = try(track_intf.priority_decrement, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.track_interfaces.priority_decrement, null)
            }
          ]
          track_objects = try(length(group.track_objects) == 0, true) ? null : [
            for track_obj in group.track_objects : {
              object_name        = try(track_obj.name, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.track_objects.name, null)
              priority_decrement = try(track_obj.priority_decrement, local.defaults.iosxr.devices.configuration.router_hsrp.interfaces.ipv6.track_objects.priority_decrement, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_hsrp_interface_ipv6_group_v2" "router_hsrp_interface_ipv6_group_v2" {
  for_each                                        = { for group in local.router_hsrp_ipv6_groups : group.key => group }
  device                                          = each.value.device_name
  interface_name                                  = each.value.interface_name
  group_id                                        = each.value.group_id
  addresses                                       = each.value.addresses
  address_link_local_ipv6_address                 = each.value.linklocal_address
  address_link_local_autoconfig                   = each.value.linklocal_address_autoconfig
  address_link_local_autoconfig_legacy_compatible = each.value.linklocal_address_autoconfig_legacy
  priority                                        = each.value.priority
  preempt_delay                                   = each.value.preempt_delay
  timers_msec                                     = each.value.timers_msec
  timers_msec_holdtime                            = each.value.timers_msec_holdtime
  timers_seconds                                  = each.value.timers_seconds
  timers_seconds_holdtime                         = each.value.timers_seconds_holdtime
  mac_address                                     = each.value.mac_address
  name                                            = each.value.name
  bfd_fast_detect_peer_ipv6                       = each.value.bfd_fast_detect_peer_ipv6
  bfd_fast_detect_peer_interface                  = each.value.bfd_fast_detect_peer_interface
  track_interfaces                                = each.value.track_interfaces
  track_objects                                   = each.value.track_objects
  depends_on                                      = [iosxr_router_hsrp_interface.router_hsrp_interface]
}
