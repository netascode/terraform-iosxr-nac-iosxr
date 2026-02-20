resource "iosxr_vty_pool" "vty_pool" {
  for_each              = { for device in local.devices : device.name => device if try(local.device_config[device.name].vty_pool, null) != null || try(local.defaults.iosxr.devices.configuration.vty_pool, null) != null }
  device                = each.value.name
  default_first_vty     = try(local.device_config[each.value.name].vty_pool.default_first_vty, local.defaults.iosxr.devices.configuration.vty_pool.default_first_vty, null)
  default_last_vty      = try(local.device_config[each.value.name].vty_pool.default_last_vty, local.defaults.iosxr.devices.configuration.vty_pool.default_last_vty, null)
  default_line_template = try(local.device_config[each.value.name].vty_pool.default_line_template, local.defaults.iosxr.devices.configuration.vty_pool.default_line_template, null)
  eem_first_vty         = try(local.device_config[each.value.name].vty_pool.eem_first_vty, local.defaults.iosxr.devices.configuration.vty_pool.eem_first_vty, null)
  eem_last_vty          = try(local.device_config[each.value.name].vty_pool.eem_last_vty, local.defaults.iosxr.devices.configuration.vty_pool.eem_last_vty, null)
  eem_line_template     = try(local.device_config[each.value.name].vty_pool.eem_line_template, local.defaults.iosxr.devices.configuration.vty_pool.eem_line_template, null)
  pools = try(length(local.device_config[each.value.name].vty_pool.pools) == 0, true) ? null : [for pool in local.device_config[each.value.name].vty_pool.pools : {
    pool_name     = pool.pool_name
    first_vty     = try(pool.first_vty, null)
    last_vty      = try(pool.last_vty, null)
    line_template = try(pool.line_template, null)
  }]
}
