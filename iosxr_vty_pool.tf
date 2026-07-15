resource "iosxr_vty_pool" "vty_pool" {
  for_each              = { for device in local.devices : device.name => device if try(local.device_config[device.name].vty_pools, null) != null || try(local.defaults.iosxr.devices.configuration.vty_pools, null) != null }
  device                = each.value.name
  default_first_vty     = try(local.device_config[each.value.name].vty_pools.default.from_number, local.defaults.iosxr.devices.configuration.vty_pools.default.from_number, null)
  default_last_vty      = try(local.device_config[each.value.name].vty_pools.default.to_number, local.defaults.iosxr.devices.configuration.vty_pools.default.to_number, null)
  default_line_template = try(local.device_config[each.value.name].vty_pools.default.line_template, local.defaults.iosxr.devices.configuration.vty_pools.default.line_template, null)
  eem_first_vty         = try(local.device_config[each.value.name].vty_pools.eem.from_number, local.defaults.iosxr.devices.configuration.vty_pools.eem.from_number, null)
  eem_last_vty          = try(local.device_config[each.value.name].vty_pools.eem.to_number, local.defaults.iosxr.devices.configuration.vty_pools.eem.to_number, null)
  eem_line_template     = try(local.device_config[each.value.name].vty_pools.eem.line_template, local.defaults.iosxr.devices.configuration.vty_pools.eem.line_template, null)
  pools = try(length(local.device_config[each.value.name].vty_pools.user_defined) == 0, true) ? null : [
    for pool in local.device_config[each.value.name].vty_pools.user_defined : {
      pool_name     = try(pool.name, local.defaults.iosxr.devices.configuration.vty_pools.user_defined.name, null)
      first_vty     = try(tostring(pool.from_number), tostring(local.defaults.iosxr.devices.configuration.vty_pools.user_defined.from_number), null)
      last_vty      = try(tostring(pool.to_number), tostring(local.defaults.iosxr.devices.configuration.vty_pools.user_defined.to_number), null)
      line_template = try(pool.line_template, local.defaults.iosxr.devices.configuration.vty_pools.user_defined.line_template, null)
    }
  ]
}
