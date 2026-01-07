locals {
  router_bgp_vrf = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) : {
          key                                                   = format("%s/%s/%s", device.name, bgp_process.as_number, vrf.vrf_name)
          device_name                                           = device.name
          as_number                                             = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name                                              = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
          default_information_originate                         = try(vrf.default_information_originate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.default_information_originate, null)
          default_metric                                        = try(vrf.default_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.default_metric, null)
          rd_auto                                               = try(vrf.rd_auto, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_auto, null)
          rd_two_byte_as_number                                 = try(vrf.rd_two_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_two_byte_as_number, null)
          rd_two_byte_as_index                                  = try(vrf.rd_two_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_two_byte_as_index, null)
          rd_four_byte_as_number                                = try(vrf.rd_four_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_four_byte_as_number, null)
          rd_four_byte_as_index                                 = try(vrf.rd_four_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_four_byte_as_index, null)
          rd_ipv4_address_address                               = try(vrf.rd_ipv4_address_address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_ipv4_address_address, null)
          rd_ipv4_address_index                                 = try(vrf.rd_ipv4_address_index, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_ipv4_address_index, null)
          timers_bgp_keepalive_interval                         = try(vrf.timers_bgp_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_keepalive_interval, null)
          timers_bgp_keepalive_zero                             = try(vrf.timers_bgp_keepalive_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_keepalive_zero, null)
          timers_bgp_keepalive_zero_holdtime_zero               = try(vrf.timers_bgp_keepalive_zero_holdtime_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_keepalive_zero_holdtime_zero, null)
          timers_bgp_keepalive_zero_minimum_acceptable_holdtime = try(vrf.timers_bgp_keepalive_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_keepalive_zero_minimum_acceptable_holdtime, null)
          timers_bgp_holdtime                                   = try(vrf.timers_bgp_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holdtime, null)
          timers_bgp_holdtime_minimum_acceptable_holdtime       = try(vrf.timers_bgp_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holdtime_minimum_acceptable_holdtime, null)
          bgp_router_id                                         = try(vrf.bgp_router_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_router_id, null)
          bfd_minimum_interval                                  = try(vrf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bfd_minimum_interval, null)
          bfd_multiplier                                        = try(vrf.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bfd_multiplier, null)
          neighbors = try(length(vrf.neighbors) == 0, true) ? null : [for neighbor in vrf.neighbors : {
            address                                           = try(neighbor.ip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ip, null)
            remote_as                                         = try(neighbor.remote_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.remote_as, null)
            description                                       = try(neighbor.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.description, null)
            use_neighbor_group                                = try(neighbor.use_neighbor_group, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.use_neighbor_group, null)
            advertisement_interval_seconds                    = try(neighbor.advertisement_interval_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.advertisement_interval_seconds, null)
            advertisement_interval_milliseconds               = try(neighbor.advertisement_interval_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.advertisement_interval_milliseconds, null)
            ignore_connected_check                            = try(neighbor.ignore_connected_check, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ignore_connected_check, null)
            ebgp_multihop_maximum_hop_count                   = try(neighbor.ebgp_multihop_maximum_hop_count, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_multihop_maximum_hop_count, null)
            bfd_minimum_interval                              = try(neighbor.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_minimum_interval, null)
            bfd_multiplier                                    = try(neighbor.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_multiplier, null)
            bfd_fast_detect                                   = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect, null)
            bfd_fast_detect_strict_mode                       = try(neighbor.bfd_fast_detect_strict_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect_strict_mode, null)
            bfd_fast_detect_disable                           = try(neighbor.bfd_fast_detect_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect_disable, null)
            local_as_inheritance_disable                      = try(neighbor.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_inheritance_disable, null)
            local_as                                          = try(neighbor.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as, null)
            local_as_no_prepend                               = try(neighbor.local_as_no_prepend, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_no_prepend, null)
            local_as_no_prepend_replace_as                    = try(neighbor.local_as_no_prepend_replace_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_no_prepend_replace_as, null)
            local_as_no_prepend_replace_as_dual_as            = try(neighbor.local_as_no_prepend_replace_as_dual_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_no_prepend_replace_as_dual_as, null)
            password                                          = try(neighbor.password, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.password, null)
            password_inheritance_disable                      = try(neighbor.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.password_inheritance_disable, null)
            shutdown                                          = try(neighbor.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.shutdown, null)
            timers_keepalive_interval                         = try(neighbor.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_keepalive_interval, null)
            timers_keepalive_zero                             = try(neighbor.timers_keepalive_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_keepalive_zero, null)
            timers_keepalive_zero_holdtime_zero               = try(neighbor.timers_keepalive_zero_holdtime_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_keepalive_zero_holdtime_zero, null)
            timers_keepalive_zero_minimum_acceptable_holdtime = try(neighbor.timers_keepalive_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_keepalive_zero_minimum_acceptable_holdtime, null)
            timers_holdtime                                   = try(neighbor.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holdtime, null)
            timers_holdtime_minimum_acceptable_holdtime       = try(neighbor.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holdtime_minimum_acceptable_holdtime, null)
            update_source                                     = try(neighbor.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_source, null)
            ttl_security                                      = try(neighbor.ttl_security, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ttl_security, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf" "router_bgp_vrf" {
  for_each                                              = { for vrf in local.router_bgp_vrf : vrf.key => vrf }
  device                                                = each.value.device_name
  as_number                                             = each.value.as_number
  vrf_name                                              = each.value.vrf_name
  default_information_originate                         = each.value.default_information_originate
  default_metric                                        = each.value.default_metric
  rd_auto                                               = each.value.rd_auto
  rd_two_byte_as_number                                 = each.value.rd_two_byte_as_number
  rd_two_byte_as_index                                  = each.value.rd_two_byte_as_index
  rd_four_byte_as_number                                = each.value.rd_four_byte_as_number
  rd_four_byte_as_index                                 = each.value.rd_four_byte_as_index
  rd_ipv4_address_address                               = each.value.rd_ipv4_address_address
  rd_ipv4_address_index                                 = each.value.rd_ipv4_address_index
  timers_bgp_keepalive_interval                         = each.value.timers_bgp_keepalive_interval
  timers_bgp_keepalive_zero                             = each.value.timers_bgp_keepalive_zero
  timers_bgp_keepalive_zero_holdtime_zero               = each.value.timers_bgp_keepalive_zero_holdtime_zero
  timers_bgp_keepalive_zero_minimum_acceptable_holdtime = each.value.timers_bgp_keepalive_zero_minimum_acceptable_holdtime
  timers_bgp_holdtime                                   = each.value.timers_bgp_holdtime
  timers_bgp_holdtime_minimum_acceptable_holdtime       = each.value.timers_bgp_holdtime_minimum_acceptable_holdtime
  bgp_router_id                                         = each.value.bgp_router_id
  bfd_minimum_interval                                  = each.value.bfd_minimum_interval
  bfd_multiplier                                        = each.value.bfd_multiplier
  neighbors                                             = each.value.neighbors

  depends_on = [
    #iosxr_vrf.vrf,
    iosxr_router_bgp.router_bgp,
    iosxr_interface_ethernet.ethernet,
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain
  ]
}
