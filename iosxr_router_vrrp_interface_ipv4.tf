locals {
  router_vrrp_interface_ipv4s = flatten([
    for device in local.devices : [
      for vrrp in try(local.device_config[device.name].router_vrrp_interface_ipv4, []) : {
        key                              = format("%s/%s/%s", device.name, vrrp.interface_name, vrrp.vrrp_id)
        device_name                      = device.name
        interface_name                   = try(vrrp.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.interface_name, null)
        vrrp_id                          = try(vrrp.vrrp_id, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.vrrp_id, null)
        version                          = try(vrrp.version, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.version, null)
        accept_mode_disable              = try(vrrp.accept_mode_disable, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.accept_mode_disable, null)
        address                          = try(vrrp.address, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.address, null)
        bfd_fast_detect_peer_ipv4        = try(vrrp.bfd_fast_detect_peer_ipv4, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.bfd_fast_detect_peer_ipv4, null)
        name                             = try(vrrp.name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.name, null)
        preempt_delay                    = try(vrrp.preempt_delay, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.preempt_delay, null)
        preempt_disable                  = try(vrrp.preempt_disable, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.preempt_disable, null)
        priority                         = try(vrrp.priority, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.priority, null)
        text_authentication              = try(vrrp.text_authentication, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.text_authentication, null)
        timer_advertisement_milliseconds = try(vrrp.timer_advertisement_milliseconds, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.timer_advertisement_milliseconds, null)
        timer_advertisement_seconds      = try(vrrp.timer_advertisement_seconds, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.timer_advertisement_seconds, null)
        timer_force                      = try(vrrp.timer_force, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.timer_force, null)
        secondary_addresses = try(length(vrrp.secondary_addresses) == 0, true) ? null : [for secondary_address in vrrp.secondary_addresses : {
          address = try(secondary_address.address, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.secondary_addresses.address, null)
        }]
        track_interfaces = try(length(vrrp.track_interfaces) == 0, true) ? null : [for track_interface in vrrp.track_interfaces : {
          interface_name     = try(track_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_interfaces.interface_name, null)
          priority_decrement = try(track_interface.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_interfaces.priority_decrement, null)
        }]
        track_objects = try(length(vrrp.track_objects) == 0, true) ? null : [for track_object in vrrp.track_objects : {
          object_name        = try(track_object.object_name, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_objects.object_name, null)
          priority_decrement = try(track_object.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp_interface_ipv4.track_objects.priority_decrement, null)
        }]
      }
    ]
  ])
}

resource "iosxr_router_vrrp_interface_ipv4" "router_vrrp_interface_ipv4" {
  for_each = { for vrrp in local.router_vrrp_interface_ipv4s : vrrp.key => vrrp }

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
  timer_advertisement_milliseconds = each.value.timer_advertisement_milliseconds
  timer_advertisement_seconds      = each.value.timer_advertisement_seconds
  timer_force                      = each.value.timer_force
  secondary_addresses              = each.value.secondary_addresses
  track_interfaces                 = each.value.track_interfaces
  track_objects                    = each.value.track_objects
}
