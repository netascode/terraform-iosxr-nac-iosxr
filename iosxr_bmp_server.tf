locals {
  dscp_map = {
    "0"  = "default", "8" = "cs1", "10" = "af11",
    "12" = "af12", "14" = "af13", "16" = "cs2",
    "18" = "af21", "20" = "af22", "22" = "af23",
    "24" = "cs3", "26" = "af31", "28" = "af32",
    "30" = "af33", "32" = "cs4", "34" = "af41",
    "36" = "af42", "38" = "af43", "40" = "cs5",
    "46" = "ef", "48" = "cs6", "56" = "cs7"
  }
  precedence_map = {
    "0" = "routine", "1" = "priority",
    "2" = "immediate", "3" = "flash",
    "4" = "flash-override", "5" = "critical",
    "6" = "internet", "7" = "network"
  }
}

locals {
  bmp_server = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        all_route_monitorings = try(length(local.device_config[device.name].bmp_server.all.route_monitorings) == 0, true) ? null : [for route_monitoring in local.device_config[device.name].bmp_server.all.route_monitorings : {
          route_mon              = try(route_monitoring.type, local.defaults.iosxr.devices.configuration.bmp_server.all.route_monitorings.type, null)
          advertisement_interval = try(route_monitoring.advertisement_interval, local.defaults.iosxr.devices.configuration.bmp_server.all.route_monitorings.advertisement_interval, null)
          scan_time              = try(route_monitoring.scan_time, local.defaults.iosxr.devices.configuration.bmp_server.all.route_monitorings.scan_time, null)
          }
        ]
        all_route_mirroring_inbound_pre_policy = try(local.device_config[device.name].bmp_server.all.route_mirroring_inbound_pre_policy, local.defaults.iosxr.devices.configuration.bmp_server.all.route_mirroring_inbound_pre_policy, null)
        all_max_buffer_size                    = try(local.device_config[device.name].bmp_server.all.max_buffer_size, local.defaults.iosxr.devices.configuration.bmp_server.all.max_buffer_size, null)
        servers = try(length(local.device_config[device.name].bmp_server.servers) == 0, true) ? null : [for server in local.device_config[device.name].bmp_server.servers : {
          number                 = try(server.id, local.defaults.iosxr.devices.configuration.bmp_server.servers.id, null)
          shutdown               = try(server.shutdown, local.defaults.iosxr.devices.configuration.bmp_server.servers.shutdown, null)
          host                   = try(server.host, local.defaults.iosxr.devices.configuration.bmp_server.servers.host, null)
          port                   = try(server.port, local.defaults.iosxr.devices.configuration.bmp_server.servers.port, null)
          initial_delay          = try(server.initial_delay, local.defaults.iosxr.devices.configuration.bmp_server.servers.initial_delay, null)
          flapping_delay         = try(server.flapping_delay, local.defaults.iosxr.devices.configuration.bmp_server.servers.flapping_delay, null)
          initial_refresh_delay  = try(server.initial_refresh_delay, local.defaults.iosxr.devices.configuration.bmp_server.servers.initial_refresh_delay, null)
          initial_refresh_spread = try(server.initial_refresh_spread, local.defaults.iosxr.devices.configuration.bmp_server.servers.initial_refresh_spread, null)
          initial_refresh_skip   = try(server.initial_refresh_skip, local.defaults.iosxr.devices.configuration.bmp_server.servers.initial_refresh_skip, null)
          stats_reporting_period = try(server.stats_reporting_period, local.defaults.iosxr.devices.configuration.bmp_server.servers.stats_reporting_period, null)
          description            = try(server.description, local.defaults.iosxr.devices.configuration.bmp_server.servers.description, null)
          dscp_value = try(lookup(local.dscp_map,
            tostring(try(server.dscp, local.defaults.iosxr.devices.configuration.bmp_server.servers.dscp)),
            tostring(try(server.dscp, local.defaults.iosxr.devices.configuration.bmp_server.servers.dscp))
            ), null
          )
          precedence_value = try(lookup(local.precedence_map,
            tostring(try(server.precedence, local.defaults.iosxr.devices.configuration.bmp_server.servers.precedence)),
            tostring(try(server.precedence, local.defaults.iosxr.devices.configuration.bmp_server.servers.precedence))
            ), null
          )
          update_source  = try(server.update_source, local.defaults.iosxr.devices.configuration.bmp_server.servers.update_source, null)
          vrf            = try(server.vrf, local.defaults.iosxr.devices.configuration.bmp_server.servers.vrf, null)
          tcp_mss        = try(server.tcp_mss, local.defaults.iosxr.devices.configuration.bmp_server.servers.tcp_mss, null)
          tcp_keep_alive = try(server.tcp_keep_alive, local.defaults.iosxr.devices.configuration.bmp_server.servers.tcp_keep_alive, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].bmp_server, null) != null || try(local.defaults.iosxr.devices.configuration.bmp_server, null) != null
  ])
}

resource "iosxr_bmp_server" "bmp_server" {
  for_each                               = { for bmp in local.bmp_server : bmp.key => bmp }
  device                                 = each.value.device_name
  all_route_monitorings                  = each.value.all_route_monitorings
  all_route_mirroring_inbound_pre_policy = each.value.all_route_mirroring_inbound_pre_policy
  all_max_buffer_size                    = each.value.all_max_buffer_size
  servers                                = each.value.servers
}
