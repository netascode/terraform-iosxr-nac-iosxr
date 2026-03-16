resource "iosxr_aaa_accounting" "aaa_accounting" {
  for_each   = { for device in local.devices : device.name => device if try(local.device_config[device.name].aaa_accounting, null) != null || try(local.defaults.iosxr.devices.configuration.aaa_accounting, null) != null }
  device     = each.value.name
  depends_on = [iosxr_aaa.aaa]

  update_newinfo  = try(local.device_config[each.value.name].aaa_accounting.update_newinfo, local.defaults.iosxr.devices.configuration.aaa_accounting.update_newinfo, null)
  update_periodic = try(local.device_config[each.value.name].aaa_accounting.update_periodic, local.defaults.iosxr.devices.configuration.aaa_accounting.update_periodic, null)

  exec = try(length(local.device_config[each.value.name].aaa_accounting.exec) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa_accounting.exec, []) : {
      list       = try(item.list, null)
      start_stop = try(item.start_stop, null)
      stop_only  = try(item.stop_only, null)
      a1_tacacs  = try(item.a1_tacacs, null)
      a1_radius  = try(item.a1_radius, null)
      a1_group   = try(item.a1_group, null)
      a1_none    = try(item.a1_none, null)
      a2_tacacs  = try(item.a2_tacacs, null)
      a2_radius  = try(item.a2_radius, null)
      a2_group   = try(item.a2_group, null)
      a2_none    = try(item.a2_none, null)
      a3_tacacs  = try(item.a3_tacacs, null)
      a3_radius  = try(item.a3_radius, null)
      a3_group   = try(item.a3_group, null)
      a3_none    = try(item.a3_none, null)
      a4_tacacs  = try(item.a4_tacacs, null)
      a4_radius  = try(item.a4_radius, null)
      a4_group   = try(item.a4_group, null)
      a4_none    = try(item.a4_none, null)
    }
  ]

  commands = try(length(local.device_config[each.value.name].aaa_accounting.commands) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa_accounting.commands, []) : {
      list       = try(item.list, null)
      start_stop = try(item.start_stop, null)
      stop_only  = try(item.stop_only, null)
      a1_tacacs  = try(item.a1_tacacs, null)
      a1_radius  = try(item.a1_radius, null)
      a1_local   = try(item.a1_local, null)
      a1_group   = try(item.a1_group, null)
      a1_none    = try(item.a1_none, null)
      a2_tacacs  = try(item.a2_tacacs, null)
      a2_radius  = try(item.a2_radius, null)
      a2_local   = try(item.a2_local, null)
      a2_group   = try(item.a2_group, null)
      a2_none    = try(item.a2_none, null)
      a3_tacacs  = try(item.a3_tacacs, null)
      a3_radius  = try(item.a3_radius, null)
      a3_local   = try(item.a3_local, null)
      a3_group   = try(item.a3_group, null)
      a3_none    = try(item.a3_none, null)
      a4_tacacs  = try(item.a4_tacacs, null)
      a4_radius  = try(item.a4_radius, null)
      a4_local   = try(item.a4_local, null)
      a4_group   = try(item.a4_group, null)
      a4_none    = try(item.a4_none, null)
    }
  ]

  system = try(length(local.device_config[each.value.name].aaa_accounting.system) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa_accounting.system, []) : {
      list       = try(item.list, null)
      start_stop = try(item.start_stop, null)
      broadcast  = try(item.broadcast, null)
      a1_tacacs  = try(item.a1_tacacs, null)
      a1_radius  = try(item.a1_radius, null)
      a1_group   = try(item.a1_group, null)
      a1_none    = try(item.a1_none, null)
      a2_tacacs  = try(item.a2_tacacs, null)
      a2_radius  = try(item.a2_radius, null)
      a2_group   = try(item.a2_group, null)
      a2_none    = try(item.a2_none, null)
      a3_tacacs  = try(item.a3_tacacs, null)
      a3_radius  = try(item.a3_radius, null)
      a3_group   = try(item.a3_group, null)
      a3_none    = try(item.a3_none, null)
      a4_tacacs  = try(item.a4_tacacs, null)
      a4_radius  = try(item.a4_radius, null)
      a4_group   = try(item.a4_group, null)
      a4_none    = try(item.a4_none, null)
    }
  ]

  network = try(length(local.device_config[each.value.name].aaa_accounting.network) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa_accounting.network, []) : {
      list       = try(item.list, null)
      start_stop = try(item.start_stop, null)
      stop_only  = try(item.stop_only, null)
      a1_tacacs  = try(item.a1_tacacs, null)
      a1_radius  = try(item.a1_radius, null)
      a1_group   = try(item.a1_group, null)
      a1_none    = try(item.a1_none, null)
      a2_tacacs  = try(item.a2_tacacs, null)
      a2_radius  = try(item.a2_radius, null)
      a2_group   = try(item.a2_group, null)
      a2_none    = try(item.a2_none, null)
      a3_tacacs  = try(item.a3_tacacs, null)
      a3_radius  = try(item.a3_radius, null)
      a3_group   = try(item.a3_group, null)
      a3_none    = try(item.a3_none, null)
      a4_tacacs  = try(item.a4_tacacs, null)
      a4_radius  = try(item.a4_radius, null)
      a4_group   = try(item.a4_group, null)
      a4_none    = try(item.a4_none, null)
    }
  ]
}
