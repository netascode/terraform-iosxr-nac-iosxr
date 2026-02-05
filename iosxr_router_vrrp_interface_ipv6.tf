locals {
  router_vrrp_interface_ipv6 = flatten([
    for device in local.devices : [
      for vrrp_interface in try(local.device_config[device.name].router_vrrp_interface_ipv6, []) : {
        key                              = format("%s/%s/%s", device.name, vrrp_interface.interface_name, vrrp_interface.vrrp_id)
        device_name                      = device.name
        interface_name                   = try(vrrp_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.interface_name, null)
        vrrp_id                          = try(vrrp_interface.vrrp_id, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.vrrp_id, null)
        accept_mode_disable              = try(vrrp_interface.accept_mode_disable, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.accept_mode_disable, null)
        address_linklocal                = try(vrrp_interface.address_linklocal, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.address_linklocal, null)
        address_linklocal_autoconfig     = try(vrrp_interface.address_linklocal_autoconfig, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.address_linklocal_autoconfig, null)
        bfd_fast_detect_peer_ipv6        = try(vrrp_interface.bfd_fast_detect_peer_ipv6, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.bfd_fast_detect_peer_ipv6, null)
        name                             = try(vrrp_interface.name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.name, null)
        preempt_delay                    = try(vrrp_interface.preempt_delay, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.preempt_delay, null)
        preempt_disable                  = try(vrrp_interface.preempt_disable, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.preempt_disable, null)
        priority                         = try(vrrp_interface.priority, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.priority, null)
        timer_advertisement_milliseconds = try(vrrp_interface.timer_advertisement_milliseconds, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.timer_advertisement_milliseconds, null)
        timer_advertisement_seconds      = try(vrrp_interface.timer_advertisement_seconds, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.timer_advertisement_seconds, null)
        timer_force                      = try(vrrp_interface.timer_force, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.timer_force, null)
        unicast_peer                     = try(vrrp_interface.unicast_peer, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.unicast_peer, null)
        global_addresses = try(length(vrrp_interface.global_addresses) == 0, true) ? null : [for global_address in vrrp_interface.global_addresses : {
          address = try(global_address.address, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.global_addresses_address, null)
          }
        ]
        track_interfaces = try(length(vrrp_interface.track_interfaces) == 0, true) ? null : [for track_interface in vrrp_interface.track_interfaces : {
          interface_name     = try(track_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.track_interfaces_interface_name, null)
          priority_decrement = try(track_interface.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.track_interfaces_priority_decrement, null)
          }
        ]
        track_objects = try(length(vrrp_interface.track_objects) == 0, true) ? null : [for track_object in vrrp_interface.track_objects : {
          object_name        = try(track_object.object_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.track_objects_object_name, null)
          priority_decrement = try(track_object.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv6.track_objects_priority_decrement, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_vrrp_interface_ipv6" "router_vrrp_interface_ipv6" {
  for_each                         = { for vrrp_interface in local.router_vrrp_interface_ipv6 : vrrp_interface.key => vrrp_interface }
  device                           = each.value.device_name
  interface_name                   = each.value.interface_name
  vrrp_id                          = each.value.vrrp_id
  accept_mode_disable              = each.value.accept_mode_disable
  address_linklocal                = each.value.address_linklocal
  address_linklocal_autoconfig     = each.value.address_linklocal_autoconfig
  bfd_fast_detect_peer_ipv6        = each.value.bfd_fast_detect_peer_ipv6
  global_addresses                 = each.value.global_addresses
  name                             = each.value.name
  preempt_delay                    = each.value.preempt_delay
  preempt_disable                  = each.value.preempt_disable
  priority                         = each.value.priority
  timer_advertisement_milliseconds = each.value.timer_advertisement_milliseconds
  timer_advertisement_seconds      = each.value.timer_advertisement_seconds
  timer_force                      = each.value.timer_force
  unicast_peer                     = each.value.unicast_peer
  track_interfaces                 = each.value.track_interfaces
  track_objects                    = each.value.track_objects
}
