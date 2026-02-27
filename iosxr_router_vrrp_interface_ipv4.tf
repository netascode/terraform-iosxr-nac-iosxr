locals {
  router_vrrp_interface_ipv4 = flatten([
    for device in local.devices : [
      for vrrp_interface in try(local.device_config[device.name].router_vrrp_interface_ipv4, []) : {
        key                              = format("%s/%s/%s", device.name, vrrp_interface.interface_name, vrrp_interface.vrrp_id)
        device_name                      = device.name
        interface_name                   = try(vrrp_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.interface_name, null)
        vrrp_id                          = try(vrrp_interface.vrrp_id, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.vrrp_id, null)
        version                          = try(vrrp_interface.version, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.version, null)
        accept_mode_disable              = try(vrrp_interface.accept_mode_disable, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.accept_mode_disable, null)
        address                          = try(vrrp_interface.address, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.address, null)
        bfd_fast_detect_peer_ipv4        = try(vrrp_interface.bfd_fast_detect_peer_ipv4, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.bfd_fast_detect_peer_ipv4, null)
        name                             = try(vrrp_interface.name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.name, null)
        preempt_delay                    = try(vrrp_interface.preempt_delay, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.preempt_delay, null)
        preempt_disable                  = try(vrrp_interface.preempt_disable, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.preempt_disable, null)
        priority                         = try(vrrp_interface.priority, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.priority, null)
        text_authentication              = try(vrrp_interface.text_authentication, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.text_authentication, null)
        unicast_peer                     = try(vrrp_interface.unicast_peer, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.unicast_peer, null)
        timer_advertisement_milliseconds = try(vrrp_interface.timer_advertisement_milliseconds, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.timer_advertisement_milliseconds, null)
        timer_advertisement_seconds      = try(vrrp_interface.timer_advertisement_seconds, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.timer_advertisement_seconds, null)
        timer_force                      = try(vrrp_interface.timer_force, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.timer_force, null)
        secondary_addresses = try(length(vrrp_interface.secondary_addresses) == 0, true) ? null : [for secondary_address in vrrp_interface.secondary_addresses : {
          address = try(secondary_address.address, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.secondary_addresses.address, null)
          }
        ]
        track_interfaces = try(length(vrrp_interface.track_interfaces) == 0, true) ? null : [for track_interface in vrrp_interface.track_interfaces : {
          interface_name     = try(track_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_interfaces.interface_name, null)
          priority_decrement = try(track_interface.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_interfaces.priority_decrement, null)
          }
        ]
        track_objects = try(length(vrrp_interface.track_objects) == 0, true) ? null : [for track_object in vrrp_interface.track_objects : {
          object_name        = try(track_object.object_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_objects.object_name, null)
          priority_decrement = try(track_object.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_objects.priority_decrement, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_vrrp_interface_ipv4" "router_vrrp_interface_ipv4" {
  for_each                         = { for vrrp_interface in local.router_vrrp_interface_ipv4 : vrrp_interface.key => vrrp_interface }
  device                           = each.value.device_name
  interface_name                   = each.value.interface_name
  vrrp_id                          = each.value.vrrp_id
  version                          = each.value.version
  accept_mode_disable              = each.value.accept_mode_disable
  address                          = each.value.address
  bfd_fast_detect_peer_ipv4        = each.value.bfd_fast_detect_peer_ipv4
  name                             = each.value.name
  preempt_delay                    = each.value.preempt_delay
  preempt_disable                  = each.value.preempt_disable
  priority                         = each.value.priority
  text_authentication              = each.value.text_authentication
  unicast_peer                     = each.value.unicast_peer
  timer_advertisement_milliseconds = each.value.timer_advertisement_milliseconds
  timer_advertisement_seconds      = each.value.timer_advertisement_seconds
  timer_force                      = each.value.timer_force
  secondary_addresses              = each.value.secondary_addresses
  track_interfaces                 = each.value.track_interfaces
  track_objects                    = each.value.track_objects
}
