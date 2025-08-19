resource "iosxr_banner" "login" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].banner.login.lines, null) != null ||
       try(local.defaults.iosxr.configuration.banner.login.lines, null) != null
  }

  device      = each.value.name
  banner_type = "login"
  line        = join("\n", try(
    local.device_config[each.value.name].banner.login.lines,
    local.defaults.iosxr.configuration.banner.login.lines,
    []
  ))
}