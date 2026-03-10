##### VRRP Interface #####

locals {
  router_vrrp_interfaces = flatten([
    for device in local.devices : [
      for vrrp_interface in try(local.device_config[device.name].router_vrrp.interfaces, []) : {
        key                  = format("%s/%s", device.name, vrrp_interface.interface_name)
        device_name          = device.name
        interface_name       = try(vrrp_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.interface_name, null)
        mac_refresh          = try(vrrp_interface.mac_refresh, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.mac_refresh, null)
        delay_minimum        = try(vrrp_interface.delay_minimum, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.delay_minimum, null)
        delay_reload         = try(vrrp_interface.delay_reload, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.delay_reload, null)
        bfd_minimum_interval = try(vrrp_interface.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.bfd_minimum_interval, null)
        bfd_multiplier       = try(vrrp_interface.bfd_multiplier, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.bfd_multiplier, null)
      }
    ]
  ])
}

resource "iosxr_router_vrrp_interface" "router_vrrp_interface" {
  for_each             = { for vrrp_interface in local.router_vrrp_interfaces : vrrp_interface.key => vrrp_interface }
  device               = each.value.device_name
  interface_name       = each.value.interface_name
  mac_refresh          = each.value.mac_refresh
  delay_minimum        = each.value.delay_minimum
  delay_reload         = each.value.delay_reload
  bfd_minimum_interval = each.value.bfd_minimum_interval
  bfd_multiplier       = each.value.bfd_multiplier
}

##### VRRP Interface IPv4 #####

locals {
  router_vrrp_interface_ipv4 = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].router_vrrp.interfaces, []) : [
        for vrrp in try(intf.address_family_ipv4, []) : {
          key                              = format("%s/%s/%s", device.name, intf.interface_name, vrrp.vrrp_id)
          device_name                      = device.name
          interface_name                   = try(intf.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.interface_name, null)
          vrrp_id                          = try(vrrp.vrrp_id, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.vrrp_id, null)
          version                          = try(vrrp.version, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.version, null)
          accept_mode_disable              = try(vrrp.accept_mode_disable, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.accept_mode_disable, null)
          address                          = try(vrrp.address, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.address, null)
          bfd_fast_detect_peer_ipv4        = try(vrrp.bfd_fast_detect_peer_ipv4, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.bfd_fast_detect_peer_ipv4, null)
          name                             = try(vrrp.name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.name, null)
          preempt_delay                    = try(vrrp.preempt_delay, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.preempt_delay, null)
          preempt_disable                  = try(vrrp.preempt_disable, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.preempt_disable, null)
          priority                         = try(vrrp.priority, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.priority, null)
          text_authentication              = try(vrrp.text_authentication, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.text_authentication, null)
          unicast_peer                     = try(vrrp.unicast_peer, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.unicast_peer, null)
          timer_advertisement_milliseconds = try(vrrp.timer_advertisement_milliseconds, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.timer_advertisement_milliseconds, null)
          timer_advertisement_seconds      = try(vrrp.timer_advertisement_seconds, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.timer_advertisement_seconds, null)
          timer_force                      = try(vrrp.timer_force, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.timer_force, null)
          secondary_addresses = try(length(vrrp.secondary_addresses) == 0, true) ? null : [for secondary_address in vrrp.secondary_addresses : {
            address = try(secondary_address.address, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.secondary_addresses.address, null)
            }
          ]
          track_interfaces = try(length(vrrp.track_interfaces) == 0, true) ? null : [for track_interface in vrrp.track_interfaces : {
            interface_name     = try(track_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.track_interfaces.interface_name, null)
            priority_decrement = try(track_interface.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.track_interfaces.priority_decrement, null)
            }
          ]
          track_objects = try(length(vrrp.track_objects) == 0, true) ? null : [for track_object in vrrp.track_objects : {
            object_name        = try(track_object.object_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.track_objects.object_name, null)
            priority_decrement = try(track_object.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv4.track_objects.priority_decrement, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_vrrp_interface_ipv4" "router_vrrp_interface_ipv4" {
  for_each                         = { for vrrp in local.router_vrrp_interface_ipv4 : vrrp.key => vrrp }
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

  depends_on = [
    iosxr_router_vrrp_interface.router_vrrp_interface
  ]
}

##### VRRP Interface IPv6 #####

locals {
  router_vrrp_interface_ipv6 = flatten([
    for device in local.devices : [
      for intf in try(local.device_config[device.name].router_vrrp.interfaces, []) : [
        for vrrp in try(intf.address_family_ipv6, []) : {
          key                              = format("%s/%s/%s", device.name, intf.interface_name, vrrp.vrrp_id)
          device_name                      = device.name
          interface_name                   = try(intf.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.interface_name, null)
          vrrp_id                          = try(vrrp.vrrp_id, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.vrrp_id, null)
          accept_mode_disable              = try(vrrp.accept_mode_disable, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.accept_mode_disable, null)
          address_linklocal                = try(vrrp.address_linklocal, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.address_linklocal, null)
          address_linklocal_autoconfig     = try(vrrp.address_linklocal_autoconfig, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.address_linklocal_autoconfig, null)
          bfd_fast_detect_peer_ipv6        = try(vrrp.bfd_fast_detect_peer_ipv6, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.bfd_fast_detect_peer_ipv6, null)
          name                             = try(vrrp.name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.name, null)
          preempt_delay                    = try(vrrp.preempt_delay, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.preempt_delay, null)
          preempt_disable                  = try(vrrp.preempt_disable, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.preempt_disable, null)
          priority                         = try(vrrp.priority, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.priority, null)
          timer_advertisement_milliseconds = try(vrrp.timer_advertisement_milliseconds, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.timer_advertisement_milliseconds, null)
          timer_advertisement_seconds      = try(vrrp.timer_advertisement_seconds, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.timer_advertisement_seconds, null)
          timer_force                      = try(vrrp.timer_force, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.timer_force, null)
          unicast_peer                     = try(vrrp.unicast_peer, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.unicast_peer, null)
          global_addresses = try(length(vrrp.global_addresses) == 0, true) ? null : [for global_address in vrrp.global_addresses : {
            address = try(global_address.address, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.global_addresses.address, null)
            }
          ]
          track_interfaces = try(length(vrrp.track_interfaces) == 0, true) ? null : [for track_interface in vrrp.track_interfaces : {
            interface_name     = try(track_interface.interface_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.track_interfaces.interface_name, null)
            priority_decrement = try(track_interface.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.track_interfaces.priority_decrement, null)
            }
          ]
          track_objects = try(length(vrrp.track_objects) == 0, true) ? null : [for track_object in vrrp.track_objects : {
            object_name        = try(track_object.object_name, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.track_objects.object_name, null)
            priority_decrement = try(track_object.priority_decrement, local.defaults.iosxr.devices.configuration.router_vrrp.interfaces.address_family_ipv6.track_objects.priority_decrement, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_vrrp_interface_ipv6" "router_vrrp_interface_ipv6" {
  for_each                         = { for vrrp in local.router_vrrp_interface_ipv6 : vrrp.key => vrrp }
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

  depends_on = [
    iosxr_router_vrrp_interface.router_vrrp_interface
  ]
}
