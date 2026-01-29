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
