locals {
  # Flatten VRRP list into for_each-friendly maps
  device_router_vrrp_interfaces = flatten([
    for device in local.devices : (
      try(device.configuration.router_vrrp_interface, null) != null ?
      [for v in try(device.configuration.router_vrrp_interface, []) : {
        key                  = "${device.name}-${v.interface_name}"
        device_name          = device.name
        interface_name       = v.interface_name
        mac_refresh          = try(v.mac_refresh, null)
        delay_minimum        = try(v.delay_minimum, null)
        delay_reload         = try(v.delay_reload, null)
        bfd_minimum_interval = try(v.bfd_minimum_interval, null)
        bfd_multiplier       = try(v.bfd_multiplier, null)
      }] : []
    )
  ])
}

resource "iosxr_router_vrrp_interface" "vrrp_if" {
  for_each       = { for i in local.device_router_vrrp_interfaces : i.key => i }
  device         = each.value.device_name
  interface_name = each.value.interface_name

  mac_refresh          = try(each.value.mac_refresh, null)
  delay_minimum        = try(each.value.delay_minimum, null)
  delay_reload         = try(each.value.delay_reload, null)
  bfd_minimum_interval = try(each.value.bfd_minimum_interval, null)
  bfd_multiplier       = try(each.value.bfd_multiplier, null)

  depends_on = [iosxr_interface.main_interface]
}

output "vrrp_interface_ids" {
  value       = { for k, r in iosxr_router_vrrp_interface.vrrp_if : k => r.id }
  description = "Map of VRRP interface resource IDs created per device/interface/vrrp_id."
}