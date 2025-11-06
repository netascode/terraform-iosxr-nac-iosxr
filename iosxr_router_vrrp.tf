locals {
  # Flatten VRRP lists into for_each-friendly maps
  device_router_vrrp_interfaces = flatten([
    for device in local.devices : (
      try(device.configuration.router_vrrp_interface, null) != null ?
      [for v in try(device.configuration.router_vrrp_interface, []) : {
        key            = "${device.name}-${v.interface_name}"
        device_name    = device.name
        interface_name = v.interface_name
      }] : []
    )
  ])

  device_router_vrrp_interface_ipv4 = flatten([
    for device in local.devices : (
      try(device.configuration.router_vrrp_interface_ipv4, null) != null ?
      [for v in try(device.configuration.router_vrrp_interface_ipv4, []) : {
        key                         = "${device.name}-${v.interface_name}-ipv4-${v.vrrp_id}"
        device_name                 = device.name
        interface_name              = v.interface_name
        vrrp_id                     = v.vrrp_id
        version                     = try(v.version, null)
        priority                    = try(v.priority, null)
        preempt_disable             = try(v.preempt_disable, null)
        preempt_delay               = try(v.preempt_delay, null)
        timer_advertisement_seconds = try(v.timer_advertisement_seconds, null)
        accept_mode_disable         = try(v.accept_mode_disable, null)
        name                        = try(v.name, null)
        text_authentication         = try(v.text_authentication, null)
        address                     = try(v.address, null)
        secondary_addresses         = try(v.secondary_addresses, null)
        track_objects               = try(v.track_objects, null)
        track_interfaces            = try(v.track_interfaces, null)
      }] : []
    )
  ])

  device_router_vrrp_interface_ipv6 = flatten([
    for device in local.devices : (
      try(device.configuration.router_vrrp_interface_ipv6, null) != null ?
      [for v in try(device.configuration.router_vrrp_interface_ipv6, []) : {
        key                          = "${device.name}-${v.interface_name}-ipv6-${v.vrrp_id}"
        device_name                  = device.name
        interface_name               = v.interface_name
        vrrp_id                      = v.vrrp_id
        priority                     = try(v.priority, null)
        preempt_disable              = try(v.preempt_disable, null)
        preempt_delay                = try(v.preempt_delay, null)
        timer_advertisement_seconds  = try(v.timer_advertisement_seconds, null)
        accept_mode_disable          = try(v.accept_mode_disable, null)
        name                         = try(v.name, null)
        global_addresses             = try(v.global_addresses, null)
        address_linklocal            = try(v.address_linklocal, null)
        address_linklocal_autoconfig = try(v.address_linklocal_autoconfig, null)
        track_objects                = try(v.track_objects, null)
        track_interfaces             = try(v.track_interfaces, null)
      }] : []
    )
  ])
}

resource "iosxr_router_vrrp_interface" "vrrp_if" {
  for_each       = { for i in local.device_router_vrrp_interfaces : i.key => i }
  device         = each.value.device_name
  interface_name = each.value.interface_name
}

resource "iosxr_router_vrrp_interface_ipv4" "vrrp_if_ipv4" {
  for_each       = { for i in local.device_router_vrrp_interface_ipv4 : i.key => i }
  device         = each.value.device_name
  interface_name = each.value.interface_name
  vrrp_id        = each.value.vrrp_id

  version                     = try(each.value.version, null)
  priority                    = try(each.value.priority, null)
  preempt_disable             = try(each.value.preempt_disable, null)
  preempt_delay               = try(each.value.preempt_delay, null)
  timer_advertisement_seconds = try(each.value.timer_advertisement_seconds, null)
  accept_mode_disable         = try(each.value.accept_mode_disable, null)
  name                        = try(each.value.name, null)

  # explicit link-local settings are passed via the interface resource in this provider
  text_authentication = try(each.value.text_authentication, null)
  address             = try(each.value.address, null)

  secondary_addresses = (
    each.value.secondary_addresses == null ? null : [for s in each.value.secondary_addresses : { address = s.address }]
  )

  track_objects = (
    each.value.track_objects == null ? null : [for t in each.value.track_objects : { object_name = t.object_name, priority_decrement = t.priority_decrement }]
  )

  track_interfaces = (
    each.value.track_interfaces == null ? null : [for ti in each.value.track_interfaces : { interface_name = ti.interface_name, priority_decrement = ti.priority_decrement }]
  )

  # support explicit link-local or autoconfigured link-local for VRRPv6
  # (link-local settings are handled on the ipv6 resource)
  depends_on = [iosxr_router_vrrp_interface.vrrp_if, iosxr_interface.main_interface]
}

resource "iosxr_router_vrrp_interface_ipv6" "vrrp_if_ipv6" {
  for_each       = { for i in local.device_router_vrrp_interface_ipv6 : i.key => i }
  device         = each.value.device_name
  interface_name = each.value.interface_name
  vrrp_id        = each.value.vrrp_id

  priority                    = try(each.value.priority, null)
  preempt_disable             = try(each.value.preempt_disable, null)
  preempt_delay               = try(each.value.preempt_delay, null)
  timer_advertisement_seconds = try(each.value.timer_advertisement_seconds, null)
  accept_mode_disable         = try(each.value.accept_mode_disable, null)
  name                        = try(each.value.name, null)

  global_addresses = (
    each.value.global_addresses == null ? null : [for g in each.value.global_addresses : { address = g.address }]
  )

  track_objects = (
    each.value.track_objects == null ? null : [for t in each.value.track_objects : { object_name = t.object_name, priority_decrement = t.priority_decrement }]
  )

  track_interfaces = (
    each.value.track_interfaces == null ? null : [for ti in each.value.track_interfaces : { interface_name = ti.interface_name, priority_decrement = ti.priority_decrement }]
  )

  depends_on = [iosxr_router_vrrp_interface.vrrp_if, iosxr_interface.main_interface]
}

output "vrrp_interface_ids" {
  value       = { for k, r in iosxr_router_vrrp_interface.vrrp_if : k => r.id }
  description = "Map of VRRP interface resource IDs created per device/interface."
}

output "vrrp_ipv4_ids" {
  value       = { for k, r in iosxr_router_vrrp_interface_ipv4.vrrp_if_ipv4 : k => r.id }
  description = "Map of IPv4 VRRP resource IDs created."
}

output "vrrp_ipv6_ids" {
  value       = { for k, r in iosxr_router_vrrp_interface_ipv6.vrrp_if_ipv6 : k => r.id }
  description = "Map of IPv6 VRRP resource IDs created."
}