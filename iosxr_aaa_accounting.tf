##### AAA Accounting #####

resource "iosxr_aaa_accounting" "aaa_accounting" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].aaa.accounting, null) != null ||
    try(local.defaults.iosxr.devices.configuration.aaa.accounting, null) != null
  }
  device          = each.value.name
  update_newinfo  = try(local.device_config[each.value.name].aaa.accounting.update_newinfo, local.defaults.iosxr.devices.configuration.aaa.accounting.update_newinfo, null)
  update_periodic = try(local.device_config[each.value.name].aaa.accounting.update_periodic, local.defaults.iosxr.devices.configuration.aaa.accounting.update_periodic, null)
  exec = try(length(try(local.device_config[each.value.name].aaa.accounting.exec, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.exec, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.exec.records, null) == "start-stop" ? true : null
      stop_only  = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.exec.records, null) == "stop-only" ? true : null
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) == "none" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) == "none" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) == "none" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) == "none" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.exec.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  commands = try(length(try(local.device_config[each.value.name].aaa.accounting.commands, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.commands, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.commands.records, null) == "start-stop" ? true : null
      stop_only  = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.commands.records, null) == "stop-only" ? true : null
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "none" ? true : null
      a1_local   = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "local" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "none" ? true : null
      a2_local   = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "local" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "none" ? true : null
      a3_local   = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "local" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "none" ? true : null
      a4_local   = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "local" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "local", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.commands.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  system = try(length(try(local.device_config[each.value.name].aaa.accounting.system, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.system, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.system.records, null) == "start-stop" ? true : null
      broadcast  = try(item.broadcast, local.defaults.iosxr.devices.configuration.aaa.accounting.system.broadcast, null)
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) == "none" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) == "none" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) == "none" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) == "none" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.system.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  network = try(length(try(local.device_config[each.value.name].aaa.accounting.network, [])) == 0, true) ? null : [
    for item in try(local.device_config[each.value.name].aaa.accounting.network, []) : {
      list       = try(item.name, null)
      start_stop = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.network.records, null) == "start-stop" ? true : null
      stop_only  = try(item.records, local.defaults.iosxr.devices.configuration.aaa.accounting.network.records, null) == "stop-only" ? true : null
      a1_none    = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) == "none" ? true : null
      a1_tacacs  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) == "tacacs" ? true : null
      a1_radius  = try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) == "radius" ? true : null
      a1_group   = !contains(["none", "tacacs", "radius"], try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], "")) && try(item.groups[0], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[0], null) != null ? try(item.groups[0], null) : null
      a2_none    = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) == "none" ? true : null
      a2_tacacs  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) == "tacacs" ? true : null
      a2_radius  = try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) == "radius" ? true : null
      a2_group   = !contains(["none", "tacacs", "radius"], try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], "")) && try(item.groups[1], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[1], null) != null ? try(item.groups[1], null) : null
      a3_none    = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) == "none" ? true : null
      a3_tacacs  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) == "tacacs" ? true : null
      a3_radius  = try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) == "radius" ? true : null
      a3_group   = !contains(["none", "tacacs", "radius"], try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], "")) && try(item.groups[2], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[2], null) != null ? try(item.groups[2], null) : null
      a4_none    = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) == "none" ? true : null
      a4_tacacs  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) == "tacacs" ? true : null
      a4_radius  = try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) == "radius" ? true : null
      a4_group   = !contains(["none", "tacacs", "radius"], try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], "")) && try(item.groups[3], local.defaults.iosxr.devices.configuration.aaa.accounting.network.groups[3], null) != null ? try(item.groups[3], null) : null
    }
  ]
  depends_on = [iosxr_aaa.aaa]
}
