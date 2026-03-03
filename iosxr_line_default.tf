resource "iosxr_line_default" "line_default" {
  for_each                    = { for device in local.devices : device.name => device if try(local.device_config[device.name].line_default, null) != null || try(local.defaults.iosxr.devices.configuration.line_default, null) != null }
  device                      = each.value.name
  absolute_timeout            = try(local.device_config[each.value.name].line_default.absolute_timeout, local.defaults.iosxr.devices.configuration.line_default.absolute_timeout, null)
  access_class_egress         = try(local.device_config[each.value.name].line_default.access_class_egress, local.defaults.iosxr.devices.configuration.line_default.access_class_egress, null)
  access_class_ingress        = try(local.device_config[each.value.name].line_default.access_class_ingress, local.defaults.iosxr.devices.configuration.line_default.access_class_ingress, null)
  accounting_commands         = try(local.device_config[each.value.name].line_default.accounting_commands, local.defaults.iosxr.devices.configuration.line_default.accounting_commands, null)
  accounting_exec             = try(local.device_config[each.value.name].line_default.accounting_exec, local.defaults.iosxr.devices.configuration.line_default.accounting_exec, null)
  authorization_commands      = try(local.device_config[each.value.name].line_default.authorization_commands, local.defaults.iosxr.devices.configuration.line_default.authorization_commands, null)
  authorization_eventmanager  = try(local.device_config[each.value.name].line_default.authorization_eventmanager, local.defaults.iosxr.devices.configuration.line_default.authorization_eventmanager, null)
  authorization_exec          = try(local.device_config[each.value.name].line_default.authorization_exec, local.defaults.iosxr.devices.configuration.line_default.authorization_exec, null)
  autocommand                 = try(local.device_config[each.value.name].line_default.autocommand, local.defaults.iosxr.devices.configuration.line_default.autocommand, null)
  cli_whitespace_completion   = try(local.device_config[each.value.name].line_default.cli_whitespace_completion, local.defaults.iosxr.devices.configuration.line_default.cli_whitespace_completion, null)
  disconnect_character        = try(local.device_config[each.value.name].line_default.disconnect_character, local.defaults.iosxr.devices.configuration.line_default.disconnect_character, null)
  escape_character            = try(local.device_config[each.value.name].line_default.escape_character, local.defaults.iosxr.devices.configuration.line_default.escape_character, null)
  exec_timeout_minutes        = try(local.device_config[each.value.name].line_default.exec_timeout_minutes, local.defaults.iosxr.devices.configuration.line_default.exec_timeout_minutes, null)
  exec_timeout_seconds        = try(local.device_config[each.value.name].line_default.exec_timeout_seconds, local.defaults.iosxr.devices.configuration.line_default.exec_timeout_seconds, null)
  length                      = try(local.device_config[each.value.name].line_default.length, local.defaults.iosxr.devices.configuration.line_default.length, null)
  login_authentication        = try(local.device_config[each.value.name].line_default.login_authentication, local.defaults.iosxr.devices.configuration.line_default.login_authentication, null)
  pager                       = try(local.device_config[each.value.name].line_default.pager, local.defaults.iosxr.devices.configuration.line_default.pager, null)
  password_encrypted          = try(local.device_config[each.value.name].line_default.password_encrypted, local.defaults.iosxr.devices.configuration.line_default.password_encrypted, null)
  secret_encrypted            = try(local.device_config[each.value.name].line_default.secret_encrypted, local.defaults.iosxr.devices.configuration.line_default.secret_encrypted, null)
  session_limit               = try(local.device_config[each.value.name].line_default.session_limit, local.defaults.iosxr.devices.configuration.line_default.session_limit, null)
  session_timeout             = try(local.device_config[each.value.name].line_default.session_timeout, local.defaults.iosxr.devices.configuration.line_default.session_timeout, null)
  session_timeout_output      = try(local.device_config[each.value.name].line_default.session_timeout_output, local.defaults.iosxr.devices.configuration.line_default.session_timeout_output, null)
  telnet_transparent          = try(local.device_config[each.value.name].line_default.telnet_transparent, local.defaults.iosxr.devices.configuration.line_default.telnet_transparent, null)
  timeout_login_response      = try(local.device_config[each.value.name].line_default.timeout_login_response, local.defaults.iosxr.devices.configuration.line_default.timeout_login_response, null)
  timestamp_disable           = try(local.device_config[each.value.name].line_default.timestamp_disable, local.defaults.iosxr.devices.configuration.line_default.timestamp_disable, null)
  transport_input_all         = try(local.device_config[each.value.name].line_default.transport_input, local.defaults.iosxr.devices.configuration.line_default.transport_input, null) == "all" ? true : null
  transport_input_none        = try(local.device_config[each.value.name].line_default.transport_input, local.defaults.iosxr.devices.configuration.line_default.transport_input, null) == "none" ? true : null
  transport_input_ssh         = try(local.device_config[each.value.name].line_default.transport_input, local.defaults.iosxr.devices.configuration.line_default.transport_input, null) == "ssh" ? true : null
  transport_input_ssh_telnet  = try(local.device_config[each.value.name].line_default.transport_input, local.defaults.iosxr.devices.configuration.line_default.transport_input, null) == "ssh_telnet" ? true : null
  transport_input_telnet      = try(local.device_config[each.value.name].line_default.transport_input, local.defaults.iosxr.devices.configuration.line_default.transport_input, null) == "telnet" ? true : null
  transport_output_all        = try(local.device_config[each.value.name].line_default.transport_output, local.defaults.iosxr.devices.configuration.line_default.transport_output, null) == "all" ? true : null
  transport_output_none       = try(local.device_config[each.value.name].line_default.transport_output, local.defaults.iosxr.devices.configuration.line_default.transport_output, null) == "none" ? true : null
  transport_output_ssh        = try(local.device_config[each.value.name].line_default.transport_output, local.defaults.iosxr.devices.configuration.line_default.transport_output, null) == "ssh" ? true : null
  transport_output_ssh_telnet = try(local.device_config[each.value.name].line_default.transport_output, local.defaults.iosxr.devices.configuration.line_default.transport_output, null) == "ssh_telnet" ? true : null
  transport_output_telnet     = try(local.device_config[each.value.name].line_default.transport_output, local.defaults.iosxr.devices.configuration.line_default.transport_output, null) == "telnet" ? true : null
  transport_preferred_none    = try(local.device_config[each.value.name].line_default.transport_preferred, local.defaults.iosxr.devices.configuration.line_default.transport_preferred, null) == "none" ? true : null
  transport_preferred_ssh     = try(local.device_config[each.value.name].line_default.transport_preferred, local.defaults.iosxr.devices.configuration.line_default.transport_preferred, null) == "ssh" ? true : null
  transport_preferred_telnet  = try(local.device_config[each.value.name].line_default.transport_preferred, local.defaults.iosxr.devices.configuration.line_default.transport_preferred, null) == "telnet" ? true : null
  width                       = try(local.device_config[each.value.name].line_default.width, local.defaults.iosxr.devices.configuration.line_default.width, null)
  users_group = try(length(local.device_config[each.value.name].line_default.users_group) == 0, true) ? null : [
    for group in local.device_config[each.value.name].line_default.users_group : {
      group_name = try(group.group_name, local.defaults.iosxr.devices.configuration.line_default.users_group.group_name, null)
    }
  ]

  depends_on = [
    # TODO: Add once AAA resources are implemented
    # iosxr_aaa.aaa
  ]
}
