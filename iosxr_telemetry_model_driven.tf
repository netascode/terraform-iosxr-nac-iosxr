locals {
  telemetry_model_driven = flatten([
    for device in local.devices : [
      {
        key                                 = device.name
        device_name                         = device.name
        max_containers_per_path             = try(local.device_config[device.name].telemetry_model_driven.max_containers_per_path, local.defaults.iosxr.devices.configuration.telemetry_model_driven.max_containers_per_path, null)
        max_sensor_paths                    = try(local.device_config[device.name].telemetry_model_driven.max_sensor_paths, local.defaults.iosxr.devices.configuration.telemetry_model_driven.max_sensor_paths, null)
        tcp_send_timeout                    = try(local.device_config[device.name].telemetry_model_driven.tcp_send_timeout, local.defaults.iosxr.devices.configuration.telemetry_model_driven.tcp_send_timeout, null)
        strict_timer                        = try(local.device_config[device.name].telemetry_model_driven.strict_timer, local.defaults.iosxr.devices.configuration.telemetry_model_driven.strict_timer, null)
        include_select_leaves_on_events     = try(local.device_config[device.name].telemetry_model_driven.include_select_leaves_on_events, local.defaults.iosxr.devices.configuration.telemetry_model_driven.include_select_leaves_on_events, null)
        include_empty_values                = try(local.device_config[device.name].telemetry_model_driven.include_empty_values, local.defaults.iosxr.devices.configuration.telemetry_model_driven.include_empty_values, null)
        gnmi_target_defined_cadence_factor  = try(local.device_config[device.name].telemetry_model_driven.gnmi.target_defined_cadence_factor, local.defaults.iosxr.devices.configuration.telemetry_model_driven.gnmi.target_defined_cadence_factor, null)
        gnmi_target_defined_minimum_cadence = try(local.device_config[device.name].telemetry_model_driven.gnmi.target_defined_minimum_cadence, local.defaults.iosxr.devices.configuration.telemetry_model_driven.gnmi.target_defined_minimum_cadence, null)
        gnmi_heartbeat_always               = try(local.device_config[device.name].telemetry_model_driven.gnmi.heartbeat_always, local.defaults.iosxr.devices.configuration.telemetry_model_driven.gnmi.heartbeat_always, null)
        gnmi_bundling                       = try(local.device_config[device.name].telemetry_model_driven.gnmi.bundling, local.defaults.iosxr.devices.configuration.telemetry_model_driven.gnmi.bundling, null)
        gnmi_bundling_size                  = try(local.device_config[device.name].telemetry_model_driven.gnmi.bundling_size, local.defaults.iosxr.devices.configuration.telemetry_model_driven.gnmi.bundling_size, null)
        destination_groups = try(length(local.device_config[device.name].telemetry_model_driven.destination_groups) == 0, true) ? null : [
          for dg in local.device_config[device.name].telemetry_model_driven.destination_groups : {
            name = try(dg.name, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.name, null)
            vrf  = try(dg.vrf, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.vrf, null)
            address_family = try(length(dg.destinations) == 0, true) ? null : [
              for dest in try(dg.destinations, []) : {
                af_name                    = can(regex(":", try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, ""))) == true ? "ipv6" : "ipv4"
                address                    = try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, null)
                port                       = try(dest.port, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.port, null)
                encoding                   = try(dest.encoding, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.encoding, null)
                protocol_grpc              = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? true : null
                protocol_grpc_no_tls       = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? try(dest.grpc_no_tls, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.grpc_no_tls, null) : null
                protocol_grpc_tls_hostname = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? try(dest.grpc_tls_hostname, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.grpc_tls_hostname, null) : null
                protocol_grpc_gzip         = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? try(dest.grpc_gzip, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.grpc_gzip, null) : null
                protocol_tcp               = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "tcp" ? true : null
                protocol_udp               = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "udp" ? true : null
                protocol_udp_packetsize    = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "udp" ? try(dest.udp_packetsize, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.udp_packetsize, null) : null
              }
              if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, ""))) == true
              || can(regex(":", try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, ""))) == true
            ]
            destinations = try(length(dg.destinations) == 0, true) ? null : [
              for dest in try(dg.destinations, []) : {
                address                    = try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, null)
                port                       = try(dest.port, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.port, null)
                address_family             = try(dest.address_family, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address_family, null)
                encoding                   = try(dest.encoding, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.encoding, null)
                protocol_grpc              = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? true : null
                protocol_grpc_no_tls       = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? try(dest.grpc_no_tls, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.grpc_no_tls, null) : null
                protocol_grpc_tls_hostname = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? try(dest.grpc_tls_hostname, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.grpc_tls_hostname, null) : null
                protocol_grpc_gzip         = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "grpc" ? try(dest.grpc_gzip, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.grpc_gzip, null) : null
                protocol_tcp               = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "tcp" ? true : null
                protocol_udp               = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "udp" ? true : null
                protocol_udp_packetsize    = try(dest.protocol, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.protocol, null) == "udp" ? try(dest.udp_packetsize, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.udp_packetsize, null) : null
              }
              if can(regex(":", try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, ""))) == false
              && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(dest.address, local.defaults.iosxr.devices.configuration.telemetry_model_driven.destination_groups.destinations.address, ""))) == false
            ]
          }
        ]
        sensor_groups = try(length(local.device_config[device.name].telemetry_model_driven.sensor_groups) == 0, true) ? null : [
          for sg in local.device_config[device.name].telemetry_model_driven.sensor_groups : {
            name = try(sg.name, local.defaults.iosxr.devices.configuration.telemetry_model_driven.sensor_groups.name, null)
            sensor_paths = try(length(sg.sensor_paths) == 0, true) ? null : [
              for sp in try(sg.sensor_paths, []) : {
                name = try(sp.name, local.defaults.iosxr.devices.configuration.telemetry_model_driven.sensor_groups.sensor_paths.name, null)
              }
            ]
          }
        ]
        subscriptions = try(length(local.device_config[device.name].telemetry_model_driven.subscriptions) == 0, true) ? null : [
          for sub in local.device_config[device.name].telemetry_model_driven.subscriptions : {
            name                = try(sub.name, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.name, null)
            source_qos_marking  = try(sub.source_qos_marking, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.source_qos_marking, null)
            source_interface    = try(sub.source_interface, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.source_interface, null)
            send_retry          = try(sub.send_retry, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.send_retry, null)
            send_retry_duration = try(sub.send_retry_duration, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.send_retry_duration, null)
            sensor_group_ids = try(length(sub.sensor_group_ids) == 0, true) ? null : [
              for sgid in try(sub.sensor_group_ids, []) : {
                name               = try(sgid.name, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.sensor_group_ids.name, null)
                mode               = try(sgid.mode, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.sensor_group_ids.mode, null)
                heartbeat_always   = try(sgid.heartbeat_always, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.sensor_group_ids.heartbeat_always, null)
                heartbeat_interval = try(sgid.heartbeat_interval, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.sensor_group_ids.heartbeat_interval, null)
                strict_timer       = try(sgid.strict_timer, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.sensor_group_ids.strict_timer, null)
                sample_interval    = try(sgid.sample_interval, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.sensor_group_ids.sample_interval, null)
              }
            ]
            destination_ids = try(length(sub.destination_ids) == 0, true) ? null : [
              for did in try(sub.destination_ids, []) : {
                name = try(did.name, local.defaults.iosxr.devices.configuration.telemetry_model_driven.subscriptions.destination_ids.name, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].telemetry_model_driven, null) != null || try(local.defaults.iosxr.devices.configuration.telemetry_model_driven, null) != null
  ])
}

resource "iosxr_telemetry_model_driven" "telemetry_model_driven" {
  for_each                            = { for t in local.telemetry_model_driven : t.key => t }
  device                              = each.value.device_name
  max_containers_per_path             = each.value.max_containers_per_path
  max_sensor_paths                    = each.value.max_sensor_paths
  tcp_send_timeout                    = each.value.tcp_send_timeout
  strict_timer                        = each.value.strict_timer
  include_select_leaves_on_events     = each.value.include_select_leaves_on_events
  include_empty_values                = each.value.include_empty_values
  gnmi_target_defined_cadence_factor  = each.value.gnmi_target_defined_cadence_factor
  gnmi_target_defined_minimum_cadence = each.value.gnmi_target_defined_minimum_cadence
  gnmi_heartbeat_always               = each.value.gnmi_heartbeat_always
  gnmi_bundling                       = each.value.gnmi_bundling
  gnmi_bundling_size                  = each.value.gnmi_bundling_size
  destination_groups                  = each.value.destination_groups
  sensor_groups                       = each.value.sensor_groups
  subscriptions                       = each.value.subscriptions
}
