locals {
  router_isis_interface_address_family = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : [
        for interface in try(isis_process.interfaces, []) : [
          for af in try(interface.address_family, []) : {
            key                           = format("%s/%s/%s/%s/%s", device.name, isis_process.id, interface.interface_id, af.af_name, af.saf_name)
            device_name                   = device.name
            process_id                    = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
            interface_name                = try(interface.interface_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.interface_id, null)
            af_name                       = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.af_name, null)
            saf_name                      = try(af.saf_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.saf_name, null)
            advertise_prefix_route_policy = try(af.advertise_prefix_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.advertise_prefix_route_policy, null)
            fast_reroute_per_link         = try(af.fast_reroute_per_link, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_link, null)
            fast_reroute_per_prefix       = try(af.fast_reroute_per_prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_per_prefix, null)
            metric_default                = try(af.metric_default, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_default, null)
            metric_maximum                = try(af.metric_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_maximum, null)
            tag                           = try(af.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.tag, null)
            adjacency_sid_absolutes = try(length(af.adjacency_sid_absolutes) == 0, true) ? null : [for sid in af.adjacency_sid_absolutes : {
              absolute_number = try(sid.absolute_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_absolutes.absolute_number, null)
              protected       = try(sid.protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_absolutes.protected, null)
              }
            ]
            adjacency_sid_indices = try(length(af.adjacency_sid_indices) == 0, true) ? null : [for sid in af.adjacency_sid_indices : {
              index_number = try(sid.index_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_indices.index_number, null)
              protected    = try(sid.protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.adjacency_sid_indices.protected, null)
              }
            ]
            advertise_prefix_route_policy_levels = try(length(af.advertise_prefix_route_policy_levels) == 0, true) ? null : [for level in af.advertise_prefix_route_policy_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.advertise_prefix_route_policy_levels.level_number, null)
              route_policy = try(level.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.advertise_prefix_route_policy_levels.route_policy, null)
              }
            ]
            fast_reroute_levels = try(length(af.fast_reroute_levels) == 0, true) ? null : [for level in af.fast_reroute_levels : {
              level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_levels.level_number, null)
              per_link     = try(level.per_link, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_levels.per_link, null)
              per_prefix   = try(level.per_prefix, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.fast_reroute_levels.per_prefix, null)
              }
            ]
            metric_levels = try(length(af.metric_levels) == 0, true) ? null : [for level in af.metric_levels : {
              level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_levels.level_number, null)
              metric_default = try(level.metric_default, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_levels.metric_default, null)
              metric_maximum = try(level.metric_maximum, local.defaults.iosxr.devices.configuration.routing.isis_processes.interfaces.address_family.metric_levels.metric_maximum, null)
              }
            ]
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_isis_interface_address_family" "router_isis_interface_address_family" {
  for_each                             = { for af in local.router_isis_interface_address_family : af.key => af }
  device                               = each.value.device_name
  process_id                           = each.value.process_id
  interface_name                       = each.value.interface_name
  af_name                              = each.value.af_name
  saf_name                             = each.value.saf_name
  advertise_prefix_route_policy        = each.value.advertise_prefix_route_policy
  fast_reroute_per_link                = each.value.fast_reroute_per_link
  fast_reroute_per_prefix              = each.value.fast_reroute_per_prefix
  metric_default                       = each.value.metric_default
  metric_maximum                       = each.value.metric_maximum
  tag                                  = each.value.tag
  adjacency_sid_absolutes              = each.value.adjacency_sid_absolutes
  adjacency_sid_indices                = each.value.adjacency_sid_indices
  advertise_prefix_route_policy_levels = each.value.advertise_prefix_route_policy_levels
  fast_reroute_levels                  = each.value.fast_reroute_levels
  metric_levels                        = each.value.metric_levels

  depends_on = [
    iosxr_router_isis_interface.router_isis_interface
  ]
}
