locals {
  tcp = flatten([
    for device in local.devices : [
      {
        key                          = device.name
        device_name                  = device.name
        window_size                  = try(local.device_config[device.name].tcp.window_size, local.defaults.iosxr.devices.configuration.tcp.window_size, null)
        synwait_time                 = try(local.device_config[device.name].tcp.synwait_time, local.defaults.iosxr.devices.configuration.tcp.synwait_time, null)
        path_mtu_discovery           = try(local.device_config[device.name].tcp.path_mtu_discovery, local.defaults.iosxr.devices.configuration.tcp.path_mtu_discovery, null)
        path_mtu_discovery_age_timer = try(tostring(local.device_config[device.name].tcp.path_mtu_discovery_age_timer), tostring(local.defaults.iosxr.devices.configuration.tcp.path_mtu_discovery_age_timer), null)
        receive_queue                = try(local.device_config[device.name].tcp.receive_queue, local.defaults.iosxr.devices.configuration.tcp.receive_queue, null)
        timestamp                    = try(local.device_config[device.name].tcp.timestamp, local.defaults.iosxr.devices.configuration.tcp.timestamp, null)
        throttle                     = try(local.device_config[device.name].tcp.throttle, local.defaults.iosxr.devices.configuration.tcp.throttle, null)
        throttle_high_water_mark     = try(local.device_config[device.name].tcp.throttle_high_water_mark, local.defaults.iosxr.devices.configuration.tcp.throttle_high_water_mark, null)
        selective_ack                = try(local.device_config[device.name].tcp.selective_ack, local.defaults.iosxr.devices.configuration.tcp.selective_ack, null)
        mss                          = try(local.device_config[device.name].tcp.mss, local.defaults.iosxr.devices.configuration.tcp.mss, null)
        accept_rate                  = try(local.device_config[device.name].tcp.accept_rate, local.defaults.iosxr.devices.configuration.tcp.accept_rate, null)
        ao                           = try(local.device_config[device.name].tcp.ao.enable, local.defaults.iosxr.devices.configuration.tcp.ao.enable, null)
        ao_keychains = try(length(local.device_config[device.name].tcp.ao.keychains) == 0, true) ? null : [
          for keychain in local.device_config[device.name].tcp.ao.keychains : {
            keychain_name = try(keychain.name, local.defaults.iosxr.devices.configuration.tcp.ao.keychains.name, null)
            keys = try(length(keychain.keys) == 0, true) ? null : [
              for key in try(keychain.keys, []) : {
                key_name   = try(tostring(key.id), tostring(local.defaults.iosxr.devices.configuration.tcp.ao.keychains.keys.id), null)
                send_id    = try(key.send_id, local.defaults.iosxr.devices.configuration.tcp.ao.keychains.keys.send_id, null)
                receive_id = try(key.receive_id, local.defaults.iosxr.devices.configuration.tcp.ao.keychains.keys.receive_id, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].tcp, null) != null || try(local.defaults.iosxr.devices.configuration.tcp, null) != null
  ])
}

resource "iosxr_tcp" "tcp" {
  for_each                     = { for t in local.tcp : t.key => t }
  device                       = each.value.device_name
  window_size                  = each.value.window_size
  synwait_time                 = each.value.synwait_time
  path_mtu_discovery           = each.value.path_mtu_discovery
  path_mtu_discovery_age_timer = each.value.path_mtu_discovery_age_timer
  receive_queue                = each.value.receive_queue
  timestamp                    = each.value.timestamp
  throttle                     = each.value.throttle
  throttle_high_water_mark     = each.value.throttle_high_water_mark
  selective_ack                = each.value.selective_ack
  mss                          = each.value.mss
  accept_rate                  = each.value.accept_rate
  ao                           = each.value.ao
  ao_keychains                 = each.value.ao_keychains
}
