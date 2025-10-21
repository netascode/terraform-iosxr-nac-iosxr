locals {
  device_router_static_ipv4_unicast = flatten([
    for device in local.devices : [
      for route in try(local.device_config[device.name].router_static_ipv4_unicast, []) : {
        key            = "${device.name}-${route.prefix_address}-${route.prefix_length}"
        device_name    = device.name
        prefix_address = try(route.prefix_address, local.defaults.iosxr.configuration.router_static_ipv4_unicast.prefix_address, null)
        prefix_length  = try(route.prefix_length, local.defaults.iosxr.configuration.router_static_ipv4_unicast.prefix_length, null)
        nexthop_interfaces = try(length(route.nexthop_interfaces) == 0, true) ? null : [for nh in route.nexthop_interfaces : {
          interface_name  = try(nh.interface_name, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.interface_name, null)
          description     = try(nh.description, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.tag, null)
          distance_metric = try(nh.distance_metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.distance_metric, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interfaces.metric, null)
          }
        ]
        nexthop_interface_addresses = try(length(route.nexthop_interface_addresses) == 0, true) ? null : [for nh in route.nexthop_interface_addresses : {
          interface_name  = try(nh.interface_name, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.interface_name, null)
          address         = try(nh.address, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.address, null)
          description     = try(nh.description, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.tag, null)
          distance_metric = try(nh.distance_metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.distance_metric, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_interface_addresses.metric, null)
          }
        ]
        nexthop_addresses = try(length(route.nexthop_addresses) == 0, true) ? null : [for nh in route.nexthop_addresses : {
          address         = try(nh.address, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.address, null)
          description     = try(nh.description, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.description, null)
          tag             = try(nh.tag, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.tag, null)
          distance_metric = try(nh.distance_metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.distance_metric, null)
          permanent       = try(nh.permanent, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.permanent, null)
          track           = try(nh.track, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.track, null)
          metric          = try(nh.metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.nexthop_addresses.metric, null)
          }
        ]
        vrfs = try(length(route.vrfs) == 0, true) ? null : [for vrf in route.vrfs : {
          vrf_name = try(vrf.vrf_name, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.vrf_name, null)

          nexthop_interfaces = try(length(vrf.nexthop_interfaces) == 0, true) ? null : [for nh in vrf.nexthop_interfaces : {
            interface_name  = try(nh.interface_name, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.interface_name, null)
            description     = try(nh.description, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.tag, null)
            distance_metric = try(nh.distance_metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.distance_metric, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interfaces.metric, null)
            }
          ]
          nexthop_interface_addresses = try(length(vrf.nexthop_interface_addresses) == 0, true) ? null : [for nh in vrf.nexthop_interface_addresses : {
            interface_name  = try(nh.interface_name, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.interface_name, null)
            address         = try(nh.address, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.address, null)
            description     = try(nh.description, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.tag, null)
            distance_metric = try(nh.distance_metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.distance_metric, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_interface_addresses.metric, null)
            }
          ]
          nexthop_addresses = try(length(vrf.nexthop_addresses) == 0, true) ? null : [for nh in vrf.nexthop_addresses : {
            address         = try(nh.address, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.address, null)
            description     = try(nh.description, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.description, null)
            tag             = try(nh.tag, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.tag, null)
            distance_metric = try(nh.distance_metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.distance_metric, null)
            permanent       = try(nh.permanent, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.permanent, null)
            track           = try(nh.track, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.track, null)
            metric          = try(nh.metric, local.defaults.iosxr.configuration.router_static_ipv4_unicast.vrfs.nexthop_addresses.metric, null)
            }
          ]
          }
        ]
      }
    ]
    if try(local.device_config[device.name].router_static_ipv4_unicast, null) != null || try(local.defaults.iosxr.configuration.router_static_ipv4_unicast, null) != null
  ])
}

resource "iosxr_router_static_ipv4_unicast" "router_static_ipv4_unicast" {
  for_each                    = { for route in local.device_router_static_ipv4_unicast : route.key => route }
  device                      = each.value.device_name
  prefix_address              = each.value.prefix_address
  prefix_length               = each.value.prefix_length
  nexthop_interfaces          = each.value.nexthop_interfaces
  nexthop_interface_addresses = each.value.nexthop_interface_addresses
  nexthop_addresses           = each.value.nexthop_addresses
  vrfs                        = each.value.vrfs
}
