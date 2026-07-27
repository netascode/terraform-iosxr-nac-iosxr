##### Netconf TTY Agent #####

locals {
  netconf_agent_tty = flatten([
    for device in local.devices : [
      {
        key                     = device.name
        device_name             = device.name
        throttle_process_rate   = try(local.device_config[device.name].netconf.tty_agent.throttle_process_rate, local.defaults.iosxr.devices.configuration.netconf.tty_agent.throttle_process_rate, null)
        throttle_memory         = try(local.device_config[device.name].netconf.tty_agent.throttle_memory, local.defaults.iosxr.devices.configuration.netconf.tty_agent.throttle_memory, null)
        throttle_offload_memory = try(local.device_config[device.name].netconf.tty_agent.throttle_offload_memory, local.defaults.iosxr.devices.configuration.netconf.tty_agent.throttle_offload_memory, null)
        session_timeout         = try(local.device_config[device.name].netconf.tty_agent.session_timeout, local.defaults.iosxr.devices.configuration.netconf.tty_agent.session_timeout, null)
      }
    ] if try(local.device_config[device.name].netconf.tty_agent, null) != null || try(local.defaults.iosxr.devices.configuration.netconf.tty_agent, null) != null
  ])
}

resource "iosxr_netconf_agent_tty" "netconf_agent_tty" {
  for_each                = { for v in local.netconf_agent_tty : v.key => v }
  device                  = each.value.device_name
  throttle_process_rate   = each.value.throttle_process_rate
  throttle_memory         = each.value.throttle_memory
  throttle_offload_memory = each.value.throttle_offload_memory
  session_timeout         = each.value.session_timeout
}

##### Netconf YANG Agent #####

locals {
  netconf_yang_agent = flatten([
    for device in local.devices : [
      {
        key                      = device.name
        device_name              = device.name
        ssh                      = try(local.device_config[device.name].netconf.yang_agent.ssh, local.defaults.iosxr.devices.configuration.netconf.yang_agent.ssh, null)
        with_defaults_support    = try(local.device_config[device.name].netconf.yang_agent.with_defaults_support, local.defaults.iosxr.devices.configuration.netconf.yang_agent.with_defaults_support, null)
        rate_limit               = try(local.device_config[device.name].netconf.yang_agent.rate_limit, local.defaults.iosxr.devices.configuration.netconf.yang_agent.rate_limit, null)
        session_limit            = try(local.device_config[device.name].netconf.yang_agent.session_limit, local.defaults.iosxr.devices.configuration.netconf.yang_agent.session_limit, null)
        session_idle_timeout     = try(local.device_config[device.name].netconf.yang_agent.session_idle_timeout, local.defaults.iosxr.devices.configuration.netconf.yang_agent.session_idle_timeout, null)
        session_absolute_timeout = try(local.device_config[device.name].netconf.yang_agent.session_absolute_timeout, local.defaults.iosxr.devices.configuration.netconf.yang_agent.session_absolute_timeout, null)
        netconf_v1 = try(
          local.device_config[device.name].netconf.yang_agent.netconf_v1 == "v1-only" ? "1.0-only" : local.device_config[device.name].netconf.yang_agent.netconf_v1,
          local.defaults.iosxr.devices.configuration.netconf.yang_agent.netconf_v1 == "v1-only" ? "1.0-only" : local.defaults.iosxr.devices.configuration.netconf.yang_agent.netconf_v1,
          null
        )
        netconf_v1_streaming_disabled = try(local.device_config[device.name].netconf.yang_agent.netconf_v1_streaming_disabled, local.defaults.iosxr.devices.configuration.netconf.yang_agent.netconf_v1_streaming_disabled, null)
      }
    ] if try(local.device_config[device.name].netconf.yang_agent, null) != null || try(local.defaults.iosxr.devices.configuration.netconf.yang_agent, null) != null
  ])
}

resource "iosxr_netconf_yang_agent" "netconf_yang_agent" {
  for_each                      = { for v in local.netconf_yang_agent : v.key => v }
  device                        = each.value.device_name
  ssh                           = each.value.ssh
  with_defaults_support         = each.value.with_defaults_support
  rate_limit                    = each.value.rate_limit
  session_limit                 = each.value.session_limit
  session_idle_timeout          = each.value.session_idle_timeout
  session_absolute_timeout      = each.value.session_absolute_timeout
  netconf_v1                    = each.value.netconf_v1
  netconf_v1_streaming_disabled = each.value.netconf_v1_streaming_disabled
}
