##### AAA Authentication #####

resource "iosxr_aaa_authentication" "aaa_authentication" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa.authentication, null) != null ||
    try(local.defaults.iosxr.devices.configuration.aaa.authentication, null) != null
  }
  device = each.value.name
  login = try(length(local.device_config[each.value.name].aaa.authentication.login) == 0, true) ? null : [
    for login in try(local.device_config[each.value.name].aaa.authentication.login, []) : {
      list      = try(login.name, local.defaults.iosxr.devices.configuration.aaa.authentication.login_defaults.name, null)
      a1_local  = try(login.groups[0], null) == "local" ? true : null
      a1_line   = try(login.groups[0], null) == "line" ? true : null
      a1_tacacs = try(login.groups[0], null) == "tacacs" ? true : null
      a1_radius = try(login.groups[0], null) == "radius" ? true : null
      a1_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[0]) ? login.groups[0] : null, null)
      a2_local  = try(login.groups[1], null) == "local" ? true : null
      a2_line   = try(login.groups[1], null) == "line" ? true : null
      a2_tacacs = try(login.groups[1], null) == "tacacs" ? true : null
      a2_radius = try(login.groups[1], null) == "radius" ? true : null
      a2_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[1]) ? login.groups[1] : null, null)
      a3_local  = try(login.groups[2], null) == "local" ? true : null
      a3_line   = try(login.groups[2], null) == "line" ? true : null
      a3_tacacs = try(login.groups[2], null) == "tacacs" ? true : null
      a3_radius = try(login.groups[2], null) == "radius" ? true : null
      a3_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[2]) ? login.groups[2] : null, null)
      a4_local  = try(login.groups[3], null) == "local" ? true : null
      a4_line   = try(login.groups[3], null) == "line" ? true : null
      a4_tacacs = try(login.groups[3], null) == "tacacs" ? true : null
      a4_radius = try(login.groups[3], null) == "radius" ? true : null
      a4_group  = try(!contains(["local", "line", "tacacs", "radius"], login.groups[3]) ? login.groups[3] : null, null)
    }
  ]
}
