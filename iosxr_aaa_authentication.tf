resource "iosxr_aaa_authentication" "aaa_authentication" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa_authentication, null) != null ||
    try(local.defaults.iosxr.configuration.aaa_authentication, null) != null
  }
  device = each.value.name

  login = try(length(local.device_config[each.value.name].aaa_authentication.login) == 0, true) ? null : [
    for login in try(local.device_config[each.value.name].aaa_authentication.login, []) : {
      list      = login.list
      a1_local  = try(login.a1_local, null)
      a1_line   = try(login.a1_line, null)
      a1_tacacs = try(login.a1_tacacs, null)
      a1_radius = try(login.a1_radius, null)
      a1_group  = try(login.a1_group, null)
      a2_local  = try(login.a2_local, null)
      a2_line   = try(login.a2_line, null)
      a2_tacacs = try(login.a2_tacacs, null)
      a2_radius = try(login.a2_radius, null)
      a2_group  = try(login.a2_group, null)
      a3_local  = try(login.a3_local, null)
      a3_line   = try(login.a3_line, null)
      a3_tacacs = try(login.a3_tacacs, null)
      a3_radius = try(login.a3_radius, null)
      a3_group  = try(login.a3_group, null)
      a4_local  = try(login.a4_local, null)
      a4_line   = try(login.a4_line, null)
      a4_tacacs = try(login.a4_tacacs, null)
      a4_radius = try(login.a4_radius, null)
      a4_group  = try(login.a4_group, null)
    }
  ]
}
