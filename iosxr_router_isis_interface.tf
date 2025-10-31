locals {
  router_isis_interface = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : [
        for interface in try(isis_process.interfaces, []) : {
          key                               = format("%s/%s/%s", device.name, isis_process.id, interface.interface_id)
          device_name                       = device.name
          process_id                        = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
          interface_name                    = try(interface.interface_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.interface_id, null)
          bfd_fast_detect_ipv4              = try(interface.bfd_fast_detect_ipv4, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_fast_detect_ipv4, null)
          bfd_fast_detect_ipv6              = try(interface.bfd_fast_detect_ipv6, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_fast_detect_ipv6, null)
          bfd_minimum_interval              = try(interface.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_minimum_interval, null)
          bfd_multiplier                    = try(interface.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.bfd_multiplier, null)
          circuit_type                      = try(interface.circuit_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.circuit_type, null)
          hello_padding                     = try(interface.hello_padding, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding, null)
          hello_password_accept_encrypted   = try(interface.hello_password_accept_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_accept_encrypted, null)
          hello_password_hmac_md5_encrypted = try(interface.hello_password_hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_hmac_md5_encrypted, null)
          hello_password_hmac_md5_send_only = try(interface.hello_password_hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_hmac_md5_send_only, null)
          hello_password_keychain_name      = try(interface.hello_password_keychain_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_keychain_name, null)
          hello_password_keychain_send_only = try(interface.hello_password_keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_keychain_send_only, null)
          hello_password_text_encrypted     = try(interface.hello_password_text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_text_encrypted, null)
          hello_password_text_send_only     = try(interface.hello_password_text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_text_send_only, null)
          point_to_point                    = try(interface.point_to_point, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.point_to_point, null)
          priority                          = try(interface.priority, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority, null)
          state                             = try(interface.state, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.state, null)
          hello_padding_levels = try(length(interface.hello_padding_levels) == 0, true) ? null : [for level in interface.hello_padding_levels : {
            level_number  = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding_levels.level_number, null)
            hello_padding = try(level.hello_padding, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_padding_levels.hello_padding, null)
            }
          ]
          hello_password_accepts_levels = try(length(interface.hello_password_accepts_levels) == 0, true) ? null : [for level in interface.hello_password_accepts_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_accepts_levels.level_number, null)
            encrypted    = try(level.encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_accepts_levels.encrypted, null)
            }
          ]
          hello_password_levels = try(length(interface.hello_password_levels) == 0, true) ? null : [for level in interface.hello_password_levels : {
            level_number       = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.level_number, null)
            keychain_name      = try(level.keychain_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.keychain_name, null)
            keychain_send_only = try(level.keychain_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.keychain_send_only, null)
            hmac_md5_encrypted = try(level.hmac_md5_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.hmac_md5_encrypted, null)
            hmac_md5_send_only = try(level.hmac_md5_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.hmac_md5_send_only, null)
            text_encrypted     = try(level.text_encrypted, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.text_encrypted, null)
            text_send_only     = try(level.text_send_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.hello_password_levels.text_send_only, null)
            }
          ]
          priority_levels = try(length(interface.priority_levels) == 0, true) ? null : [for level in interface.priority_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority_levels.level_number, null)
            priority     = try(level.priority, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.priority_levels.priority, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_isis_interface" "router_isis_interface" {
  for_each                          = { for interface in local.router_isis_interface : interface.key => interface }
  device                            = each.value.device_name
  process_id                        = each.value.process_id
  interface_name                    = each.value.interface_name
  bfd_fast_detect_ipv4              = each.value.bfd_fast_detect_ipv4
  bfd_fast_detect_ipv6              = each.value.bfd_fast_detect_ipv6
  bfd_minimum_interval              = each.value.bfd_minimum_interval
  bfd_multiplier                    = each.value.bfd_multiplier
  circuit_type                      = each.value.circuit_type
  hello_padding                     = each.value.hello_padding
  hello_password_accept_encrypted   = each.value.hello_password_accept_encrypted
  hello_password_hmac_md5_encrypted = each.value.hello_password_hmac_md5_encrypted
  hello_password_hmac_md5_send_only = each.value.hello_password_hmac_md5_send_only
  hello_password_keychain_name      = each.value.hello_password_keychain_name
  hello_password_keychain_send_only = each.value.hello_password_keychain_send_only
  hello_password_text_encrypted     = each.value.hello_password_text_encrypted
  hello_password_text_send_only     = each.value.hello_password_text_send_only
  point_to_point                    = each.value.point_to_point
  priority                          = each.value.priority
  state                             = each.value.state
  hello_padding_levels              = each.value.hello_padding_levels
  hello_password_accepts_levels     = each.value.hello_password_accepts_levels
  hello_password_levels             = each.value.hello_password_levels
  priority_levels                   = each.value.priority_levels

  depends_on = [
    iosxr_router_isis_address_family.router_isis_address_family
  ]
}
