locals {
  device_l2vpn_bridge_groups = flatten([
    for device in local.devices : [
      for bg in try(local.device_config[device.name].l2vpn_bridge_group, local.defaults.iosxr.configuration.l2vpn_bridge_group, []) : {
        device_name = device.name
        group_name  = try(bg.group_name, local.defaults.iosxr.configuration.l2vpn_bridge_group_name, null)
        delete_mode = try(bg.delete_mode, local.defaults.iosxr.configuration.l2vpn_bridge_group_delete_mode, null)
        key         = try("${device.name}-${bg.group_name}", null)
      }
      if try(bg.group_name, local.defaults.iosxr.configuration.l2vpn_bridge_group_name, null) != null
    ]
  ])
}

resource "iosxr_l2vpn_bridge_group" "l2vpn_bridge_group" {
  for_each = { for bg in local.device_l2vpn_bridge_groups : bg.key => bg }

  device      = each.value.device_name
  group_name  = each.value.group_name
  delete_mode = each.value.delete_mode
}