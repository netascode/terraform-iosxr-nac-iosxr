##### MONITOR SESSION #####

locals {
  monitor_sessions = flatten([
    for device in local.devices : [
      for ms in try(local.device_config[device.name].monitor_sessions, null) != null ? [local.device_config[device.name].monitor_sessions] : [] : {
        key                         = device.name
        device_name                 = device.name
        router_id                   = try(ms.router_id, local.defaults.iosxr.devices.configuration.monitor_sessions.router_id, null)
        default_capture_disable     = try(ms.default_capture_disable, local.defaults.iosxr.devices.configuration.monitor_sessions.default_capture_disable, null)
        local_capture_capacity_size = try(ms.local_capture.size, local.defaults.iosxr.devices.configuration.monitor_sessions.local_capture.size, null)
        local_capture_unit_kb       = try(ms.local_capture.unit, local.defaults.iosxr.devices.configuration.monitor_sessions.local_capture.unit, "") == "kb" ? true : null
        local_capture_unit_mb       = try(ms.local_capture.unit, local.defaults.iosxr.devices.configuration.monitor_sessions.local_capture.unit, "") == "mb" ? true : null
        local_capture_unit_gb       = try(ms.local_capture.unit, local.defaults.iosxr.devices.configuration.monitor_sessions.local_capture.unit, "") == "gb" ? true : null
        monitor_sessions = try(length(ms.sessions) == 0, true) ? null : [for session in ms.sessions : {
          session_name                        = try(session.name, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.name, null)
          traffic_type                        = try(session.type, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.type, "ethernet")
          destination_interface               = try(session.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.direction, null) == null ? try(session.destination_interface, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_interface, null) : null
          destination_pseudowire              = try(session.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.direction, null) == null ? try(session.destination_pseudowire, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_pseudowire, null) : null
          rx_interface                        = try(session.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.direction, "") == "rx" ? try(session.destination_interface, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_interface, null) : null
          rx_pseudowire                       = try(session.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.direction, "") == "rx" ? try(session.destination_pseudowire, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_pseudowire, null) : null
          tx_interface                        = try(session.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.direction, "") == "tx" ? try(session.destination_interface, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_interface, null) : null
          tx_pseudowire                       = try(session.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.direction, "") == "tx" ? try(session.destination_pseudowire, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_pseudowire, null) : null
          destination_file_size               = try(session.destination_file.size, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_file.size, null)
          destination_file_buffer_type_linear = try(session.destination_file.buffer_type, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_file.buffer_type, "") == "linear" ? true : null
          destination_file_format_pcapng      = try(session.destination_file.format, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_file.format, "") == "pcapng" ? true : null
          destination_file_filter             = try(session.destination_file.filter, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_file.filter, null)
          destination_file_always_on          = try(session.destination_file.always_on, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.destination_file.always_on, null)
          inject_interface                    = try(session.inject_interface, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.inject_interface, null)
          mirror_first                        = try(session.mirror_first, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.mirror_first, null)
          mirror_interval                     = try(session.mirror_interval, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.mirror_interval, null)
          discard_class                       = try(session.discard_class, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.discard_class, null)
          traffic_class                       = try(session.traffic_class, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.traffic_class, null)
          rate_limit_rx                       = try(session.rate_limit_rx, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.rate_limit_rx, null)
          rate_limit_tx                       = try(session.rate_limit_tx, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.rate_limit_tx, null)
          drops_packet_processing             = try(session.drops.packet_processing, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.drops.packet_processing, null)
          drops_traffic_management            = try(session.drops.traffic_management, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.drops.traffic_management, null)
          drops_rx                            = try(session.drops.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.drops.direction, "") == "rx" ? true : null
          drops_tx                            = try(session.drops.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.drops.direction, "") == "tx" ? true : null
          drops_filter                        = try(session.drops.filter, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.drops.filter, null)
          protocol_capture_rx                 = try(session.protocol_capture.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.protocol_capture.direction, "") == "rx" ? true : null
          protocol_capture_tx                 = try(session.protocol_capture.direction, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.protocol_capture.direction, "") == "tx" ? true : null
          protocol_capture_filter             = try(session.protocol_capture.filter, local.defaults.iosxr.devices.configuration.monitor_sessions.sessions.protocol_capture.filter, null)
        }]
      }
    ]
  ])
}

resource "iosxr_monitor_session" "monitor_session" {
  for_each                    = { for ms in local.monitor_sessions : ms.key => ms }
  device                      = each.value.device_name
  router_id                   = each.value.router_id
  default_capture_disable     = each.value.default_capture_disable
  local_capture_capacity_size = each.value.local_capture_capacity_size
  local_capture_unit_kb       = each.value.local_capture_unit_kb
  local_capture_unit_mb       = each.value.local_capture_unit_mb
  local_capture_unit_gb       = each.value.local_capture_unit_gb
  monitor_sessions            = each.value.monitor_sessions
}
