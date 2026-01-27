locals {
  router_bgp = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : {
        key                                                      = format("%s/%s", device.name, bgp_process.as_number)
        device_name                                              = device.name
        as_number                                                = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
        default_metric                                           = try(bgp_process.default_metric, local.defaults.iosxr.devices.configuration.routing.bgp.default_metric, null)
        mvpn                                                     = try(bgp_process.mvpn, local.defaults.iosxr.devices.configuration.routing.bgp.mvpn, null)
        segment_routing_srv6_locator                             = try(bgp_process.segment_routing_srv6.locator, local.defaults.iosxr.devices.configuration.routing.bgp.segment_routing_srv6.locator, null)
        segment_routing_srv6_usid_allocation_wide_local_id_block = try(bgp_process.segment_routing_srv6.usid_allocation_wide_local_id_block, local.defaults.iosxr.devices.configuration.routing.bgp.segment_routing_srv6.usid_allocation_wide_local_id_block, null)
        neighbors = try(length(bgp_process.neighbors) == 0, true) ? null : [for neighbor in bgp_process.neighbors : {
          address                                    = try(neighbor.ip, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ip, null)
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
          tcp_mss_value                              = try(neighbor.tcp_mss_value, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mss_value, null)
          tcp_mss_inheritance_disable                = try(neighbor.tcp_mss_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mss_inheritance_disable, null)
          tcp_mtu_discovery                          = try(neighbor.tcp_mtu_discovery, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mtu_discovery, null)
          tcp_mtu_discovery_inheritance_disable      = try(neighbor.tcp_mtu_discovery_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_mtu_discovery_inheritance_disable, null)
          tcp_ip_only_preferred                      = try(neighbor.tcp_ip_only_preferred, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_ip_only_preferred, null)
          tcp_ip_only_preferred_inheritance_disable  = try(neighbor.tcp_ip_only_preferred_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.tcp_ip_only_preferred_inheritance_disable, null)
          bmp_activate_servers = try(length(neighbor.bmp_activate_servers) == 0, true) ? null : [for bmp_server in neighbor.bmp_activate_servers : {
            server_number = try(bmp_server.server_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bmp_activate_servers.server_number, null)
            }
          ]
          bfd_minimum_interval                                              = try(neighbor.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_minimum_interval, null)
          bfd_multiplier                                                    = try(neighbor.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_multiplier, null)
          bfd_fast_detect                                                   = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "enable" ? true : null
          bfd_fast_detect_strict_mode                                       = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "strict-mode" ? true : null
          bfd_fast_detect_disable                                           = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "disable" ? true : null
          bfd_fast_detect_strict_mode_negotiate                             = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "strict-mode-negotiate" ? true : null
          bfd_fast_detect_strict_mode_negotiate_override                    = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.bfd_fast_detect, null) == "strict-mode-negotiate-override" ? true : null
          keychain_name                                                     = try(neighbor.keychain_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.keychain_name, null)
          keychain_inheritance_disable                                      = try(neighbor.keychain_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.keychain_inheritance_disable, null)
          local_as_inheritance_disable                                      = try(neighbor.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_inheritance_disable, null)
          local_as                                                          = try(neighbor.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as, null)
          local_as_no_prepend                                               = try(neighbor.local_as_no_prepend, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_no_prepend, null)
          local_as_no_prepend_replace_as                                    = try(neighbor.local_as_no_prepend_replace_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_no_prepend_replace_as, null)
          local_as_no_prepend_replace_as_dual_as                            = try(neighbor.local_as_no_prepend_replace_as_dual_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_as_no_prepend_replace_as_dual_as, null)
          password                                                          = try(neighbor.password, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.password, null)
          password_inheritance_disable                                      = try(neighbor.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.password_inheritance_disable, null)
          receive_buffer_size                                               = try(neighbor.receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.receive_buffer_size, null)
          receive_buffer_size_read                                          = try(neighbor.receive_buffer_size_read, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.receive_buffer_size_read, null)
          send_buffer_size                                                  = try(neighbor.send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.send_buffer_size, null)
          send_buffer_size_write                                            = try(neighbor.send_buffer_size_write, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.send_buffer_size_write, null)
          fast_fallover                                                     = try(neighbor.fast_fallover, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.fast_fallover, null)
          fast_fallover_inheritance_disable                                 = try(neighbor.fast_fallover_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.fast_fallover_inheritance_disable, null)
          shutdown                                                          = try(neighbor.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.shutdown, null)
          timers_keepalive_interval                                         = try(neighbor.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_keepalive_interval, null)
          timers_holddown_zero                                              = try(neighbor.timers_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holddown_zero, null)
          timers_holddown_zero_minimum_acceptable_zero                      = try(neighbor.timers_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holddown_zero_minimum_acceptable_zero, null)
          timers_holddown_zero_minimum_acceptable_holdtime                  = try(neighbor.timers_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holddown_zero_minimum_acceptable_holdtime, null)
          timers_holdtime                                                   = try(neighbor.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holdtime, null)
          timers_holdtime_minimum_acceptable_holdtime                       = try(neighbor.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.timers_holdtime_minimum_acceptable_holdtime, null)
          local_address                                                     = try(neighbor.local_address, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address, null)
          local_address_inheritance_disable                                 = try(neighbor.local_address_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address_inheritance_disable, null)
          log_neighbor_changes_detail                                       = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_neighbor_changes, null) == "detail" ? true : null
          log_neighbor_changes_disable                                      = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_neighbor_changes, null) == "disable" ? true : null
          log_neighbor_changes_inheritance_disable                          = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_neighbor_changes, null) == "inheritance-disable" ? true : null
          log_message_in_size                                               = try(neighbor.log_message_in_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_in_size, null)
          log_message_in_disable                                            = try(neighbor.log_message_in_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_in_disable, null)
          log_message_in_inheritance_disable                                = try(neighbor.log_message_in_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_in_inheritance_disable, null)
          log_message_out_size                                              = try(neighbor.log_message_out_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_out_size, null)
          log_message_out_disable                                           = try(neighbor.log_message_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_out_disable, null)
          log_message_out_inheritance_disable                               = try(neighbor.log_message_out_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.log_message_out_inheritance_disable, null)
          update_source                                                     = try(neighbor.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.update_source, null)
          local_address_subnet_prefix                                       = try(neighbor.local_address_subnet_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address_subnet_prefix, null)
          local_address_subnet_mask                                         = try(neighbor.local_address_subnet_mask, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.local_address_subnet_mask, null)
          dmz_link_bandwidth                                                = try(neighbor.dmz_link_bandwidth, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dmz_link_bandwidth, null)
          dmz_link_bandwidth_inheritance_disable                            = try(neighbor.dmz_link_bandwidth_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dmz_link_bandwidth_inheritance_disable, null)
          ebgp_recv_extcommunity_dmz                                        = try(neighbor.ebgp_recv_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_recv_extcommunity_dmz, null)
          ebgp_recv_extcommunity_dmz_inheritance_disable                    = try(neighbor.ebgp_recv_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_recv_extcommunity_dmz_inheritance_disable, null)
          ebgp_send_extcommunity_dmz                                        = try(neighbor.ebgp_send_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_send_extcommunity_dmz, null)
          ebgp_send_extcommunity_dmz_cumulative                             = try(neighbor.ebgp_send_extcommunity_dmz_cumulative, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_send_extcommunity_dmz_cumulative, null)
          ebgp_send_extcommunity_dmz_inheritance_disable                    = try(neighbor.ebgp_send_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ebgp_send_extcommunity_dmz_inheritance_disable, null)
          ttl_security                                                      = try(neighbor.ttl_security, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ttl_security, null)
          ttl_security_inheritance_disable                                  = try(neighbor.ttl_security_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ttl_security_inheritance_disable, null)
          session_open_mode                                                 = try(neighbor.session_open_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.session_open_mode, null)
          dscp                                                              = try(neighbor.dscp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.dscp, null)
          precedence                                                        = try(neighbor.precedence, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.precedence, null)
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
          graceful_restart                                                  = try(neighbor.graceful_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart, null)
          graceful_restart_disable                                          = try(neighbor.graceful_restart_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_restart_disable, null)
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
            peer = try(peer_set.peer, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.peer_sets.peer, null)
            }
          ]
          peer_node_sid_index                                            = try(neighbor.peer_node_sid_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.peer_node_sid_index, null)
          ao_key_chain_name                                              = try(neighbor.ao_key_chain_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.ao_key_chain_name, null)
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
          graceful_maintenance_activate                                  = try(neighbor.graceful_maintenance_activate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_activate, null)
          graceful_maintenance_activate_inheritance_disable              = try(neighbor.graceful_maintenance_activate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_activate_inheritance_disable, null)
          graceful_maintenance_local_preference                          = try(neighbor.graceful_maintenance_local_preference, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_local_preference, null)
          graceful_maintenance_local_preference_inheritance_disable      = try(neighbor.graceful_maintenance_local_preference_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_local_preference_inheritance_disable, null)
          graceful_maintenance_as_prepends_number                        = try(neighbor.graceful_maintenance_as_prepends_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_as_prepends_number, null)
          graceful_maintenance_as_prepends_inheritance_disable           = try(neighbor.graceful_maintenance_as_prepends_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_as_prepends_inheritance_disable, null)
          graceful_maintenance_bandwidth_aware_percentage_threshold      = try(neighbor.graceful_maintenance_bandwidth_aware_percentage_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_bandwidth_aware_percentage_threshold, null)
          graceful_maintenance_bandwidth_aware_percentage_threshold_high = try(neighbor.graceful_maintenance_bandwidth_aware_percentage_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_bandwidth_aware_percentage_threshold_high, null)
          graceful_maintenance_bandwidth_aware_bandwidth_threshold       = try(neighbor.graceful_maintenance_bandwidth_aware_bandwidth_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_bandwidth_aware_bandwidth_threshold, null)
          graceful_maintenance_bandwidth_aware_bandwidth_threshold_high  = try(neighbor.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high, null)
          graceful_maintenance_bandwidth_aware_inheritance_disable       = try(neighbor.graceful_maintenance_bandwidth_aware_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbors.graceful_maintenance_bandwidth_aware_inheritance_disable, null)
          }
        ]
        graceful_maintenance_activate_all_neighbors = try(bgp_process.graceful_maintenance_activate_all_neighbors, local.defaults.iosxr.devices.configuration.routing.bgp.graceful_maintenance_activate_all_neighbors, null)
        graceful_maintenance_activate_retain_routes = try(bgp_process.graceful_maintenance_activate_retain_routes, local.defaults.iosxr.devices.configuration.routing.bgp.graceful_maintenance_activate_retain_routes, null)
        graceful_maintenance_activate_interfaces = try(length(bgp_process.graceful_maintenance_activate_interfaces) == 0, true) ? null : [for interface in bgp_process.graceful_maintenance_activate_interfaces : {
          interface_name = try(interface.interface_name, local.defaults.iosxr.devices.configuration.routing.bgp.graceful_maintenance_activate_interfaces.interface_name, null)
          }
        ]
        graceful_maintenance_activate_locations = try(length(bgp_process.graceful_maintenance_activate_locations) == 0, true) ? null : [for location in bgp_process.graceful_maintenance_activate_locations : {
          location_value = try(location.location_value, local.defaults.iosxr.devices.configuration.routing.bgp.graceful_maintenance_activate_locations.location_value, null)
          }
        ]
        mpls_activate_interfaces = try(length(bgp_process.mpls_activate_interfaces) == 0, true) ? null : [for interface in bgp_process.mpls_activate_interfaces : {
          interface_name = try(interface.interface_name, local.defaults.iosxr.devices.configuration.routing.bgp.mpls_activate_interfaces.interface_name, null)
          }
        ]
        as_league_peers = try(length(bgp_process.as_league_peers) == 0, true) ? null : [for peer in bgp_process.as_league_peers : {
          peer_as_number = try(peer.peer_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_league_peers.peer_as_number, null)
          }
        ]
        attribute_filter_groups = try(length(bgp_process.attribute_filter_groups) == 0, true) ? null : [for group in bgp_process.attribute_filter_groups : {
          group_name = try(group.group_name, local.defaults.iosxr.devices.configuration.routing.bgp.attribute_filter_groups.group_name, null)
          attribute_code_ranges = try(length(group.attribute_code_ranges) == 0, true) ? null : [for range in group.attribute_code_ranges : {
            start             = try(range.start, local.defaults.iosxr.devices.configuration.routing.bgp.attribute_filter_groups.attribute_code_ranges.start, null)
            end               = try(range.end, local.defaults.iosxr.devices.configuration.routing.bgp.attribute_filter_groups.attribute_code_ranges.end, null)
            discard           = try(range.discard, local.defaults.iosxr.devices.configuration.routing.bgp.attribute_filter_groups.attribute_code_ranges.discard, null)
            treat_as_withdraw = try(range.treat_as_withdraw, local.defaults.iosxr.devices.configuration.routing.bgp.attribute_filter_groups.attribute_code_ranges.treat_as_withdraw, null)
            }
          ]
          }
        ]
        as_lists = try(length(bgp_process.as_lists) == 0, true) ? null : [for as_list in bgp_process.as_lists : {
          list_name = try(as_list.list_name, local.defaults.iosxr.devices.configuration.routing.bgp.as_lists.list_name, null)
          as_numbers = try(length(as_list.as_numbers) == 0, true) ? null : [for as_num in as_list.as_numbers : {
            as_value = try(as_num.as_value, local.defaults.iosxr.devices.configuration.routing.bgp.as_lists.as_numbers.as_value, null)
            }
          ]
          }
        ]
        default_information_originate              = try(bgp_process.default_information_originate, local.defaults.iosxr.devices.configuration.routing.bgp.default_information_originate, null)
        socket_receive_buffer_size                 = try(bgp_process.socket_receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.socket_receive_buffer_size, null)
        socket_receive_buffer_size_read            = try(bgp_process.socket_receive_buffer_size_read, local.defaults.iosxr.devices.configuration.routing.bgp.socket_receive_buffer_size_read, null)
        socket_send_buffer_size                    = try(bgp_process.socket_send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.socket_send_buffer_size, null)
        socket_send_buffer_size_write              = try(bgp_process.socket_send_buffer_size_write, local.defaults.iosxr.devices.configuration.routing.bgp.socket_send_buffer_size_write, null)
        nexthop_mpls_forwarding_ibgp               = try(bgp_process.nexthop_mpls_forwarding_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.nexthop_mpls_forwarding_ibgp, null)
        nexthop_validation_color_extcomm_sr_policy = try(bgp_process.nexthop_validation_color_extcomm, local.defaults.iosxr.devices.configuration.routing.bgp.nexthop_validation_color_extcomm, null) == "sr-policy" ? true : null
        nexthop_validation_color_extcomm_disable   = try(bgp_process.nexthop_validation_color_extcomm, local.defaults.iosxr.devices.configuration.routing.bgp.nexthop_validation_color_extcomm, null) == "disable" ? true : null
        nexthop_resolution_allow_default           = try(bgp_process.nexthop_resolution_allow_default, local.defaults.iosxr.devices.configuration.routing.bgp.nexthop_resolution_allow_default, null)
        nexthop_srte_metric_disable                = try(bgp_process.nexthop_srte_metric_disable, local.defaults.iosxr.devices.configuration.routing.bgp.nexthop_srte_metric_disable, null)
        slow_peer_dynamic                          = try(bgp_process.slow_peer_dynamic, local.defaults.iosxr.devices.configuration.routing.bgp.slow_peer_dynamic, null)
        slow_peer_dynamic_threshold                = try(bgp_process.slow_peer_dynamic_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.slow_peer_dynamic_threshold, null)
        slow_peer_detection_disable                = try(bgp_process.slow_peer_detection_disable, local.defaults.iosxr.devices.configuration.routing.bgp.slow_peer_detection_disable, null)
        bgp_redistribute_internal                  = try(bgp_process.bgp_redistribute_internal, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_redistribute_internal, null)
        bgp_router_id                              = try(bgp_process.bgp_router_id, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_router_id, null)
        bgp_unsafe_ebgp_policy                     = try(bgp_process.bgp_unsafe_ebgp_policy, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_unsafe_ebgp_policy, null)
        bgp_scan_time                              = try(bgp_process.bgp_scan_time, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_scan_time, null)
        bgp_read_only                              = try(bgp_process.bgp_read_only, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_read_only, null)
        bgp_lpts_secure_binding                    = try(bgp_process.bgp_lpts_secure_binding, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_lpts_secure_binding, null)
        bgp_as_path_loopcheck                      = try(bgp_process.bgp_as_path_loopcheck, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_as_path_loopcheck, null)
        bgp_auto_policy_soft_reset_disable         = try(bgp_process.bgp_auto_policy_soft_reset_disable, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_auto_policy_soft_reset_disable, null)
        bgp_bestpath_cost_community_ignore         = try(bgp_process.bgp_bestpath_cost_community_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_cost_community_ignore, null)
        bgp_bestpath_compare_routerid              = try(bgp_process.bgp_bestpath_compare_routerid, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_compare_routerid, null)
        bgp_bestpath_aigp_ignore                   = try(bgp_process.bgp_bestpath_aigp_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_aigp_ignore, null)
        bgp_bestpath_igp_metric_ignore             = try(bgp_process.bgp_bestpath_igp_metric_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_igp_metric_ignore, null)
        bgp_bestpath_igp_metric_sr_policy          = try(bgp_process.bgp_bestpath_igp_metric_sr_policy, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_igp_metric_sr_policy, null)
        bgp_bestpath_med_missing_as_worst          = try(bgp_process.bgp_bestpath_med_missing_as_worst, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_med_missing_as_worst, null)
        bgp_bestpath_med_always                    = try(bgp_process.bgp_bestpath_med_always, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_med_always, null)
        bgp_bestpath_as_path_ignore                = try(bgp_process.bgp_bestpath_as_path_ignore, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_as_path_ignore, null)
        bgp_bestpath_as_path_multipath_relax       = try(bgp_process.bgp_bestpath_as_path_multipath_relax, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_as_path_multipath_relax, null)
        bgp_bestpath_origin_as_use_validity        = try(bgp_process.bgp_bestpath_origin_as_use_validity, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_origin_as_use_validity, null)
        bgp_bestpath_origin_as_allow_invalid       = try(bgp_process.bgp_bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_origin_as_allow_invalid, null)
        bgp_bestpath_sr_policy_prefer              = try(bgp_process.bgp_bestpath_sr_policy, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_sr_policy, null) == "prefer" ? true : null
        bgp_bestpath_sr_policy_force               = try(bgp_process.bgp_bestpath_sr_policy, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_bestpath_sr_policy, null) == "force" ? true : null
        bgp_cluster_id_32bit_format                = can(tonumber(try(bgp_process.bgp_cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_cluster_id, null))) ? try(tonumber(bgp_process.bgp_cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.bgp_cluster_id), null) : null
        bgp_cluster_id_ip_format                   = can(tonumber(try(bgp_process.bgp_cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_cluster_id, null))) ? null : try(bgp_process.bgp_cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_cluster_id, null)
        bgp_default_local_preference               = try(bgp_process.bgp_default_local_preference, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_default_local_preference, null)
        bgp_enforce_first_as_disable               = try(bgp_process.bgp_enforce_first_as_disable, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_enforce_first_as_disable, null)
        bgp_fast_external_fallover_disable         = try(bgp_process.bgp_fast_external_fallover_disable, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_fast_external_fallover_disable, null)
        bgp_log_neighbor_changes_detail            = try(bgp_process.bgp_log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_neighbor_changes, null) == "detail" ? true : null
        bgp_log_neighbor_changes_disable           = try(bgp_process.bgp_log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_neighbor_changes, null) == "disable" ? true : null
        bgp_log_message_disable                    = try(bgp_process.bgp_log_message_disable, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_message_disable, null)
        bgp_log_memory_threshold_warning           = try(bgp_process.bgp_log_memory_threshold_warning, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_memory_threshold_warning, null)
        bgp_log_memory_threshold_critical          = try(bgp_process.bgp_log_memory_threshold_critical, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_memory_threshold_critical, null)
        bgp_log_total_paths                        = try(bgp_process.bgp_log_total_paths, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_total_paths, null)
        bgp_log_total_paths_warn_threshold         = try(bgp_process.bgp_log_total_paths_warn_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_log_total_paths_warn_threshold, null)
        bgp_multipath_use_cluster_list_length      = try(bgp_process.bgp_multipath_use_cluster_list_length, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_multipath_use_cluster_list_length, null)
        bgp_multipath_as_path_ignore_onwards       = try(bgp_process.bgp_multipath_as_path_ignore_onwards, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_multipath_as_path_ignore_onwards, null)
        bgp_confederation_identifier               = try(bgp_process.bgp_confederation_identifier, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_confederation_identifier, null)
        bgp_confederation_peers = try(length(bgp_process.bgp_confederation_peers) == 0, true) ? null : [for peer in bgp_process.bgp_confederation_peers : {
          peer_as_number = try(peer.peer_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_confederation_peers.peer_as_number, null)
          }
        ]
        bgp_graceful_restart_enable                          = try(bgp_process.bgp_graceful_restart_enable, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_graceful_restart_enable, null)
        bgp_graceful_restart_purge_time                      = try(bgp_process.bgp_graceful_restart_purge_time, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_graceful_restart_purge_time, null)
        bgp_graceful_restart_restart_time                    = try(bgp_process.bgp_graceful_restart_restart_time, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_graceful_restart_restart_time, null)
        bgp_graceful_restart_stalepath_time                  = try(bgp_process.bgp_graceful_restart_stalepath_time, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_graceful_restart_stalepath_time, null)
        bgp_graceful_restart_graceful_reset                  = try(bgp_process.bgp_graceful_restart_graceful_reset, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_graceful_restart_graceful_reset, null)
        bgp_graceful_restart_retain_nbr_routes_disable       = try(bgp_process.bgp_graceful_restart_retain_nbr_routes_disable, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_graceful_restart_retain_nbr_routes_disable, null)
        bgp_install_diversion                                = try(bgp_process.bgp_install_diversion, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_install_diversion, null)
        bgp_update_delay                                     = try(bgp_process.bgp_update_delay, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_update_delay, null)
        bgp_update_delay_always                              = try(bgp_process.bgp_update_delay_always, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_update_delay_always, null)
        bgp_maximum_neighbor                                 = try(bgp_process.bgp_maximum_neighbor, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_maximum_neighbor, null)
        bgp_origin_as_validation_signal_ibgp                 = try(bgp_process.bgp_origin_as_validation_signal_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_origin_as_validation_signal_ibgp, null)
        bgp_origin_as_validation_time_off                    = try(bgp_process.bgp_origin_as_validation_time_off, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_origin_as_validation_time_off, null)
        bgp_origin_as_validation_time                        = try(bgp_process.bgp_origin_as_validation_time, local.defaults.iosxr.devices.configuration.routing.bgp.bgp_origin_as_validation_time, null)
        timers_bgp_keepalive_interval                        = try(bgp_process.timers_bgp_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.timers_bgp_keepalive_interval, null)
        timers_bgp_holddown_zero                             = try(bgp_process.timers_bgp_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.timers_bgp_holddown_zero, null)
        timers_bgp_holddown_zero_minimum_acceptable_zero     = try(bgp_process.timers_bgp_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.timers_bgp_holddown_zero_minimum_acceptable_zero, null)
        timers_bgp_holddown_zero_minimum_acceptable_holdtime = try(bgp_process.timers_bgp_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.timers_bgp_holddown_zero_minimum_acceptable_holdtime, null)
        timers_bgp_holdtime                                  = try(bgp_process.timers_bgp_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.timers_bgp_holdtime, null)
        timers_bgp_holdtime_minimum_acceptable_holdtime      = try(bgp_process.timers_bgp_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.timers_bgp_holdtime_minimum_acceptable_holdtime, null)
        nsr                                                  = try(bgp_process.nsr, local.defaults.iosxr.devices.configuration.routing.bgp.nsr, null)
        nsr_disable                                          = try(bgp_process.nsr_disable, local.defaults.iosxr.devices.configuration.routing.bgp.nsr_disable, null)
        ibgp_policy_out_enforce_modifications                = try(bgp_process.ibgp_policy_out_enforce_modifications, local.defaults.iosxr.devices.configuration.routing.bgp.ibgp_policy_out_enforce_modifications, null)
        openconfig_rib_telemetry                             = try(bgp_process.openconfig_rib_telemetry, local.defaults.iosxr.devices.configuration.routing.bgp.openconfig_rib_telemetry, null)
        update_limit                                         = try(bgp_process.update_limit, local.defaults.iosxr.devices.configuration.routing.bgp.update_limit, null)
        update_in_error_handling_basic_ebgp_disable          = try(bgp_process.update_in_error_handling_basic_ebgp_disable, local.defaults.iosxr.devices.configuration.routing.bgp.update_in_error_handling_basic_ebgp_disable, null)
        update_in_error_handling_basic_ibgp_disable          = try(bgp_process.update_in_error_handling_basic_ibgp_disable, local.defaults.iosxr.devices.configuration.routing.bgp.update_in_error_handling_basic_ibgp_disable, null)
        update_in_error_handling_extended_ebgp               = try(bgp_process.update_in_error_handling_extended_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.update_in_error_handling_extended_ebgp, null)
        update_in_error_handling_extended_ibgp               = try(bgp_process.update_in_error_handling_extended_ibgp, local.defaults.iosxr.devices.configuration.routing.bgp.update_in_error_handling_extended_ibgp, null)
        update_out_logging                                   = try(bgp_process.update_out_logging, local.defaults.iosxr.devices.configuration.routing.bgp.update_out_logging, null)
        bfd_multiplier                                       = try(bgp_process.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.bfd_multiplier, null)
        bfd_minimum_interval                                 = try(bgp_process.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.bfd_minimum_interval, null)
        rpki_routes = try(length(bgp_process.rpki_routes) == 0, true) ? null : [for route in bgp_process.rpki_routes : {
          route_address = try(route.route_address, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_routes.route_address, null)
          route_prefix  = try(route.route_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_routes.route_prefix, null)
          max_length    = try(route.max_length, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_routes.max_length, null)
          origin_as     = try(route.origin_as, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_routes.origin_as, null)
          }
        ]
        rpki_servers = try(length(bgp_process.rpki_servers) == 0, true) ? null : [for server in bgp_process.rpki_servers : {
          server                = try(server.server, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.server, null)
          refresh_time_seconds  = try(server.refresh_time_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.refresh_time_seconds, null)
          refresh_time_off      = try(server.refresh_time_off, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.refresh_time_off, null)
          response_time_seconds = try(server.response_time_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.response_time_seconds, null)
          response_time_off     = try(server.response_time_off, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.response_time_off, null)
          purge_time            = try(server.purge_time, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.purge_time, null)
          username              = try(server.username, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.username, null)
          password              = try(server.password, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.password, null)
          transport_tcp_port    = try(server.transport_tcp_port, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.transport_tcp_port, null)
          transport_ssh_port    = try(server.transport_ssh_port, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.transport_ssh_port, null)
          bind_source_interface = try(server.bind_source_interface, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.bind_source_interface, null)
          shutdown              = try(server.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.rpki_servers.shutdown, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_router_bgp" "router_bgp" {
  for_each                                                 = { for bgp in local.router_bgp : bgp.key => bgp }
  device                                                   = each.value.device_name
  as_number                                                = each.value.as_number
  default_metric                                           = each.value.default_metric
  mvpn                                                     = each.value.mvpn
  segment_routing_srv6_locator                             = each.value.segment_routing_srv6_locator
  segment_routing_srv6_usid_allocation_wide_local_id_block = each.value.segment_routing_srv6_usid_allocation_wide_local_id_block
  neighbors                                                = each.value.neighbors
  graceful_maintenance_activate_all_neighbors              = each.value.graceful_maintenance_activate_all_neighbors
  graceful_maintenance_activate_retain_routes              = each.value.graceful_maintenance_activate_retain_routes
  graceful_maintenance_activate_interfaces                 = each.value.graceful_maintenance_activate_interfaces
  graceful_maintenance_activate_locations                  = each.value.graceful_maintenance_activate_locations
  mpls_activate_interfaces                                 = each.value.mpls_activate_interfaces
  as_league_peers                                          = each.value.as_league_peers
  attribute_filter_groups                                  = each.value.attribute_filter_groups
  as_lists                                                 = each.value.as_lists
  default_information_originate                            = each.value.default_information_originate
  socket_receive_buffer_size                               = each.value.socket_receive_buffer_size
  socket_receive_buffer_size_read                          = each.value.socket_receive_buffer_size_read
  socket_send_buffer_size                                  = each.value.socket_send_buffer_size
  socket_send_buffer_size_write                            = each.value.socket_send_buffer_size_write
  nexthop_mpls_forwarding_ibgp                             = each.value.nexthop_mpls_forwarding_ibgp
  nexthop_validation_color_extcomm_sr_policy               = each.value.nexthop_validation_color_extcomm_sr_policy
  nexthop_validation_color_extcomm_disable                 = each.value.nexthop_validation_color_extcomm_disable
  nexthop_resolution_allow_default                         = each.value.nexthop_resolution_allow_default
  nexthop_srte_metric_disable                              = each.value.nexthop_srte_metric_disable
  slow_peer_dynamic                                        = each.value.slow_peer_dynamic
  slow_peer_dynamic_threshold                              = each.value.slow_peer_dynamic_threshold
  slow_peer_detection_disable                              = each.value.slow_peer_detection_disable
  bgp_redistribute_internal                                = each.value.bgp_redistribute_internal
  bgp_router_id                                            = each.value.bgp_router_id
  bgp_unsafe_ebgp_policy                                   = each.value.bgp_unsafe_ebgp_policy
  bgp_scan_time                                            = each.value.bgp_scan_time
  bgp_read_only                                            = each.value.bgp_read_only
  bgp_lpts_secure_binding                                  = each.value.bgp_lpts_secure_binding
  bgp_as_path_loopcheck                                    = each.value.bgp_as_path_loopcheck
  bgp_auto_policy_soft_reset_disable                       = each.value.bgp_auto_policy_soft_reset_disable
  bgp_bestpath_cost_community_ignore                       = each.value.bgp_bestpath_cost_community_ignore
  bgp_bestpath_compare_routerid                            = each.value.bgp_bestpath_compare_routerid
  bgp_bestpath_aigp_ignore                                 = each.value.bgp_bestpath_aigp_ignore
  bgp_bestpath_igp_metric_ignore                           = each.value.bgp_bestpath_igp_metric_ignore
  bgp_bestpath_igp_metric_sr_policy                        = each.value.bgp_bestpath_igp_metric_sr_policy
  bgp_bestpath_med_missing_as_worst                        = each.value.bgp_bestpath_med_missing_as_worst
  bgp_bestpath_med_always                                  = each.value.bgp_bestpath_med_always
  bgp_bestpath_as_path_ignore                              = each.value.bgp_bestpath_as_path_ignore
  bgp_bestpath_as_path_multipath_relax                     = each.value.bgp_bestpath_as_path_multipath_relax
  bgp_bestpath_origin_as_use_validity                      = each.value.bgp_bestpath_origin_as_use_validity
  bgp_bestpath_origin_as_allow_invalid                     = each.value.bgp_bestpath_origin_as_allow_invalid
  bgp_bestpath_sr_policy_prefer                            = each.value.bgp_bestpath_sr_policy_prefer
  bgp_bestpath_sr_policy_force                             = each.value.bgp_bestpath_sr_policy_force
  bgp_cluster_id_32bit_format                              = each.value.bgp_cluster_id_32bit_format
  bgp_cluster_id_ip_format                                 = each.value.bgp_cluster_id_ip_format
  bgp_default_local_preference                             = each.value.bgp_default_local_preference
  bgp_enforce_first_as_disable                             = each.value.bgp_enforce_first_as_disable
  bgp_fast_external_fallover_disable                       = each.value.bgp_fast_external_fallover_disable
  bgp_log_neighbor_changes_detail                          = each.value.bgp_log_neighbor_changes_detail
  bgp_log_neighbor_changes_disable                         = each.value.bgp_log_neighbor_changes_disable
  bgp_log_message_disable                                  = each.value.bgp_log_message_disable
  bgp_log_memory_threshold_warning                         = each.value.bgp_log_memory_threshold_warning
  bgp_log_memory_threshold_critical                        = each.value.bgp_log_memory_threshold_critical
  bgp_log_total_paths                                      = each.value.bgp_log_total_paths
  bgp_log_total_paths_warn_threshold                       = each.value.bgp_log_total_paths_warn_threshold
  bgp_multipath_use_cluster_list_length                    = each.value.bgp_multipath_use_cluster_list_length
  bgp_multipath_as_path_ignore_onwards                     = each.value.bgp_multipath_as_path_ignore_onwards
  bgp_confederation_identifier                             = each.value.bgp_confederation_identifier
  bgp_confederation_peers                                  = each.value.bgp_confederation_peers
  bgp_graceful_restart_enable                              = each.value.bgp_graceful_restart_enable
  bgp_graceful_restart_purge_time                          = each.value.bgp_graceful_restart_purge_time
  bgp_graceful_restart_restart_time                        = each.value.bgp_graceful_restart_restart_time
  bgp_graceful_restart_stalepath_time                      = each.value.bgp_graceful_restart_stalepath_time
  bgp_graceful_restart_graceful_reset                      = each.value.bgp_graceful_restart_graceful_reset
  bgp_graceful_restart_retain_nbr_routes_disable           = each.value.bgp_graceful_restart_retain_nbr_routes_disable
  bgp_install_diversion                                    = each.value.bgp_install_diversion
  bgp_update_delay                                         = each.value.bgp_update_delay
  bgp_update_delay_always                                  = each.value.bgp_update_delay_always
  bgp_maximum_neighbor                                     = each.value.bgp_maximum_neighbor
  bgp_origin_as_validation_signal_ibgp                     = each.value.bgp_origin_as_validation_signal_ibgp
  bgp_origin_as_validation_time_off                        = each.value.bgp_origin_as_validation_time_off
  bgp_origin_as_validation_time                            = each.value.bgp_origin_as_validation_time
  timers_bgp_keepalive_interval                            = each.value.timers_bgp_keepalive_interval
  timers_bgp_holddown_zero                                 = each.value.timers_bgp_holddown_zero
  timers_bgp_holddown_zero_minimum_acceptable_zero         = each.value.timers_bgp_holddown_zero_minimum_acceptable_zero
  timers_bgp_holddown_zero_minimum_acceptable_holdtime     = each.value.timers_bgp_holddown_zero_minimum_acceptable_holdtime
  timers_bgp_holdtime                                      = each.value.timers_bgp_holdtime
  timers_bgp_holdtime_minimum_acceptable_holdtime          = each.value.timers_bgp_holdtime_minimum_acceptable_holdtime
  nsr                                                      = each.value.nsr
  nsr_disable                                              = each.value.nsr_disable
  ibgp_policy_out_enforce_modifications                    = each.value.ibgp_policy_out_enforce_modifications
  openconfig_rib_telemetry                                 = each.value.openconfig_rib_telemetry
  update_limit                                             = each.value.update_limit
  update_in_error_handling_basic_ebgp_disable              = each.value.update_in_error_handling_basic_ebgp_disable
  update_in_error_handling_basic_ibgp_disable              = each.value.update_in_error_handling_basic_ibgp_disable
  update_in_error_handling_extended_ebgp                   = each.value.update_in_error_handling_extended_ebgp
  update_in_error_handling_extended_ibgp                   = each.value.update_in_error_handling_extended_ibgp
  update_out_logging                                       = each.value.update_out_logging
  bfd_multiplier                                           = each.value.bfd_multiplier
  bfd_minimum_interval                                     = each.value.bfd_minimum_interval
  rpki_routes                                              = each.value.rpki_routes
  rpki_servers                                             = each.value.rpki_servers

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_bmp_server.bmp_server
  ]
}
