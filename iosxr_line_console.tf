resource "iosxr_line_console" "line_console" {
  for_each                    = { for device in local.devices : device.name => device if try(local.device_config[device.name].line.console, null) != null || try(local.defaults.iosxr.devices.configuration.line.console, null) != null }
  device                      = each.value.name
  absolute_timeout            = try(local.device_config[each.value.name].line.console.absolute_timeout, local.defaults.iosxr.devices.configuration.line.console.absolute_timeout, null)
  access_class_egress         = try(local.device_config[each.value.name].line.console.access_class_egress, local.defaults.iosxr.devices.configuration.line.console.access_class_egress, null)
  access_class_ingress        = try(local.device_config[each.value.name].line.console.access_class_ingress, local.defaults.iosxr.devices.configuration.line.console.access_class_ingress, null)
  accounting_commands         = try(local.device_config[each.value.name].line.console.accounting_commands, local.defaults.iosxr.devices.configuration.line.console.accounting_commands, null)
  accounting_exec             = try(local.device_config[each.value.name].line.console.accounting_exec, local.defaults.iosxr.devices.configuration.line.console.accounting_exec, null)
  authorization_commands      = try(local.device_config[each.value.name].line.console.authorization_commands, local.defaults.iosxr.devices.configuration.line.console.authorization_commands, null)
  authorization_eventmanager  = try(local.device_config[each.value.name].line.console.authorization_eventmanager, local.defaults.iosxr.devices.configuration.line.console.authorization_eventmanager, null)
  authorization_exec          = try(local.device_config[each.value.name].line.console.authorization_exec, local.defaults.iosxr.devices.configuration.line.console.authorization_exec, null)
  cli_whitespace_completion   = try(local.device_config[each.value.name].line.console.cli_whitespace_completion, local.defaults.iosxr.devices.configuration.line.console.cli_whitespace_completion, null)
  disconnect_character        = try(local.device_config[each.value.name].line.console.disconnect_character, local.defaults.iosxr.devices.configuration.line.console.disconnect_character, null)
  escape_character            = try(local.device_config[each.value.name].line.console.escape_character, local.defaults.iosxr.devices.configuration.line.console.escape_character, null)
  exec_timeout_minutes        = try(local.device_config[each.value.name].line.console.exec_timeout_minutes, local.defaults.iosxr.devices.configuration.line.console.exec_timeout_minutes, null)
  exec_timeout_seconds        = try(local.device_config[each.value.name].line.console.exec_timeout_seconds, local.defaults.iosxr.devices.configuration.line.console.exec_timeout_seconds, null)
  length                      = try(local.device_config[each.value.name].line.console.length, local.defaults.iosxr.devices.configuration.line.console.length, null)
  login_authentication        = try(local.device_config[each.value.name].line.console.login_authentication, local.defaults.iosxr.devices.configuration.line.console.login_authentication, null)
  pager                       = try(local.device_config[each.value.name].line.console.pager, local.defaults.iosxr.devices.configuration.line.console.pager, null)
  password_encrypted          = try(local.device_config[each.value.name].line.console.password, local.defaults.iosxr.devices.configuration.line.console.password, null)
  secret_encrypted            = try(local.device_config[each.value.name].line.console.secret, local.defaults.iosxr.devices.configuration.line.console.secret, null)
  session_limit               = try(local.device_config[each.value.name].line.console.session_limit, local.defaults.iosxr.devices.configuration.line.console.session_limit, null)
  session_timeout             = try(local.device_config[each.value.name].line.console.session_timeout, local.defaults.iosxr.devices.configuration.line.console.session_timeout, null)
  session_timeout_output      = try(local.device_config[each.value.name].line.console.session_timeout_output, local.defaults.iosxr.devices.configuration.line.console.session_timeout_output, null)
  telnet_transparent          = try(local.device_config[each.value.name].line.console.telnet_transparent, local.defaults.iosxr.devices.configuration.line.console.telnet_transparent, null)
  timeout_login_response      = try(local.device_config[each.value.name].line.console.timeout_login_response, local.defaults.iosxr.devices.configuration.line.console.timeout_login_response, null)
  timestamp_disable           = try(local.device_config[each.value.name].line.console.timestamp_disable, local.defaults.iosxr.devices.configuration.line.console.timestamp_disable, null)
  transport_input_all         = try(contains(local.device_config[each.value.name].line.console.transport_input, "all"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "all"), false) ? true : null
  transport_input_none        = try(contains(local.device_config[each.value.name].line.console.transport_input, "none"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "none"), false) ? true : null
  transport_input_ssh         = try(contains(local.device_config[each.value.name].line.console.transport_input, "ssh"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "ssh"), false) && !try(contains(local.device_config[each.value.name].line.console.transport_input, "telnet"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "telnet"), false) ? true : null
  transport_input_ssh_telnet  = try(contains(local.device_config[each.value.name].line.console.transport_input, "ssh"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "ssh"), false) && try(contains(local.device_config[each.value.name].line.console.transport_input, "telnet"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "telnet"), false) ? true : null
  transport_input_telnet      = try(contains(local.device_config[each.value.name].line.console.transport_input, "telnet"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "telnet"), false) && !try(contains(local.device_config[each.value.name].line.console.transport_input, "ssh"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_input, "ssh"), false) ? true : null
  transport_output_all        = try(contains(local.device_config[each.value.name].line.console.transport_output, "all"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "all"), false) ? true : null
  transport_output_none       = try(contains(local.device_config[each.value.name].line.console.transport_output, "none"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "none"), false) ? true : null
  transport_output_ssh        = try(contains(local.device_config[each.value.name].line.console.transport_output, "ssh"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "ssh"), false) && !try(contains(local.device_config[each.value.name].line.console.transport_output, "telnet"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "telnet"), false) ? true : null
  transport_output_ssh_telnet = try(contains(local.device_config[each.value.name].line.console.transport_output, "ssh"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "ssh"), false) && try(contains(local.device_config[each.value.name].line.console.transport_output, "telnet"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "telnet"), false) ? true : null
  transport_output_telnet     = try(contains(local.device_config[each.value.name].line.console.transport_output, "telnet"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "telnet"), false) && !try(contains(local.device_config[each.value.name].line.console.transport_output, "ssh"), contains(local.defaults.iosxr.devices.configuration.line.console.transport_output, "ssh"), false) ? true : null
  transport_preferred_none    = try(local.device_config[each.value.name].line.console.transport_preferred, local.defaults.iosxr.devices.configuration.line.console.transport_preferred, null) == "none" ? true : null
  transport_preferred_ssh     = try(local.device_config[each.value.name].line.console.transport_preferred, local.defaults.iosxr.devices.configuration.line.console.transport_preferred, null) == "ssh" ? true : null
  transport_preferred_telnet  = try(local.device_config[each.value.name].line.console.transport_preferred, local.defaults.iosxr.devices.configuration.line.console.transport_preferred, null) == "telnet" ? true : null
  width                       = try(local.device_config[each.value.name].line.console.width, local.defaults.iosxr.devices.configuration.line.console.width, null)
  users_group = try(length(local.device_config[each.value.name].line.console.user_groups) == 0, true) ? null : [
    for group in try(local.device_config[each.value.name].line.console.user_groups, []) : {
      group_name = try(group.name, local.defaults.iosxr.devices.configuration.line.console.user_groups.name, null)
    }
  ]

  depends_on = [
    # TODO: Add once AAA resources are implemented
    # iosxr_aaa.aaa
  ]
}
