resource "iosxr_banner" "banner" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].banner, null) != null || try(local.defaults.iosxr.configuration.banner, null) != null }
  device   = each.value.name

  banner_type = try(local.device_config[each.value.name].banner.type, local.defaults.iosxr.configuration.banner.type, "login")
  line        = try(local.device_config[each.value.name].banner.line, local.defaults.iosxr.configuration.banner.line, "")
}
