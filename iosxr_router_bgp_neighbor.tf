locals {
  router_bgp_neighbor = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for neighbor in try(bgp_process.neighbors, []) : {
          key                                        = format("%s/%s/%s", device.name, bgp_process.as_number, neighbor.address)
          device_name                                = device.name
          as_number                                  = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          address                                    = try(neighbor.address, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.address, null)
          remote_as                                  = try(neighbor.remote_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.remote_as, null)
          maximum_peers                              = try(neighbor.maximum_peers, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.maximum_peers, null)
          remote_as_list                             = try(neighbor.remote_as_list, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.remote_as_list, null)
          as_path_loopcheck_out                      = try(neighbor.as_path_loopcheck_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.as_path_loopcheck_out, null)
          use_neighbor_group                         = try(neighbor.use_neighbor_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.use_neighbor_group, null)
          use_session_group                          = try(neighbor.use_session_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.use_session_group, null)
          advertisement_interval_seconds             = try(neighbor.advertisement_interval_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.advertisement_interval_seconds, null)
          advertisement_interval_milliseconds        = try(neighbor.advertisement_interval_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.advertisement_interval_milliseconds, null)
          description                                = try(neighbor.description, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.description, null)
          ignore_connected_check                     = try(neighbor.ignore_connected_check, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ignore_connected_check, null)
          ignore_connected_check_inheritance_disable = try(neighbor.ignore_connected_check_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ignore_connected_check_inheritance_disable, null)
          ebgp_multihop_maximum_hop_count            = try(neighbor.ebgp_multihop_maximum_hop_count, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_multihop_maximum_hop_count, null)
          ebgp_multihop_mpls                         = try(neighbor.ebgp_multihop_mpls, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_multihop_mpls, null)
          tcp_mss_value                              = try(neighbor.tcp_mss, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mss, null)
          tcp_mss_inheritance_disable                = try(neighbor.tcp_mss_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mss_inheritance_disable, null)
          tcp_mtu_discovery                          = try(neighbor.tcp_mtu_discovery, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mtu_discovery, null)
          tcp_mtu_discovery_inheritance_disable      = try(neighbor.tcp_mtu_discovery_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mtu_discovery_inheritance_disable, null)
          tcp_ip_only_preferred                      = try(neighbor.tcp_ip_only_preferred, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_ip_only_preferred, null)
          tcp_ip_only_preferred_inheritance_disable  = try(neighbor.tcp_ip_only_preferred_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_ip_only_preferred_inheritance_disable, null)
          bmp_activate_servers = try(length(neighbor.bmp_activate_servers) == 0, true) ? null : [for bmp_server in neighbor.bmp_activate_servers : {
            server_number = try(bmp_server.number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bmp_activate_servers.number, null)
            }
          ]
          bfd_minimum_interval                             = try(neighbor.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_minimum_interval, null)
          bfd_multiplier                                   = try(neighbor.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_multiplier, null)
          bfd_fast_detect                                  = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "enable" ? true : null
          bfd_fast_detect_strict_mode                      = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "strict-mode" ? true : null
          bfd_fast_detect_disable                          = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "disable" ? true : null
          bfd_fast_detect_strict_mode_negotiate            = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "strict-mode-negotiate" ? true : null
          bfd_fast_detect_strict_mode_negotiate_override   = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "strict-mode-negotiate-override" ? true : null
          keychain_name                                    = try(neighbor.keychain, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.keychain, null)
          keychain_inheritance_disable                     = try(neighbor.keychain_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.keychain_inheritance_disable, null)
          local_as_inheritance_disable                     = try(neighbor.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_inheritance_disable, null)
          local_as                                         = try(neighbor.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as, null)
          local_as_no_prepend                              = try(neighbor.local_as_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_mode, null) == "no-prepend" ? true : null
          local_as_no_prepend_replace_as                   = try(neighbor.local_as_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_mode, null) == "no-prepend-replace-as" ? true : null
          local_as_no_prepend_replace_as_dual_as           = try(neighbor.local_as_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_mode, null) == "no-prepend-replace-as-dual-as" ? true : null
          password                                         = try(neighbor.password, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.password, null)
          password_inheritance_disable                     = try(neighbor.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.password_inheritance_disable, null)
          receive_buffer_size                              = try(neighbor.receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.receive_buffer_size, null)
          receive_buffer_size_read                         = try(neighbor.receive_buffer_read_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.receive_buffer_read_size, null)
          send_buffer_size                                 = try(neighbor.send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.send_buffer_size, null)
          send_buffer_size_write                           = try(neighbor.send_buffer_write_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.send_buffer_write_size, null)
          fast_fallover                                    = try(neighbor.fast_fallover, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.fast_fallover, null)
          fast_fallover_inheritance_disable                = try(neighbor.fast_fallover_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.fast_fallover_inheritance_disable, null)
          shutdown                                         = try(neighbor.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.shutdown, null)
          timers_keepalive_interval                        = try(neighbor.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_keepalive_interval, null)
          timers_holddown_zero                             = try(neighbor.timers_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holddown_zero, null)
          timers_holddown_zero_minimum_acceptable_zero     = try(neighbor.timers_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holddown_zero_minimum_acceptable_zero, null)
          timers_holddown_zero_minimum_acceptable_holdtime = try(neighbor.timers_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holddown_zero_minimum_acceptable_holdtime, null)
          timers_holdtime                                  = try(neighbor.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holdtime, null)
          timers_holdtime_minimum_acceptable_holdtime      = try(neighbor.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holdtime_minimum_acceptable_holdtime, null)
          local_address                                    = try(neighbor.local_address, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address, null)
          local_address_inheritance_disable                = try(neighbor.local_address_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address_inheritance_disable, null)
          log_neighbor_changes_detail                      = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_neighbor_changes, null) == "detail" ? true : null
          log_neighbor_changes_disable                     = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_neighbor_changes, null) == "disable" ? true : null
          log_neighbor_changes_inheritance_disable         = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_neighbor_changes, null) == "inheritance-disable" ? true : null
          log_message_in_size                              = try(neighbor.log_message_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_in, null)
          log_message_in_disable                           = try(neighbor.log_message_in_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_in_disable, null)
          log_message_in_inheritance_disable               = try(neighbor.log_message_in_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_in_inheritance_disable, null)
          log_message_out_size                             = try(neighbor.log_message_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_out, null)
          log_message_out_disable                          = try(neighbor.log_message_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_out_disable, null)
          log_message_out_inheritance_disable              = try(neighbor.log_message_out_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_out_inheritance_disable, null)
          update_source                                    = try(neighbor.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_source, null)
          local_address_subnet_prefix                      = try(neighbor.local_address_subnet_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address_subnet_prefix, null)
          local_address_subnet_mask                        = try(neighbor.local_address_subnet_length, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address_subnet_length, null)
          dmz_link_bandwidth                               = try(neighbor.dmz_link_bandwidth, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dmz_link_bandwidth, null)
          dmz_link_bandwidth_inheritance_disable           = try(neighbor.dmz_link_bandwidth_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dmz_link_bandwidth_inheritance_disable, null)
          ebgp_recv_extcommunity_dmz                       = try(neighbor.ebgp_recv_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_recv_extcommunity_dmz, null)
          ebgp_recv_extcommunity_dmz_inheritance_disable   = try(neighbor.ebgp_recv_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_recv_extcommunity_dmz_inheritance_disable, null)
          ebgp_send_extcommunity_dmz                       = try(neighbor.ebgp_send_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_send_extcommunity_dmz, null)
          ebgp_send_extcommunity_dmz_cumulative            = try(neighbor.ebgp_send_extcommunity_dmz_cumulative, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_send_extcommunity_dmz_cumulative, null)
          ebgp_send_extcommunity_dmz_inheritance_disable   = try(neighbor.ebgp_send_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_send_extcommunity_dmz_inheritance_disable, null)
          ttl_security                                     = try(neighbor.ttl_security, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ttl_security, null)
          ttl_security_inheritance_disable                 = try(neighbor.ttl_security_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ttl_security_inheritance_disable, null)
          session_open_mode                                = try(neighbor.session_open_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.session_open_mode, null)
          dscp = try(lookup(local.dscp_map,
            tostring(try(neighbor.dscp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dscp)),
            tostring(try(neighbor.dscp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dscp))
            ), null
          )
          precedence = try(lookup(local.precedence_map,
            tostring(try(neighbor.precedence, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.precedence)),
            tostring(try(neighbor.precedence, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.precedence))
            ), null
          )
          capability_additional_paths_send                                  = try(neighbor.capability_additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_additional_paths_send, null)
          capability_additional_paths_send_disable                          = try(neighbor.capability_additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_additional_paths_send_disable, null)
          capability_additional_paths_receive                               = try(neighbor.capability_additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_additional_paths_receive, null)
          capability_additional_paths_receive_disable                       = try(neighbor.capability_additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_additional_paths_receive_disable, null)
          capability_suppress_all                                           = try(neighbor.capability_suppress_all, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_suppress_all, null)
          capability_suppress_all_inheritance_disable                       = try(neighbor.capability_suppress_all_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_suppress_all_inheritance_disable, null)
          capability_suppress_extended_nexthop_encoding                     = try(neighbor.capability_suppress_extended_nexthop_encoding, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_suppress_extended_nexthop_encoding, null)
          capability_suppress_extended_nexthop_encoding_inheritance_disable = try(neighbor.capability_suppress_extended_nexthop_encoding_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_suppress_extended_nexthop_encoding_inheritance_disable, null)
          capability_suppress_four_byte_as                                  = try(neighbor.capability_suppress_four_byte_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_suppress_four_byte_as, null)
          capability_suppress_four_byte_as_inheritance_disable              = try(neighbor.capability_suppress_four_byte_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.capability_suppress_four_byte_as_inheritance_disable, null)
          graceful_restart                                                  = try(neighbor.graceful_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart, null) == "enable" ? true : null
          graceful_restart_disable                                          = try(neighbor.graceful_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart, null) == "disable" ? true : null
          graceful_restart_helper_only                                      = try(neighbor.graceful_restart_helper_only, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart_helper_only, null)
          graceful_restart_helper_only_inheritance_disable                  = try(neighbor.graceful_restart_helper_only_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart_helper_only_inheritance_disable, null)
          graceful_restart_restart_time                                     = try(neighbor.graceful_restart_restart_time, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart_restart_time, null)
          graceful_restart_stalepath_time                                   = try(neighbor.graceful_restart_stalepath_time, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart_stalepath_time, null)
          enforce_first_as                                                  = try(neighbor.enforce_first_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.enforce_first_as, null)
          cluster_id_32bit_format                                           = can(tonumber(try(neighbor.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.cluster_id, null))) ? try(tonumber(neighbor.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.cluster_id), null) : null
          cluster_id_ip_format                                              = can(tonumber(try(neighbor.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.cluster_id, null))) ? null : try(neighbor.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.cluster_id, null)
          idle_watch_time                                                   = try(neighbor.idle_watch_time, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.idle_watch_time, null)
          allowas_in                                                        = try(neighbor.allowas_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.allowas_in, null)
          egress_engineering                                                = try(neighbor.egress_engineering, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.egress_engineering, null)
          egress_engineering_inheritance_disable                            = try(neighbor.egress_engineering_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.egress_engineering_inheritance_disable, null)
          peer_sets = try(length(neighbor.peer_sets) == 0, true) ? null : [for peer_set in neighbor.peer_sets : {
            peer = try(peer_set.id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.peer_sets.id, null)
            }
          ]
          peer_node_sid_index                                            = try(neighbor.peer_node_sid_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.peer_node_sid_index, null)
          ao_key_chain_name                                              = try(neighbor.ao_key_chain, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ao_key_chain, null)
          ao_key_chain_include_tcp_options                               = try(neighbor.ao_key_chain_include_tcp_options, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ao_key_chain_include_tcp_options, null)
          ao_key_chain_accept_mismatch                                   = try(neighbor.ao_key_chain_accept_mismatch, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ao_key_chain_accept_mismatch, null)
          ao_inheritance_disable                                         = try(neighbor.ao_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ao_inheritance_disable, null)
          dampening                                                      = try(neighbor.dampening, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dampening, null)
          as_override                                                    = try(neighbor.as_override, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.as_override, null)
          default_policy_action_in                                       = try(neighbor.default_policy_action_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.default_policy_action_in, null)
          default_policy_action_out                                      = try(neighbor.default_policy_action_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.default_policy_action_out, null)
          origin_as_validation_disable                                   = try(neighbor.origin_as_validation_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.origin_as_validation_disable, null)
          send_extended_community_ebgp                                   = try(neighbor.send_extended_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.send_extended_community_ebgp, null)
          send_extended_community_ebgp_inheritance_disable               = try(neighbor.send_extended_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.send_extended_community_ebgp_inheritance_disable, null)
          bestpath_origin_as_allow_invalid                               = try(neighbor.bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bestpath_origin_as_allow_invalid, null)
          update_in_filtering_message_buffers                            = try(neighbor.update_in_filtering_message_buffers, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_filtering_message_buffers, null)
          update_in_filtering_message_buffers_type                       = try(neighbor.update_in_filtering_message_buffers_type, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_filtering_message_buffers_type, null)
          update_in_filtering_logging_disable                            = try(neighbor.update_in_filtering_logging_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_filtering_logging_disable, null)
          update_in_filtering_attribute_filter_group                     = try(neighbor.update_in_filtering_attribute_filter_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_filtering_attribute_filter_group, null)
          update_in_labeled_unicast_equivalent                           = try(neighbor.update_in_labeled_unicast_equivalent, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_labeled_unicast_equivalent, null)
          update_in_labeled_unicast_equivalent_inheritance_disable       = try(neighbor.update_in_labeled_unicast_equivalent_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_labeled_unicast_equivalent_inheritance_disable, null)
          update_in_error_handling_avoid_reset                           = try(neighbor.update_in_error_handling_avoid_reset, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_error_handling_avoid_reset, null)
          update_in_error_handling_treat_as_withdraw                     = try(neighbor.update_in_error_handling_treat_as_withdraw, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_in_error_handling_treat_as_withdraw, null)
          graceful_maintenance_activate                                  = try(neighbor.graceful_maintenance.activate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.activate, null)
          graceful_maintenance_activate_inheritance_disable              = try(neighbor.graceful_maintenance.activate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.activate_inheritance_disable, null)
          graceful_maintenance_local_preference                          = try(neighbor.graceful_maintenance.local_preference, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.local_preference, null)
          graceful_maintenance_local_preference_inheritance_disable      = try(neighbor.graceful_maintenance.local_preference_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.local_preference_inheritance_disable, null)
          graceful_maintenance_as_prepends_number                        = try(neighbor.graceful_maintenance.as_prepends, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.as_prepends, null)
          graceful_maintenance_as_prepends_inheritance_disable           = try(neighbor.graceful_maintenance.as_prepends_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.as_prepends_inheritance_disable, null)
          graceful_maintenance_bandwidth_aware_percentage_threshold      = try(neighbor.graceful_maintenance.bandwidth_aware_percentage_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.bandwidth_aware_percentage_threshold, null)
          graceful_maintenance_bandwidth_aware_percentage_threshold_high = try(neighbor.graceful_maintenance.bandwidth_aware_percentage_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.bandwidth_aware_percentage_threshold_high, null)
          graceful_maintenance_bandwidth_aware_bandwidth_threshold       = try(neighbor.graceful_maintenance.bandwidth_aware_bandwidth_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.bandwidth_aware_bandwidth_threshold, null)
          graceful_maintenance_bandwidth_aware_bandwidth_threshold_high  = try(neighbor.graceful_maintenance.bandwidth_aware_bandwidth_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.bandwidth_aware_bandwidth_threshold_high, null)
          graceful_maintenance_bandwidth_aware_inheritance_disable       = try(neighbor.graceful_maintenance.bandwidth_aware_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance.bandwidth_aware_inheritance_disable, null)
        }
      ]
    ]
  ])
}

resource "iosxr_router_bgp_neighbor" "router_bgp_neighbor" {
  for_each                                                          = { for n in local.router_bgp_neighbor : n.key => n }
  device                                                            = each.value.device_name
  as_number                                                         = each.value.as_number
  address                                                           = each.value.address
  remote_as                                                         = each.value.remote_as
  maximum_peers                                                     = each.value.maximum_peers
  remote_as_list                                                    = each.value.remote_as_list
  as_path_loopcheck_out                                             = each.value.as_path_loopcheck_out
  use_neighbor_group                                                = each.value.use_neighbor_group
  use_session_group                                                 = each.value.use_session_group
  advertisement_interval_seconds                                    = each.value.advertisement_interval_seconds
  advertisement_interval_milliseconds                               = each.value.advertisement_interval_milliseconds
  description                                                       = each.value.description
  ignore_connected_check                                            = each.value.ignore_connected_check
  ignore_connected_check_inheritance_disable                        = each.value.ignore_connected_check_inheritance_disable
  ebgp_multihop_maximum_hop_count                                   = each.value.ebgp_multihop_maximum_hop_count
  ebgp_multihop_mpls                                                = each.value.ebgp_multihop_mpls
  tcp_mss_value                                                     = each.value.tcp_mss_value
  tcp_mss_inheritance_disable                                       = each.value.tcp_mss_inheritance_disable
  tcp_mtu_discovery                                                 = each.value.tcp_mtu_discovery
  tcp_mtu_discovery_inheritance_disable                             = each.value.tcp_mtu_discovery_inheritance_disable
  tcp_ip_only_preferred                                             = each.value.tcp_ip_only_preferred
  tcp_ip_only_preferred_inheritance_disable                         = each.value.tcp_ip_only_preferred_inheritance_disable
  bmp_activate_servers                                              = each.value.bmp_activate_servers
  bfd_minimum_interval                                              = each.value.bfd_minimum_interval
  bfd_multiplier                                                    = each.value.bfd_multiplier
  bfd_fast_detect                                                   = each.value.bfd_fast_detect
  bfd_fast_detect_strict_mode                                       = each.value.bfd_fast_detect_strict_mode
  bfd_fast_detect_disable                                           = each.value.bfd_fast_detect_disable
  bfd_fast_detect_strict_mode_negotiate                             = each.value.bfd_fast_detect_strict_mode_negotiate
  bfd_fast_detect_strict_mode_negotiate_override                    = each.value.bfd_fast_detect_strict_mode_negotiate_override
  keychain_name                                                     = each.value.keychain_name
  keychain_inheritance_disable                                      = each.value.keychain_inheritance_disable
  local_as_inheritance_disable                                      = each.value.local_as_inheritance_disable
  local_as                                                          = each.value.local_as
  local_as_no_prepend                                               = each.value.local_as_no_prepend
  local_as_no_prepend_replace_as                                    = each.value.local_as_no_prepend_replace_as
  local_as_no_prepend_replace_as_dual_as                            = each.value.local_as_no_prepend_replace_as_dual_as
  password                                                          = each.value.password
  password_inheritance_disable                                      = each.value.password_inheritance_disable
  receive_buffer_size                                               = each.value.receive_buffer_size
  receive_buffer_size_read                                          = each.value.receive_buffer_size_read
  send_buffer_size                                                  = each.value.send_buffer_size
  send_buffer_size_write                                            = each.value.send_buffer_size_write
  fast_fallover                                                     = each.value.fast_fallover
  fast_fallover_inheritance_disable                                 = each.value.fast_fallover_inheritance_disable
  shutdown                                                          = each.value.shutdown
  timers_keepalive_interval                                         = each.value.timers_keepalive_interval
  timers_holddown_zero                                              = each.value.timers_holddown_zero
  timers_holddown_zero_minimum_acceptable_zero                      = each.value.timers_holddown_zero_minimum_acceptable_zero
  timers_holddown_zero_minimum_acceptable_holdtime                  = each.value.timers_holddown_zero_minimum_acceptable_holdtime
  timers_holdtime                                                   = each.value.timers_holdtime
  timers_holdtime_minimum_acceptable_holdtime                       = each.value.timers_holdtime_minimum_acceptable_holdtime
  local_address                                                     = each.value.local_address
  local_address_inheritance_disable                                 = each.value.local_address_inheritance_disable
  log_neighbor_changes_detail                                       = each.value.log_neighbor_changes_detail
  log_neighbor_changes_disable                                      = each.value.log_neighbor_changes_disable
  log_neighbor_changes_inheritance_disable                          = each.value.log_neighbor_changes_inheritance_disable
  log_message_in_size                                               = each.value.log_message_in_size
  log_message_in_disable                                            = each.value.log_message_in_disable
  log_message_in_inheritance_disable                                = each.value.log_message_in_inheritance_disable
  log_message_out_size                                              = each.value.log_message_out_size
  log_message_out_disable                                           = each.value.log_message_out_disable
  log_message_out_inheritance_disable                               = each.value.log_message_out_inheritance_disable
  update_source                                                     = each.value.update_source
  local_address_subnet_prefix                                       = each.value.local_address_subnet_prefix
  local_address_subnet_mask                                         = each.value.local_address_subnet_mask
  dmz_link_bandwidth                                                = each.value.dmz_link_bandwidth
  dmz_link_bandwidth_inheritance_disable                            = each.value.dmz_link_bandwidth_inheritance_disable
  ebgp_recv_extcommunity_dmz                                        = each.value.ebgp_recv_extcommunity_dmz
  ebgp_recv_extcommunity_dmz_inheritance_disable                    = each.value.ebgp_recv_extcommunity_dmz_inheritance_disable
  ebgp_send_extcommunity_dmz                                        = each.value.ebgp_send_extcommunity_dmz
  ebgp_send_extcommunity_dmz_cumulative                             = each.value.ebgp_send_extcommunity_dmz_cumulative
  ebgp_send_extcommunity_dmz_inheritance_disable                    = each.value.ebgp_send_extcommunity_dmz_inheritance_disable
  ttl_security                                                      = each.value.ttl_security
  ttl_security_inheritance_disable                                  = each.value.ttl_security_inheritance_disable
  session_open_mode                                                 = each.value.session_open_mode
  dscp                                                              = each.value.dscp
  precedence                                                        = each.value.precedence
  capability_additional_paths_send                                  = each.value.capability_additional_paths_send
  capability_additional_paths_send_disable                          = each.value.capability_additional_paths_send_disable
  capability_additional_paths_receive                               = each.value.capability_additional_paths_receive
  capability_additional_paths_receive_disable                       = each.value.capability_additional_paths_receive_disable
  capability_suppress_all                                           = each.value.capability_suppress_all
  capability_suppress_all_inheritance_disable                       = each.value.capability_suppress_all_inheritance_disable
  capability_suppress_extended_nexthop_encoding                     = each.value.capability_suppress_extended_nexthop_encoding
  capability_suppress_extended_nexthop_encoding_inheritance_disable = each.value.capability_suppress_extended_nexthop_encoding_inheritance_disable
  capability_suppress_four_byte_as                                  = each.value.capability_suppress_four_byte_as
  capability_suppress_four_byte_as_inheritance_disable              = each.value.capability_suppress_four_byte_as_inheritance_disable
  graceful_restart                                                  = each.value.graceful_restart
  graceful_restart_disable                                          = each.value.graceful_restart_disable
  graceful_restart_helper_only                                      = each.value.graceful_restart_helper_only
  graceful_restart_helper_only_inheritance_disable                  = each.value.graceful_restart_helper_only_inheritance_disable
  graceful_restart_restart_time                                     = each.value.graceful_restart_restart_time
  graceful_restart_stalepath_time                                   = each.value.graceful_restart_stalepath_time
  enforce_first_as                                                  = each.value.enforce_first_as
  cluster_id_32bit_format                                           = each.value.cluster_id_32bit_format
  cluster_id_ip_format                                              = each.value.cluster_id_ip_format
  idle_watch_time                                                   = each.value.idle_watch_time
  allowas_in                                                        = each.value.allowas_in
  egress_engineering                                                = each.value.egress_engineering
  egress_engineering_inheritance_disable                            = each.value.egress_engineering_inheritance_disable
  peer_sets                                                         = each.value.peer_sets
  peer_node_sid_index                                               = each.value.peer_node_sid_index
  ao_key_chain_name                                                 = each.value.ao_key_chain_name
  ao_key_chain_include_tcp_options                                  = each.value.ao_key_chain_include_tcp_options
  ao_key_chain_accept_mismatch                                      = each.value.ao_key_chain_accept_mismatch
  ao_inheritance_disable                                            = each.value.ao_inheritance_disable
  dampening                                                         = each.value.dampening
  as_override                                                       = each.value.as_override
  default_policy_action_in                                          = each.value.default_policy_action_in
  default_policy_action_out                                         = each.value.default_policy_action_out
  origin_as_validation_disable                                      = each.value.origin_as_validation_disable
  send_extended_community_ebgp                                      = each.value.send_extended_community_ebgp
  send_extended_community_ebgp_inheritance_disable                  = each.value.send_extended_community_ebgp_inheritance_disable
  bestpath_origin_as_allow_invalid                                  = each.value.bestpath_origin_as_allow_invalid
  update_in_filtering_message_buffers                               = each.value.update_in_filtering_message_buffers
  update_in_filtering_message_buffers_type                          = each.value.update_in_filtering_message_buffers_type
  update_in_filtering_logging_disable                               = each.value.update_in_filtering_logging_disable
  update_in_filtering_attribute_filter_group                        = each.value.update_in_filtering_attribute_filter_group
  update_in_labeled_unicast_equivalent                              = each.value.update_in_labeled_unicast_equivalent
  update_in_labeled_unicast_equivalent_inheritance_disable          = each.value.update_in_labeled_unicast_equivalent_inheritance_disable
  update_in_error_handling_avoid_reset                              = each.value.update_in_error_handling_avoid_reset
  update_in_error_handling_treat_as_withdraw                        = each.value.update_in_error_handling_treat_as_withdraw
  graceful_maintenance_activate                                     = each.value.graceful_maintenance_activate
  graceful_maintenance_activate_inheritance_disable                 = each.value.graceful_maintenance_activate_inheritance_disable
  graceful_maintenance_local_preference                             = each.value.graceful_maintenance_local_preference
  graceful_maintenance_local_preference_inheritance_disable         = each.value.graceful_maintenance_local_preference_inheritance_disable
  graceful_maintenance_as_prepends_number                           = each.value.graceful_maintenance_as_prepends_number
  graceful_maintenance_as_prepends_inheritance_disable              = each.value.graceful_maintenance_as_prepends_inheritance_disable
  graceful_maintenance_bandwidth_aware_percentage_threshold         = each.value.graceful_maintenance_bandwidth_aware_percentage_threshold
  graceful_maintenance_bandwidth_aware_percentage_threshold_high    = each.value.graceful_maintenance_bandwidth_aware_percentage_threshold_high
  graceful_maintenance_bandwidth_aware_bandwidth_threshold          = each.value.graceful_maintenance_bandwidth_aware_bandwidth_threshold
  graceful_maintenance_bandwidth_aware_bandwidth_threshold_high     = each.value.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high
  graceful_maintenance_bandwidth_aware_inheritance_disable          = each.value.graceful_maintenance_bandwidth_aware_inheritance_disable

  depends_on = [
    iosxr_bmp_server.bmp_server,
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_af_group.router_bgp_af_group,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_session_group.router_bgp_session_group,
  ]
}
