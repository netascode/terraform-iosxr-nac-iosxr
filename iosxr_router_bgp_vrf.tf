locals {
  router_bgp_vrf = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) : {
          key         = format("%s/%s/%s", device.name, bgp_process.as_number, vrf.name)
          device_name = device.name
          as_number   = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name    = try(vrf.name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.name, null)
          mpls_activate_interfaces = try(length(vrf.mpls_activate_interfaces) == 0, true) ? null : [for iface in vrf.mpls_activate_interfaces : {
            interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.mpls_activate_interfaces.name, null)
            }
          ]
          default_information_originate                        = try(vrf.default_information_originate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.default_information_originate, null)
          default_metric                                       = try(vrf.default_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.default_metric, null)
          socket_receive_buffer_size                           = try(vrf.socket_receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_receive_buffer_size, null)
          socket_receive_buffer_size_read                      = try(vrf.socket_receive_buffer_read_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_receive_buffer_read_size, null)
          socket_send_buffer_size                              = try(vrf.socket_send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_send_buffer_size, null)
          socket_send_buffer_size_write                        = try(vrf.socket_send_buffer_write_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_send_buffer_write_size, null)
          nexthop_mpls_forwarding_ibgp                         = try(vrf.nexthop_mpls_forwarding_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.nexthop_mpls_forwarding_ibgp, null)
          nexthop_resolution_allow_default                     = try(vrf.nexthop_resolution_allow_default, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.nexthop_resolution_allow_default, null)
          timers_bgp_keepalive_interval                        = try(vrf.timers_bgp_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_keepalive_interval, null)
          timers_bgp_holddown_zero                             = try(vrf.timers_bgp_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holddown_zero, null)
          timers_bgp_holddown_zero_minimum_acceptable_zero     = try(vrf.timers_bgp_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holddown_zero_minimum_acceptable_zero, null)
          timers_bgp_holddown_zero_minimum_acceptable_holdtime = try(vrf.timers_bgp_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holddown_zero_minimum_acceptable_holdtime, null)
          timers_bgp_holdtime                                  = try(vrf.timers_bgp_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holdtime, null)
          timers_bgp_holdtime_minimum_acceptable_holdtime      = try(vrf.timers_bgp_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.timers_bgp_holdtime_minimum_acceptable_holdtime, null)
          bgp_redistribute_internal                            = try(vrf.bgp_redistribute_internal, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_redistribute_internal, null)
          bgp_router_id                                        = try(vrf.bgp_router_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_router_id, null)
          bgp_unsafe_ebgp_policy                               = try(vrf.bgp_unsafe_ebgp_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_unsafe_ebgp_policy, null)
          bgp_auto_policy_soft_reset_disable                   = try(vrf.bgp_auto_policy_soft_reset_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_auto_policy_soft_reset_disable, null)
          bgp_bestpath_cost_community_ignore                   = try(vrf.bgp_bestpath_cost_community_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_cost_community_ignore, null)
          bgp_bestpath_compare_routerid                        = try(vrf.bgp_bestpath_compare_routerid, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_compare_routerid, null)
          bgp_bestpath_aigp_ignore                             = try(vrf.bgp_bestpath_aigp_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_aigp_ignore, null)
          bgp_bestpath_igp_metric_ignore                       = try(vrf.bgp_bestpath_igp_metric_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_igp_metric_ignore, null)
          bgp_bestpath_med_missing_as_worst                    = try(vrf.bgp_bestpath_med_missing_as_worst, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_med_missing_as_worst, null)
          bgp_bestpath_med_always                              = try(vrf.bgp_bestpath_med_always, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_med_always, null)
          bgp_bestpath_as_path_ignore                          = try(vrf.bgp_bestpath_as_path_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_as_path_ignore, null)
          bgp_bestpath_as_path_multipath_relax                 = try(vrf.bgp_bestpath_as_path_multipath_relax, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_as_path_multipath_relax, null)
          bgp_bestpath_origin_as_use_validity                  = try(vrf.bgp_bestpath_origin_as_use_validity, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_origin_as_use_validity, null)
          bgp_bestpath_origin_as_allow_invalid                 = try(vrf.bgp_bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_origin_as_allow_invalid, null)
          bgp_bestpath_sr_policy_prefer                        = try(vrf.bgp_bestpath_sr_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_sr_policy, null) == "prefer" ? true : null
          bgp_bestpath_sr_policy_force                         = try(vrf.bgp_bestpath_sr_policy, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_bestpath_sr_policy, null) == "force" ? true : null
          bgp_default_local_preference                         = try(vrf.bgp_default_local_preference, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_default_local_preference, null)
          bgp_enforce_first_as_disable                         = try(vrf.bgp_enforce_first_as_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_enforce_first_as_disable, null)
          bgp_fast_external_fallover_disable                   = try(vrf.bgp_fast_external_fallover_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_fast_external_fallover_disable, null)
          bgp_log_neighbor_changes_disable                     = try(vrf.bgp_log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_log_neighbor_changes, null) == "disable" ? true : null
          bgp_log_message_disable                              = try(vrf.bgp_log_message_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_log_message_disable, null)
          bgp_multipath_use_cluster_list_length                = try(vrf.bgp_multipath_use_cluster_list_length, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_multipath_use_cluster_list_length, null)
          bgp_origin_as_validation_signal_ibgp                 = try(vrf.bgp_origin_as_validation_signal_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_origin_as_validation_signal_ibgp, null)
          bgp_origin_as_validation_time_off                    = try(vrf.bgp_origin_as_validation_time == "off" ? true : null, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_origin_as_validation_time == "off" ? true : null, null)
          bgp_origin_as_validation_time                        = try(can(tonumber(vrf.bgp_origin_as_validation_time)) ? tonumber(vrf.bgp_origin_as_validation_time) : null, can(tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_origin_as_validation_time)) ? tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_origin_as_validation_time) : null, null)
          bfd_minimum_interval                                 = try(vrf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bfd_minimum_interval, null)
          bfd_multiplier                                       = try(vrf.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bfd_multiplier, null)
          rd = try(vrf.rd, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd, null) != null ? provider::utils::normalize_bgp_rd(
            try(vrf.rd, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd)
          ) : null
        }
      ]
    ]
  ])
}

resource "iosxr_router_bgp_vrf" "router_bgp_vrf" {
  for_each                                             = { for vrf in local.router_bgp_vrf : vrf.key => vrf }
  device                                               = each.value.device_name
  as_number                                            = each.value.as_number
  vrf_name                                             = each.value.vrf_name
  mpls_activate_interfaces                             = each.value.mpls_activate_interfaces
  default_information_originate                        = each.value.default_information_originate
  default_metric                                       = each.value.default_metric
  socket_receive_buffer_size                           = each.value.socket_receive_buffer_size
  socket_receive_buffer_size_read                      = each.value.socket_receive_buffer_size_read
  socket_send_buffer_size                              = each.value.socket_send_buffer_size
  socket_send_buffer_size_write                        = each.value.socket_send_buffer_size_write
  nexthop_mpls_forwarding_ibgp                         = each.value.nexthop_mpls_forwarding_ibgp
  nexthop_resolution_allow_default                     = each.value.nexthop_resolution_allow_default
  timers_bgp_keepalive_interval                        = each.value.timers_bgp_keepalive_interval
  timers_bgp_holddown_zero                             = each.value.timers_bgp_holddown_zero
  timers_bgp_holddown_zero_minimum_acceptable_zero     = each.value.timers_bgp_holddown_zero_minimum_acceptable_zero
  timers_bgp_holddown_zero_minimum_acceptable_holdtime = each.value.timers_bgp_holddown_zero_minimum_acceptable_holdtime
  timers_bgp_holdtime                                  = each.value.timers_bgp_holdtime
  timers_bgp_holdtime_minimum_acceptable_holdtime      = each.value.timers_bgp_holdtime_minimum_acceptable_holdtime
  bgp_redistribute_internal                            = each.value.bgp_redistribute_internal
  bgp_router_id                                        = each.value.bgp_router_id
  bgp_unsafe_ebgp_policy                               = each.value.bgp_unsafe_ebgp_policy
  bgp_auto_policy_soft_reset_disable                   = each.value.bgp_auto_policy_soft_reset_disable
  bgp_bestpath_cost_community_ignore                   = each.value.bgp_bestpath_cost_community_ignore
  bgp_bestpath_compare_routerid                        = each.value.bgp_bestpath_compare_routerid
  bgp_bestpath_aigp_ignore                             = each.value.bgp_bestpath_aigp_ignore
  bgp_bestpath_igp_metric_ignore                       = each.value.bgp_bestpath_igp_metric_ignore
  bgp_bestpath_med_missing_as_worst                    = each.value.bgp_bestpath_med_missing_as_worst
  bgp_bestpath_med_always                              = each.value.bgp_bestpath_med_always
  bgp_bestpath_as_path_ignore                          = each.value.bgp_bestpath_as_path_ignore
  bgp_bestpath_as_path_multipath_relax                 = each.value.bgp_bestpath_as_path_multipath_relax
  bgp_bestpath_origin_as_use_validity                  = each.value.bgp_bestpath_origin_as_use_validity
  bgp_bestpath_origin_as_allow_invalid                 = each.value.bgp_bestpath_origin_as_allow_invalid
  bgp_bestpath_sr_policy_prefer                        = each.value.bgp_bestpath_sr_policy_prefer
  bgp_bestpath_sr_policy_force                         = each.value.bgp_bestpath_sr_policy_force
  bgp_default_local_preference                         = each.value.bgp_default_local_preference
  bgp_enforce_first_as_disable                         = each.value.bgp_enforce_first_as_disable
  bgp_fast_external_fallover_disable                   = each.value.bgp_fast_external_fallover_disable
  bgp_log_neighbor_changes_disable                     = each.value.bgp_log_neighbor_changes_disable
  bgp_log_message_disable                              = each.value.bgp_log_message_disable
  bgp_multipath_use_cluster_list_length                = each.value.bgp_multipath_use_cluster_list_length
  bgp_origin_as_validation_signal_ibgp                 = each.value.bgp_origin_as_validation_signal_ibgp
  bgp_origin_as_validation_time_off                    = each.value.bgp_origin_as_validation_time_off
  bgp_origin_as_validation_time                        = each.value.bgp_origin_as_validation_time
  bfd_minimum_interval                                 = each.value.bfd_minimum_interval
  bfd_multiplier                                       = each.value.bfd_multiplier
  rd_auto                                              = try(each.value.rd.format == "auto" ? true : null, null)
  rd_two_byte_as_number                                = try(each.value.rd.format == "two_byte_as" ? each.value.rd.as_number : null, null)
  rd_two_byte_as_index                                 = try(each.value.rd.format == "two_byte_as" ? each.value.rd.assigned_number : null, null)
  rd_four_byte_as_number                               = try(each.value.rd.format == "four_byte_as" ? each.value.rd.as_number : null, null)
  rd_four_byte_as_index                                = try(each.value.rd.format == "four_byte_as" ? each.value.rd.assigned_number : null, null)
  rd_ipv4_address_address                              = try(each.value.rd.format == "ipv4_address" ? each.value.rd.ipv4_address : null, null)
  rd_ipv4_address_index                                = try(each.value.rd.format == "ipv4_address" ? each.value.rd.assigned_number : null, null)

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_bmp_server.bmp_server,
    iosxr_vrf.vrf,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn
  ]
}
