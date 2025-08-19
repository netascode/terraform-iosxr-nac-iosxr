# Login Banner Resources
resource "iosxr_banner" "login_banner" {
  for_each = { for device in local.devices : "${device.name}-login" => device if try(local.device_config[device.name].banner.login, local.defaults.iosxr.configuration.banner.login, null) != null }
  device   = each.value.name

  banner_type = "login"
  line = try(local.device_config[each.value.name].banner.login, local.defaults.iosxr.configuration.banner.login)
}

# MOTD Banner Resources
resource "iosxr_banner" "motd_banner" {
  for_each = { for device in local.devices : "${device.name}-motd" => device if try(local.device_config[device.name].banner.motd, local.defaults.iosxr.configuration.banner.motd, null) != null }
  device   = each.value.name

  banner_type = "motd"
  line = try(local.device_config[each.value.name].banner.motd, local.defaults.iosxr.configuration.banner.motd)
}

# EXEC Banner Resources
resource "iosxr_banner" "exec_banner" {
  for_each = { for device in local.devices : "${device.name}-exec" => device if try(local.device_config[device.name].banner.exec, local.defaults.iosxr.configuration.banner.exec, null) != null }
  device   = each.value.name

  banner_type = "exec"
  line = try(local.device_config[each.value.name].banner.exec, local.defaults.iosxr.configuration.banner.exec)
}