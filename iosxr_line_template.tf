locals {
  line_templates = flatten([
    for device in local.devices : [
      for template in try(local.device_config[device.name].line_templates, []) : {
        key                         = format("%s/%s", device.name, template.template_name)
        device_name                 = device.name
        template_name               = try(template.template_name, local.defaults.iosxr.devices.configuration.line_templates.template_name, null)
        absolute_timeout            = try(template.absolute_timeout, local.defaults.iosxr.devices.configuration.line_templates.absolute_timeout, null)
        access_class_egress         = try(template.access_class_egress, local.defaults.iosxr.devices.configuration.line_templates.access_class_egress, null)
        access_class_ingress        = try(template.access_class_ingress, local.defaults.iosxr.devices.configuration.line_templates.access_class_ingress, null)
        accounting_commands         = try(template.accounting_commands, local.defaults.iosxr.devices.configuration.line_templates.accounting_commands, null)
        accounting_exec             = try(template.accounting_exec, local.defaults.iosxr.devices.configuration.line_templates.accounting_exec, null)
        authorization_commands      = try(template.authorization_commands, local.defaults.iosxr.devices.configuration.line_templates.authorization_commands, null)
        authorization_eventmanager  = try(template.authorization_eventmanager, local.defaults.iosxr.devices.configuration.line_templates.authorization_eventmanager, null)
        authorization_exec          = try(template.authorization_exec, local.defaults.iosxr.devices.configuration.line_templates.authorization_exec, null)
        autocommand                 = try(template.autocommand, local.defaults.iosxr.devices.configuration.line_templates.autocommand, null)
        cli_whitespace_completion   = try(template.cli_whitespace_completion, local.defaults.iosxr.devices.configuration.line_templates.cli_whitespace_completion, null)
        disconnect_character        = try(template.disconnect_character, local.defaults.iosxr.devices.configuration.line_templates.disconnect_character, null)
        escape_character            = try(template.escape_character, local.defaults.iosxr.devices.configuration.line_templates.escape_character, null)
        exec_timeout_minutes        = try(template.exec_timeout_minutes, local.defaults.iosxr.devices.configuration.line_templates.exec_timeout_minutes, null)
        exec_timeout_seconds        = try(template.exec_timeout_seconds, local.defaults.iosxr.devices.configuration.line_templates.exec_timeout_seconds, null)
        length                      = try(template.length, local.defaults.iosxr.devices.configuration.line_templates.length, null)
        login_authentication        = try(template.login_authentication, local.defaults.iosxr.devices.configuration.line_templates.login_authentication, null)
        pager                       = try(template.pager, local.defaults.iosxr.devices.configuration.line_templates.pager, null)
        password_encrypted          = try(template.password_encrypted, local.defaults.iosxr.devices.configuration.line_templates.password_encrypted, null)
        secret_encrypted            = try(template.secret_encrypted, local.defaults.iosxr.devices.configuration.line_templates.secret_encrypted, null)
        session_limit               = try(template.session_limit, local.defaults.iosxr.devices.configuration.line_templates.session_limit, null)
        session_timeout             = try(template.session_timeout, local.defaults.iosxr.devices.configuration.line_templates.session_timeout, null)
        session_timeout_output      = try(template.session_timeout_output, local.defaults.iosxr.devices.configuration.line_templates.session_timeout_output, null)
        telnet_transparent          = try(template.telnet_transparent, local.defaults.iosxr.devices.configuration.line_templates.telnet_transparent, null)
        timeout_login_response      = try(template.timeout_login_response, local.defaults.iosxr.devices.configuration.line_templates.timeout_login_response, null)
        timestamp_disable           = try(template.timestamp_disable, local.defaults.iosxr.devices.configuration.line_templates.timestamp_disable, null)
        transport_input_all         = try(template.transport_input, local.defaults.iosxr.devices.configuration.line_templates.transport_input, null) == "all" ? true : null
        transport_input_none        = try(template.transport_input, local.defaults.iosxr.devices.configuration.line_templates.transport_input, null) == "none" ? true : null
        transport_input_ssh         = try(template.transport_input, local.defaults.iosxr.devices.configuration.line_templates.transport_input, null) == "ssh" ? true : null
        transport_input_ssh_telnet  = try(template.transport_input, local.defaults.iosxr.devices.configuration.line_templates.transport_input, null) == "ssh_telnet" ? true : null
        transport_input_telnet      = try(template.transport_input, local.defaults.iosxr.devices.configuration.line_templates.transport_input, null) == "telnet" ? true : null
        transport_output_all        = try(template.transport_output, local.defaults.iosxr.devices.configuration.line_templates.transport_output, null) == "all" ? true : null
        transport_output_none       = try(template.transport_output, local.defaults.iosxr.devices.configuration.line_templates.transport_output, null) == "none" ? true : null
        transport_output_ssh        = try(template.transport_output, local.defaults.iosxr.devices.configuration.line_templates.transport_output, null) == "ssh" ? true : null
        transport_output_ssh_telnet = try(template.transport_output, local.defaults.iosxr.devices.configuration.line_templates.transport_output, null) == "ssh_telnet" ? true : null
        transport_output_telnet     = try(template.transport_output, local.defaults.iosxr.devices.configuration.line_templates.transport_output, null) == "telnet" ? true : null
        transport_preferred_none    = try(template.transport_preferred, local.defaults.iosxr.devices.configuration.line_templates.transport_preferred, null) == "none" ? true : null
        transport_preferred_ssh     = try(template.transport_preferred, local.defaults.iosxr.devices.configuration.line_templates.transport_preferred, null) == "ssh" ? true : null
        transport_preferred_telnet  = try(template.transport_preferred, local.defaults.iosxr.devices.configuration.line_templates.transport_preferred, null) == "telnet" ? true : null
        width                       = try(template.width, local.defaults.iosxr.devices.configuration.line_templates.width, null)
        users_group = try(length(template.users_group) == 0, true) ? null : [
          for group in template.users_group : {
            group_name = try(group.group_name, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_line_template" "line_template" {
  for_each                    = { for template in local.line_templates : template.key => template }
  device                      = each.value.device_name
  template_name               = each.value.template_name
  absolute_timeout            = each.value.absolute_timeout
  access_class_egress         = each.value.access_class_egress
  access_class_ingress        = each.value.access_class_ingress
  accounting_commands         = each.value.accounting_commands
  accounting_exec             = each.value.accounting_exec
  authorization_commands      = each.value.authorization_commands
  authorization_eventmanager  = each.value.authorization_eventmanager
  authorization_exec          = each.value.authorization_exec
  autocommand                 = each.value.autocommand
  cli_whitespace_completion   = each.value.cli_whitespace_completion
  disconnect_character        = each.value.disconnect_character
  escape_character            = each.value.escape_character
  exec_timeout_minutes        = each.value.exec_timeout_minutes
  exec_timeout_seconds        = each.value.exec_timeout_seconds
  length                      = each.value.length
  login_authentication        = each.value.login_authentication
  pager                       = each.value.pager
  password_encrypted          = each.value.password_encrypted
  secret_encrypted            = each.value.secret_encrypted
  session_limit               = each.value.session_limit
  session_timeout             = each.value.session_timeout
  session_timeout_output      = each.value.session_timeout_output
  telnet_transparent          = each.value.telnet_transparent
  timeout_login_response      = each.value.timeout_login_response
  timestamp_disable           = each.value.timestamp_disable
  transport_input_all         = each.value.transport_input_all
  transport_input_none        = each.value.transport_input_none
  transport_input_ssh         = each.value.transport_input_ssh
  transport_input_ssh_telnet  = each.value.transport_input_ssh_telnet
  transport_input_telnet      = each.value.transport_input_telnet
  transport_output_all        = each.value.transport_output_all
  transport_output_none       = each.value.transport_output_none
  transport_output_ssh        = each.value.transport_output_ssh
  transport_output_ssh_telnet = each.value.transport_output_ssh_telnet
  transport_output_telnet     = each.value.transport_output_telnet
  transport_preferred_none    = each.value.transport_preferred_none
  transport_preferred_ssh     = each.value.transport_preferred_ssh
  transport_preferred_telnet  = each.value.transport_preferred_telnet
  width                       = each.value.width
  users_group                 = each.value.users_group

  depends_on = [
    # TODO: Add once AAA resources are implemented
    # iosxr_aaa.aaa
  ]
}
