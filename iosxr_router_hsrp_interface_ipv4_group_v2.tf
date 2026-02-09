locals {
  router_hsrp_interface_ipv4_group_v2 = flatten([
    for device in local.devices : [
      for hsrp_group in try(local.device_config[device.name].router_hsrp_interface_ipv4_group_v2, []) : {
        key                            = format("%s/%s/%s", device.name, hsrp_group.interface_name, hsrp_group.group_id)
        device_name                    = device.name
        interface_name                 = hsrp_group.interface_name
        group_id                       = hsrp_group.group_id
        address                        = try(hsrp_group.address, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.address, null)
        address_learn                  = try(hsrp_group.address_learn, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.address_learn, null)
        priority                       = try(hsrp_group.priority, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.priority, null)
        mac_address                    = try(hsrp_group.mac_address, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.mac_address, null)
        name                           = try(hsrp_group.name, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.name, null)
        preempt_delay                  = try(hsrp_group.preempt_delay, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.preempt_delay, null)
        timers_msec                    = try(hsrp_group.timers_msec, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.timers_msec, null)
        timers_msec_holdtime           = try(hsrp_group.timers_msec_holdtime, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.timers_msec_holdtime, null)
        timers_seconds                 = try(hsrp_group.timers_seconds, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.timers_seconds, null)
        timers_seconds_holdtime        = try(hsrp_group.timers_seconds_holdtime, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.timers_seconds_holdtime, null)
        bfd_fast_detect_peer_ipv4      = try(hsrp_group.bfd_fast_detect_peer_ipv4, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.bfd_fast_detect_peer_ipv4, null)
        bfd_fast_detect_peer_interface = try(hsrp_group.bfd_fast_detect_peer_interface, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.bfd_fast_detect_peer_interface, null)
        secondary_ipv4_addresses = try(length(hsrp_group.secondary_ipv4_addresses) == 0, true) ? null : [
          for secondary in hsrp_group.secondary_ipv4_addresses : {
            address = try(secondary.address, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.secondary_ipv4_addresses.address, null)
          }
        ]
        track_interfaces = try(length(hsrp_group.track_interfaces) == 0, true) ? null : [
          for track_interface in hsrp_group.track_interfaces : {
            track_name         = try(track_interface.track_name, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.track_interfaces.track_name, null)
            priority_decrement = try(track_interface.priority_decrement, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.track_interfaces.priority_decrement, null)
          }
        ]
        track_objects = try(length(hsrp_group.track_objects) == 0, true) ? null : [
          for track_object in hsrp_group.track_objects : {
            object_name        = try(track_object.object_name, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.track_objects.object_name, null)
            priority_decrement = try(track_object.priority_decrement, local.defaults.iosxr.devices.configuration.router_hsrp_interface_ipv4_group_v2.track_objects.priority_decrement, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_hsrp_interface_ipv4_group_v2" "router_hsrp_interface_ipv4_group_v2" {
  for_each                       = { for group_v2 in local.router_hsrp_interface_ipv4_group_v2 : group_v2.key => group_v2 }
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
}
