locals {
  device_router_hsrp_interfaces = flatten([
    for device in local.devices : [
      for hsrp_interface in try(local.device_config[device.name].router_hsrp_interface, []) : {
        key                       = "${device.name}-${hsrp_interface.interface_name}"
        device_name               = device.name
        interface_name            = try(hsrp_interface.interface_name, local.defaults.iosxr.configuration.router_hsrp_interface.interface_name, null)
        hsrp_use_bia              = try(hsrp_interface.hsrp_use_bia, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_use_bia, null)
        hsrp_redirects_disable    = try(hsrp_interface.hsrp_redirects_disable, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_redirects_disable, null)
        hsrp_delay_minimum        = try(hsrp_interface.hsrp_delay_minimum, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_delay_minimum, null)
        hsrp_delay_reload         = try(hsrp_interface.hsrp_delay_reload, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_delay_reload, null)
        hsrp_bfd_minimum_interval = try(hsrp_interface.hsrp_bfd_minimum_interval, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_bfd_minimum_interval, null)
        hsrp_bfd_multiplier       = try(hsrp_interface.hsrp_bfd_multiplier, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_bfd_multiplier, null)
        hsrp_mac_refresh          = try(hsrp_interface.hsrp_mac_refresh, local.defaults.iosxr.configuration.router_hsrp_interface.hsrp_mac_refresh, null)
      }
    ]
  ])
}

resource "iosxr_router_hsrp_interface" "router_hsrp_interface" {
  for_each                  = { for hsrp_interface in local.device_router_hsrp_interfaces : hsrp_interface.key => hsrp_interface }
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
