locals {
  xml_agent = flatten([
    for device in local.devices : [
      {
        key                       = device.name
        device_name               = device.name
        enable                    = try(local.device_config[device.name].xml_agent.enable, local.defaults.iosxr.devices.configuration.xml_agent.enable, null)
        ipv6_enable               = try(local.device_config[device.name].xml_agent.ipv6_enable, local.defaults.iosxr.devices.configuration.xml_agent.ipv6_enable, null)
        streaming_size            = try(local.device_config[device.name].xml_agent.streaming_size, local.defaults.iosxr.devices.configuration.xml_agent.streaming_size, null)
        iteration_size            = try(tostring(local.device_config[device.name].xml_agent.iteration), tostring(local.defaults.iosxr.devices.configuration.xml_agent.iteration), null)
        throttle_process_rate     = try(local.device_config[device.name].xml_agent.throttle_process_rate, local.defaults.iosxr.devices.configuration.xml_agent.throttle_process_rate, null)
        throttle_memory           = try(local.device_config[device.name].xml_agent.throttle_memory, local.defaults.iosxr.devices.configuration.xml_agent.throttle_memory, null)
        session_timeout           = try(local.device_config[device.name].xml_agent.session_timeout, local.defaults.iosxr.devices.configuration.xml_agent.session_timeout, null)
        tty_enable                = try(local.device_config[device.name].xml_agent.tty.enable, local.defaults.iosxr.devices.configuration.xml_agent.tty.enable, null)
        tty_streaming_size        = try(local.device_config[device.name].xml_agent.tty.streaming_size, local.defaults.iosxr.devices.configuration.xml_agent.tty.streaming_size, null)
        tty_iteration_size        = try(tostring(local.device_config[device.name].xml_agent.tty.iteration), tostring(local.defaults.iosxr.devices.configuration.xml_agent.tty.iteration), null)
        tty_throttle_process_rate = try(local.device_config[device.name].xml_agent.tty.throttle_process_rate, local.defaults.iosxr.devices.configuration.xml_agent.tty.throttle_process_rate, null)
        tty_throttle_memory       = try(local.device_config[device.name].xml_agent.tty.throttle_memory, local.defaults.iosxr.devices.configuration.xml_agent.tty.throttle_memory, null)
        tty_session_timeout       = try(local.device_config[device.name].xml_agent.tty.session_timeout, local.defaults.iosxr.devices.configuration.xml_agent.tty.session_timeout, null)
        ssl_enable                = try(local.device_config[device.name].xml_agent.ssl.enable, local.defaults.iosxr.devices.configuration.xml_agent.ssl.enable, null)
        ssl_streaming_size        = try(local.device_config[device.name].xml_agent.ssl.streaming_size, local.defaults.iosxr.devices.configuration.xml_agent.ssl.streaming_size, null)
        ssl_iteration_size        = try(tostring(local.device_config[device.name].xml_agent.ssl.iteration), tostring(local.defaults.iosxr.devices.configuration.xml_agent.ssl.iteration), null)
        ssl_throttle_process_rate = try(local.device_config[device.name].xml_agent.ssl.throttle_process_rate, local.defaults.iosxr.devices.configuration.xml_agent.ssl.throttle_process_rate, null)
        ssl_throttle_memory       = try(local.device_config[device.name].xml_agent.ssl.throttle_memory, local.defaults.iosxr.devices.configuration.xml_agent.ssl.throttle_memory, null)
        ssl_session_timeout       = try(local.device_config[device.name].xml_agent.ssl.session_timeout, local.defaults.iosxr.devices.configuration.xml_agent.ssl.session_timeout, null)
        vrfs = try(length(local.device_config[device.name].xml_agent.vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].xml_agent.vrfs : {
          vrf_name         = try(vrf.name, local.defaults.iosxr.devices.configuration.xml_agent.vrfs.name, null)
          shutdown         = try(vrf.shutdown, local.defaults.iosxr.devices.configuration.xml_agent.vrfs.shutdown, null)
          ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.xml_agent.vrfs.ipv4_access_list, null)
          ipv6_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.xml_agent.vrfs.ipv6_access_list, null)
          }
        ]
        ssl_vrfs = try(length(local.device_config[device.name].xml_agent.ssl.vrfs) == 0, true) ? null : [for vrf in local.device_config[device.name].xml_agent.ssl.vrfs : {
          vrf_name         = try(vrf.name, local.defaults.iosxr.devices.configuration.xml_agent.ssl.vrfs.name, null)
          shutdown         = try(vrf.shutdown, local.defaults.iosxr.devices.configuration.xml_agent.ssl.vrfs.shutdown, null)
          ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.xml_agent.ssl.vrfs.ipv4_access_list, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].xml_agent, null) != null || try(local.defaults.iosxr.devices.configuration.xml_agent, null) != null
  ])
}

resource "iosxr_xml_agent" "xml_agent" {
  for_each                  = { for xa in local.xml_agent : xa.key => xa }
  device                    = each.value.device_name
  enable                    = each.value.enable
  ipv6_enable               = each.value.ipv6_enable
  streaming_size            = each.value.streaming_size
  iteration_size            = each.value.iteration_size
  throttle_process_rate     = each.value.throttle_process_rate
  throttle_memory           = each.value.throttle_memory
  session_timeout           = each.value.session_timeout
  tty_enable                = each.value.tty_enable
  tty_streaming_size        = each.value.tty_streaming_size
  tty_iteration_size        = each.value.tty_iteration_size
  tty_throttle_process_rate = each.value.tty_throttle_process_rate
  tty_throttle_memory       = each.value.tty_throttle_memory
  tty_session_timeout       = each.value.tty_session_timeout
  ssl_enable                = each.value.ssl_enable
  ssl_streaming_size        = each.value.ssl_streaming_size
  ssl_iteration_size        = each.value.ssl_iteration_size
  ssl_throttle_process_rate = each.value.ssl_throttle_process_rate
  ssl_throttle_memory       = each.value.ssl_throttle_memory
  ssl_session_timeout       = each.value.ssl_session_timeout
  vrfs                      = each.value.vrfs
  ssl_vrfs                  = each.value.ssl_vrfs
}
