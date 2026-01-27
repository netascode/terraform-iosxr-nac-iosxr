locals {
  router_bgp_neighbor_group = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for neighbor_group in try(bgp_process.neighbor_groups, []) : {
          key                                        = format("%s/%s/%s", device.name, bgp_process.as_number, neighbor_group.group_name)
          device_name                                = device.name
          as_number                                  = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          name                                       = try(neighbor_group.group_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.group_name, null)
          remote_as                                  = try(neighbor_group.remote_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.remote_as, null)
          remote_as_list                             = try(neighbor_group.remote_as_list, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.remote_as_list, null)
          maximum_peers                              = try(neighbor_group.maximum_peers, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.maximum_peers, null)
          as_path_loopcheck_out                      = try(neighbor_group.as_path_loopcheck_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.as_path_loopcheck_out, null)
          use_neighbor_group                         = try(neighbor_group.use_neighbor_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.use_neighbor_group, null)
          use_session_group                          = try(neighbor_group.use_session_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.use_session_group, null)
          advertisement_interval_seconds             = try(neighbor_group.advertisement_interval_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.advertisement_interval_seconds, null)
          advertisement_interval_milliseconds        = try(neighbor_group.advertisement_interval_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.advertisement_interval_milliseconds, null)
          description                                = try(neighbor_group.description, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.description, null)
          ignore_connected_check                     = try(neighbor_group.ignore_connected_check, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ignore_connected_check, null)
          ignore_connected_check_inheritance_disable = try(neighbor_group.ignore_connected_check_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ignore_connected_check_inheritance_disable, null)
          ebgp_multihop_maximum_hop_count            = try(neighbor_group.ebgp_multihop_maximum_hop_count, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_multihop_maximum_hop_count, null)
          ebgp_multihop_mpls                         = try(neighbor_group.ebgp_multihop_mpls, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_multihop_mpls, null)
          tcp_mss_value                              = try(neighbor_group.tcp_mss_value, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.tcp_mss_value, null)
          tcp_mss_inheritance_disable                = try(neighbor_group.tcp_mss_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.tcp_mss_inheritance_disable, null)
          tcp_mtu_discovery                          = try(neighbor_group.tcp_mtu_discovery, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.tcp_mtu_discovery, null)
          tcp_mtu_discovery_inheritance_disable      = try(neighbor_group.tcp_mtu_discovery_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.tcp_mtu_discovery_inheritance_disable, null)
          tcp_ip_only_preferred                      = try(neighbor_group.tcp_ip_only_preferred, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.tcp_ip_only_preferred, null)
          tcp_ip_only_preferred_inheritance_disable  = try(neighbor_group.tcp_ip_only_preferred_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.tcp_ip_only_preferred_inheritance_disable, null)
          fast_fallover                              = try(neighbor_group.fast_fallover, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.fast_fallover, null)
          fast_fallover_inheritance_disable          = try(neighbor_group.fast_fallover_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.fast_fallover_inheritance_disable, null)
          internal_vpn_client                        = try(neighbor_group.internal_vpn_client, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.internal_vpn_client, null)
          bmp_activate_servers = try(length(neighbor_group.bmp_activate_servers) == 0, true) ? null : [for server in neighbor_group.bmp_activate_servers : {
            server_number = try(server.server_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bmp_activate_servers.server_number, null)
            }
          ]
          bfd_minimum_interval                                              = try(neighbor_group.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_minimum_interval, null)
          bfd_multiplier                                                    = try(neighbor_group.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_multiplier, null)
          bfd_fast_detect                                                   = try(neighbor_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect, null) == "enable" ? true : null
          bfd_fast_detect_strict_mode                                       = try(neighbor_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect, null) == "strict-mode" ? true : null
          bfd_fast_detect_disable                                           = try(neighbor_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect, null) == "disable" ? true : null
          bfd_fast_detect_strict_mode_negotiate                             = try(neighbor_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect, null) == "strict-mode-negotiate" ? true : null
          bfd_fast_detect_strict_mode_negotiate_override                    = try(neighbor_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect, null) == "strict-mode-negotiate-override" ? true : null
          keychain_name                                                     = try(neighbor_group.keychain_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.keychain_name, null)
          keychain_inheritance_disable                                      = try(neighbor_group.keychain_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.keychain_inheritance_disable, null)
          local_as_inheritance_disable                                      = try(neighbor_group.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_inheritance_disable, null)
          local_as                                                          = try(neighbor_group.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as, null)
          local_as_no_prepend                                               = try(neighbor_group.local_as_no_prepend, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_no_prepend, null)
          local_as_no_prepend_replace_as                                    = try(neighbor_group.local_as_no_prepend_replace_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_no_prepend_replace_as, null)
          local_as_no_prepend_replace_as_dual_as                            = try(neighbor_group.local_as_no_prepend_replace_as_dual_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_no_prepend_replace_as_dual_as, null)
          password                                                          = try(neighbor_group.password, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.password, null)
          password_inheritance_disable                                      = try(neighbor_group.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.password_inheritance_disable, null)
          receive_buffer_size                                               = try(neighbor_group.receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.receive_buffer_size, null)
          receive_buffer_size_read                                          = try(neighbor_group.receive_buffer_size_read, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.receive_buffer_size_read, null)
          send_buffer_size                                                  = try(neighbor_group.send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.send_buffer_size, null)
          send_buffer_size_write                                            = try(neighbor_group.send_buffer_size_write, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.send_buffer_size_write, null)
          dampening                                                         = try(neighbor_group.dampening, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.dampening, null)
          as_override                                                       = try(neighbor_group.as_override, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.as_override, null)
          shutdown                                                          = try(neighbor_group.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.shutdown, null)
          timers_keepalive_interval                                         = try(neighbor_group.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_keepalive_interval, null)
          timers_holddown_zero                                              = try(neighbor_group.timers_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holddown_zero, null)
          timers_holddown_zero_minimum_acceptable_zero                      = try(neighbor_group.timers_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holddown_zero_minimum_acceptable_zero, null)
          timers_holddown_zero_minimum_acceptable_holdtime                  = try(neighbor_group.timers_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holddown_zero_minimum_acceptable_holdtime, null)
          timers_holdtime                                                   = try(neighbor_group.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holdtime, null)
          timers_holdtime_minimum_acceptable_holdtime                       = try(neighbor_group.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holdtime_minimum_acceptable_holdtime, null)
          local_address                                                     = try(neighbor_group.local_address, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_address, null)
          local_address_inheritance_disable                                 = try(neighbor_group.local_address_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_address_inheritance_disable, null)
          log_neighbor_changes_detail                                       = try(neighbor_group.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_neighbor_changes, null) == "detail" ? true : null
          log_neighbor_changes_disable                                      = try(neighbor_group.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_neighbor_changes, null) == "disable" ? true : null
          log_neighbor_changes_inheritance_disable                          = try(neighbor_group.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_neighbor_changes, null) == "inheritance-disable" ? true : null
          log_message_in_size                                               = try(neighbor_group.log_message_in_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_message_in_size, null)
          log_message_in_disable                                            = try(neighbor_group.log_message_in_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_message_in_disable, null)
          log_message_in_inheritance_disable                                = try(neighbor_group.log_message_in_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_message_in_inheritance_disable, null)
          log_message_out_size                                              = try(neighbor_group.log_message_out_size, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_message_out_size, null)
          log_message_out_disable                                           = try(neighbor_group.log_message_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_message_out_disable, null)
          log_message_out_inheritance_disable                               = try(neighbor_group.log_message_out_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.log_message_out_inheritance_disable, null)
          update_source                                                     = try(neighbor_group.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_source, null)
          local_address_subnet_prefix                                       = try(neighbor_group.local_address_subnet_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_address_subnet_prefix, null)
          local_address_subnet_mask                                         = try(neighbor_group.local_address_subnet_mask, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_address_subnet_mask, null)
          dmz_link_bandwidth                                                = try(neighbor_group.dmz_link_bandwidth, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.dmz_link_bandwidth, null)
          dmz_link_bandwidth_inheritance_disable                            = try(neighbor_group.dmz_link_bandwidth_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.dmz_link_bandwidth_inheritance_disable, null)
          ebgp_recv_extcommunity_dmz                                        = try(neighbor_group.ebgp_recv_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_recv_extcommunity_dmz, null)
          ebgp_recv_extcommunity_dmz_inheritance_disable                    = try(neighbor_group.ebgp_recv_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_recv_extcommunity_dmz_inheritance_disable, null)
          ebgp_send_extcommunity_dmz                                        = try(neighbor_group.ebgp_send_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_send_extcommunity_dmz, null)
          ebgp_send_extcommunity_dmz_cumulative                             = try(neighbor_group.ebgp_send_extcommunity_dmz_cumulative, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_send_extcommunity_dmz_cumulative, null)
          ebgp_send_extcommunity_dmz_inheritance_disable                    = try(neighbor_group.ebgp_send_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ebgp_send_extcommunity_dmz_inheritance_disable, null)
          ttl_security                                                      = try(neighbor_group.ttl_security, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ttl_security, null)
          ttl_security_inheritance_disable                                  = try(neighbor_group.ttl_security_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ttl_security_inheritance_disable, null)
          session_open_mode                                                 = try(neighbor_group.session_open_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.session_open_mode, null)
          dscp                                                              = try(neighbor_group.dscp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.dscp, null)
          precedence                                                        = try(neighbor_group.precedence, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.precedence, null)
          capability_additional_paths_send                                  = try(neighbor_group.capability_additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_additional_paths_send, null)
          capability_additional_paths_send_disable                          = try(neighbor_group.capability_additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_additional_paths_send_disable, null)
          capability_additional_paths_receive                               = try(neighbor_group.capability_additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_additional_paths_receive, null)
          capability_additional_paths_receive_disable                       = try(neighbor_group.capability_additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_additional_paths_receive_disable, null)
          capability_suppress_all                                           = try(neighbor_group.capability_suppress_all, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_suppress_all, null)
          capability_suppress_all_inheritance_disable                       = try(neighbor_group.capability_suppress_all_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_suppress_all_inheritance_disable, null)
          capability_suppress_extended_nexthop_encoding                     = try(neighbor_group.capability_suppress_extended_nexthop_encoding, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_suppress_extended_nexthop_encoding, null)
          capability_suppress_extended_nexthop_encoding_inheritance_disable = try(neighbor_group.capability_suppress_extended_nexthop_encoding_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_suppress_extended_nexthop_encoding_inheritance_disable, null)
          capability_suppress_four_byte_as                                  = try(neighbor_group.capability_suppress_four_byte_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_suppress_four_byte_as, null)
          capability_suppress_four_byte_as_inheritance_disable              = try(neighbor_group.capability_suppress_four_byte_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.capability_suppress_four_byte_as_inheritance_disable, null)
          graceful_restart                                                  = try(neighbor_group.graceful_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_restart, null)
          graceful_restart_disable                                          = try(neighbor_group.graceful_restart_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_restart_disable, null)
          graceful_restart_helper_only                                      = try(neighbor_group.graceful_restart_helper_only, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_restart_helper_only, null)
          graceful_restart_helper_only_inheritance_disable                  = try(neighbor_group.graceful_restart_helper_only_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_restart_helper_only_inheritance_disable, null)
          graceful_restart_restart_time                                     = try(neighbor_group.graceful_restart_restart_time, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_restart_restart_time, null)
          graceful_restart_stalepath_time                                   = try(neighbor_group.graceful_restart_stalepath_time, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_restart_stalepath_time, null)
          enforce_first_as                                                  = try(neighbor_group.enforce_first_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.enforce_first_as, null)
          cluster_id_32bit_format                                           = can(tonumber(try(neighbor_group.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.cluster_id, null))) ? try(tonumber(neighbor_group.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.cluster_id), null) : null
          cluster_id_ip_format                                              = can(tonumber(try(neighbor_group.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.cluster_id, null))) ? null : try(neighbor_group.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.cluster_id, null)
          idle_watch_time                                                   = try(neighbor_group.idle_watch_time, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.idle_watch_time, null)
          allowas_in                                                        = try(neighbor_group.allowas_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.allowas_in, null)
          egress_engineering                                                = try(neighbor_group.egress_engineering, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.egress_engineering, null)
          egress_engineering_inheritance_disable                            = try(neighbor_group.egress_engineering_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.egress_engineering_inheritance_disable, null)
          peer_sets = try(length(neighbor_group.peer_sets) == 0, true) ? null : [for peer_set in neighbor_group.peer_sets : {
            peer = try(peer_set.peer, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.peer_sets.peer, null)
            }
          ]
          ao_key_chain_name                                              = try(neighbor_group.ao_key_chain_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_key_chain_name, null)
          ao_key_chain_include_tcp_options                               = try(neighbor_group.ao_key_chain_include_tcp_options, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_key_chain_include_tcp_options, null)
          ao_key_chain_accept_mismatch                                   = try(neighbor_group.ao_key_chain_accept_mismatch, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_key_chain_accept_mismatch, null)
          ao_inheritance_disable                                         = try(neighbor_group.ao_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_inheritance_disable, null)
          default_policy_action_in                                       = try(neighbor_group.default_policy_action_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.default_policy_action_in, null)
          default_policy_action_out                                      = try(neighbor_group.default_policy_action_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.default_policy_action_out, null)
          update_in_filtering_message_buffers                            = try(neighbor_group.update_in_filtering_message_buffers, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_filtering_message_buffers, null)
          update_in_filtering_message_buffers_type                       = try(neighbor_group.update_in_filtering_message_buffers_type, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_filtering_message_buffers_type, null)
          update_in_filtering_logging_disable                            = try(neighbor_group.update_in_filtering_logging_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_filtering_logging_disable, null)
          update_in_filtering_attribute_filter_group                     = try(neighbor_group.update_in_filtering_attribute_filter_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_filtering_attribute_filter_group, null)
          update_in_labeled_unicast_equivalent                           = try(neighbor_group.update_in_labeled_unicast_equivalent, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_labeled_unicast_equivalent, null)
          update_in_labeled_unicast_equivalent_inheritance_disable       = try(neighbor_group.update_in_labeled_unicast_equivalent_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_labeled_unicast_equivalent_inheritance_disable, null)
          update_in_error_handling_avoid_reset                           = try(neighbor_group.update_in_error_handling_avoid_reset, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_error_handling_avoid_reset, null)
          update_in_error_handling_treat_as_withdraw                     = try(neighbor_group.update_in_error_handling_treat_as_withdraw, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_in_error_handling_treat_as_withdraw, null)
          graceful_maintenance_activate                                  = try(neighbor_group.graceful_maintenance_activate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_activate, null)
          graceful_maintenance_activate_inheritance_disable              = try(neighbor_group.graceful_maintenance_activate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_activate_inheritance_disable, null)
          graceful_maintenance_local_preference                          = try(neighbor_group.graceful_maintenance_local_preference, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_local_preference, null)
          graceful_maintenance_local_preference_inheritance_disable      = try(neighbor_group.graceful_maintenance_local_preference_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_local_preference_inheritance_disable, null)
          graceful_maintenance_as_prepends_number                        = try(neighbor_group.graceful_maintenance_as_prepends_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_as_prepends_number, null)
          graceful_maintenance_as_prepends_inheritance_disable           = try(neighbor_group.graceful_maintenance_as_prepends_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_as_prepends_inheritance_disable, null)
          graceful_maintenance_bandwidth_aware_percentage_threshold      = try(neighbor_group.graceful_maintenance_bandwidth_aware_percentage_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_bandwidth_aware_percentage_threshold, null)
          graceful_maintenance_bandwidth_aware_percentage_threshold_high = try(neighbor_group.graceful_maintenance_bandwidth_aware_percentage_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_bandwidth_aware_percentage_threshold_high, null)
          graceful_maintenance_bandwidth_aware_bandwidth_threshold       = try(neighbor_group.graceful_maintenance_bandwidth_aware_bandwidth_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_bandwidth_aware_bandwidth_threshold, null)
          graceful_maintenance_bandwidth_aware_bandwidth_threshold_high  = try(neighbor_group.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high, null)
          graceful_maintenance_bandwidth_aware_inheritance_disable       = try(neighbor_group.graceful_maintenance_bandwidth_aware_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.graceful_maintenance_bandwidth_aware_inheritance_disable, null)
          address_family = try(length(neighbor_group.address_family) == 0, true) ? null : [for af in neighbor_group.address_family : {
            af_name                                                 = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.af_name, null)
            encapsulation_type                                      = try(af.encapsulation_type, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.encapsulation_type, null)
            weight                                                  = try(af.weight, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.weight, null)
            multipath                                               = try(af.multipath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.multipath, null)
            use_af_group                                            = try(af.use_af_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.use_af_group, null)
            capability_orf_prefix                                   = try(af.capability_orf_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.capability_orf_prefix, null)
            additional_paths_send                                   = try(af.additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.additional_paths_send, null)
            additional_paths_send_disable                           = try(af.additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.additional_paths_send_disable, null)
            additional_paths_receive                                = try(af.additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.additional_paths_receive, null)
            additional_paths_receive_disable                        = try(af.additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.additional_paths_receive_disable, null)
            default_originate                                       = try(af.default_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.default_originate, null)
            default_originate_route_policy                          = try(af.default_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.default_originate_route_policy, null)
            default_originate_inheritance_disable                   = try(af.default_originate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.default_originate_inheritance_disable, null)
            maximum_prefix_limit                                    = try(af.maximum_prefix_limit, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.maximum_prefix_limit, null)
            maximum_prefix_threshold                                = try(af.maximum_prefix_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.maximum_prefix_threshold, can(af.maximum_prefix_limit) ? 75 : null)
            maximum_prefix_restart                                  = try(af.maximum_prefix_restart, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.maximum_prefix_restart, null)
            maximum_prefix_discard_extra_paths                      = try(af.maximum_prefix_discard_extra_paths, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.maximum_prefix_discard_extra_paths, null)
            maximum_prefix_warning_only                             = try(af.maximum_prefix_warning_only, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.maximum_prefix_warning_only, null)
            next_hop_self                                           = try(af.next_hop_self, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.next_hop_self, null)
            next_hop_self_inheritance_disable                       = try(af.next_hop_self_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.next_hop_self_inheritance_disable, null)
            next_hop_unchanged                                      = try(af.next_hop_unchanged, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.next_hop_unchanged, null)
            next_hop_unchanged_multipath                            = try(af.next_hop_unchanged_multipath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.next_hop_unchanged_multipath, null)
            next_hop_unchanged_inheritance_disable                  = try(af.next_hop_unchanged_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.next_hop_unchanged_inheritance_disable, null)
            route_policy_in                                         = try(af.route_policy_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.route_policy_in, null)
            route_policy_out                                        = try(af.route_policy_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.route_policy_out, null)
            orf_route_policy                                        = try(af.orf_route_policy, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.orf_route_policy, null)
            cluster_id_allow_equal                                  = try(af.cluster_id_allow_equal, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.cluster_id_allow_equal, null)
            cluster_id_allow_equal_disable                          = try(af.cluster_id_allow_equal_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.cluster_id_allow_equal_disable, null)
            replace_private_as                                      = try(af.replace_private_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.replace_private_as, null)
            replace_private_as_internal                             = try(af.replace_private_as_internal, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.replace_private_as_internal, null)
            remove_private_as_inbound                               = try(af.remove_private_as_inbound, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.remove_private_as_inbound, null)
            remove_private_as_inbound_entire_aspath                 = try(af.remove_private_as_inbound_entire_aspath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.remove_private_as_inbound_entire_aspath, null)
            remove_private_as_inbound_inheritance_disable           = try(af.remove_private_as_inbound_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.remove_private_as_inbound_inheritance_disable, null)
            remove_private_as                                       = try(af.remove_private_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.remove_private_as, null)
            remove_private_as_entire_aspath                         = try(af.remove_private_as_entire_aspath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.remove_private_as_entire_aspath, null)
            remove_private_as_internal                              = try(af.remove_private_as_internal, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.remove_private_as_internal, null)
            route_reflector_client                                  = try(af.route_reflector_client, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.route_reflector_client, null)
            route_reflector_client_inheritance_disable              = try(af.route_reflector_client_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.route_reflector_client_inheritance_disable, null)
            send_community_ebgp                                     = try(af.send_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_community_ebgp, null)
            send_community_ebgp_inheritance_disable                 = try(af.send_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_community_ebgp_inheritance_disable, null)
            send_community_gshut_ebgp                               = try(af.send_community_gshut_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_community_gshut_ebgp, null)
            send_community_gshut_ebgp_inheritance_disable           = try(af.send_community_gshut_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_community_gshut_ebgp_inheritance_disable, null)
            send_extended_community_ebgp                            = try(af.send_extended_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_extended_community_ebgp, null)
            send_extended_community_ebgp_inheritance_disable        = try(af.send_extended_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_extended_community_ebgp_inheritance_disable, null)
            soft_reconfiguration_inbound                            = try(af.soft_reconfiguration_inbound, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.soft_reconfiguration_inbound, null)
            soft_reconfiguration_inbound_always                     = try(af.soft_reconfiguration_inbound_always, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.soft_reconfiguration_inbound_always, null)
            update_out_originator_loopcheck                         = try(af.update_out_originator_loopcheck, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.update_out_originator_loopcheck, null)
            update_out_originator_loopcheck_disable                 = try(af.update_out_originator_loopcheck_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.update_out_originator_loopcheck_disable, null)
            advertise_vpnv4_unicast                                 = try(af.advertise_vpnv4_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_vpnv4_unicast, null)
            advertise_vpnv4_unicast_re_originated                   = try(af.advertise_vpnv4_unicast_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_vpnv4_unicast_re_originated, null)
            advertise_vpnv4_unicast_re_originated_stitching_rt      = try(af.advertise_vpnv4_unicast_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_vpnv4_unicast_re_originated_stitching_rt, null)
            advertise_vpnv6_unicast                                 = try(af.advertise_vpnv6_unicast, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_vpnv6_unicast, null)
            advertise_vpnv6_unicast_re_originated                   = try(af.advertise_vpnv6_unicast_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_vpnv6_unicast_re_originated, null)
            advertise_vpnv6_unicast_re_originated_stitching_rt      = try(af.advertise_vpnv6_unicast_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_vpnv6_unicast_re_originated_stitching_rt, null)
            advertise_l2vpn_evpn_re_originated                      = try(af.advertise_l2vpn_evpn_re_originated, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_l2vpn_evpn_re_originated, null)
            advertise_l2vpn_evpn_re_originated_stitching_rt         = try(af.advertise_l2vpn_evpn_re_originated_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.advertise_l2vpn_evpn_re_originated_stitching_rt, null)
            segment_routing_srv6_prefix_sid_type4                   = try(af.segment_routing_srv6_prefix_sid_type4, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.segment_routing_srv6_prefix_sid_type4, null)
            import_stitching_rt                                     = try(af.import_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.import_stitching_rt, null)
            import_stitching_rt_re_originate                        = try(af.import_stitching_rt_re_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.import_stitching_rt_re_originate, null)
            import_stitching_rt_re_originate_stitching_rt           = try(af.import_stitching_rt_re_originate_stitching_rt, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.import_stitching_rt_re_originate_stitching_rt, null)
            import_re_originate                                     = try(af.import_re_originate, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.import_re_originate, null)
            allowas_in                                              = try(af.allowas_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.allowas_in, null)
            site_of_origin_two_byte_as_number                       = try(af.site_of_origin_two_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.site_of_origin_two_byte_as_number, null)
            site_of_origin_two_byte_as_index                        = try(af.site_of_origin_two_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.site_of_origin_two_byte_as_index, null)
            site_of_origin_four_byte_as_number                      = try(af.site_of_origin_four_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.site_of_origin_four_byte_as_number, null)
            site_of_origin_four_byte_as_index                       = try(af.site_of_origin_four_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.site_of_origin_four_byte_as_index, null)
            site_of_origin_ipv4_address                             = try(af.site_of_origin_ipv4_address, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.site_of_origin_ipv4_address, null)
            site_of_origin_ipv4_address_index                       = try(af.site_of_origin_ipv4_address_index, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.site_of_origin_ipv4_address_index, null)
            as_override                                             = try(af.as_override, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.as_override, null)
            as_override_inheritance_disable                         = try(af.as_override_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.as_override_inheritance_disable, null)
            aigp                                                    = try(af.aigp, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp, null)
            aigp_disable                                            = try(af.aigp_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_disable, null)
            aigp_send_med                                           = try(af.aigp_send_med, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_med, null)
            aigp_send_med_disable                                   = try(af.aigp_send_med_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_med_disable, null)
            aigp_send_cost_community_disable                        = try(af.aigp_send_cost_community_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_cost_community_disable, null)
            aigp_send_cost_community_id                             = try(af.aigp_send_cost_community_id, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_cost_community_id, null)
            aigp_send_cost_community_id_poi_igp_cost                = try(af.aigp_send_cost_community_id_poi_igp_cost, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_cost_community_id_poi_igp_cost, null)
            aigp_send_cost_community_id_poi_igp_cost_transitive     = try(af.aigp_send_cost_community_id_poi_igp_cost_transitive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_cost_community_id_poi_igp_cost_transitive, null)
            aigp_send_cost_community_id_poi_pre_bestpath            = try(af.aigp_send_cost_community_id_poi_pre_bestpath, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_cost_community_id_poi_pre_bestpath, null)
            aigp_send_cost_community_id_poi_pre_bestpath_transitive = try(af.aigp_send_cost_community_id_poi_pre_bestpath_transitive, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.aigp_send_cost_community_id_poi_pre_bestpath_transitive, null)
            send_multicast_attributes                               = try(af.send_multicast_attributes, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_multicast_attributes, null)
            send_multicast_attributes_disable                       = try(af.send_multicast_attributes_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.send_multicast_attributes_disable, null)
            accept_own                                              = try(af.accept_own, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.accept_own, null)
            accept_own_inheritance_disable                          = try(af.accept_own_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.accept_own_inheritance_disable, null)
            slow_peer_dynamic                                       = try(af.slow_peer_dynamic, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.slow_peer_dynamic, null)
            slow_peer_dynamic_threshold                             = try(af.slow_peer_dynamic_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.slow_peer_dynamic_threshold, null)
            slow_peer_dynamic_disable                               = try(af.slow_peer_dynamic_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.slow_peer_dynamic_disable, null)
            slow_peer_static                                        = try(af.slow_peer_static, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.slow_peer_static, null)
            origin_as_validation_disable                            = try(af.origin_as_validation_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.origin_as_validation_disable, null)
            bestpath_origin_as_allow_invalid                        = try(af.bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_family.bestpath_origin_as_allow_invalid, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_bgp_neighbor_group" "router_bgp_neighbor_group" {
  for_each                                                          = { for group in local.router_bgp_neighbor_group : group.key => group }
  device                                                            = each.value.device_name
  as_number                                                         = each.value.as_number
  name                                                              = each.value.name
  remote_as                                                         = each.value.remote_as
  remote_as_list                                                    = each.value.remote_as_list
  maximum_peers                                                     = each.value.maximum_peers
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
  fast_fallover                                                     = each.value.fast_fallover
  fast_fallover_inheritance_disable                                 = each.value.fast_fallover_inheritance_disable
  internal_vpn_client                                               = each.value.internal_vpn_client
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
  dampening                                                         = each.value.dampening
  as_override                                                       = each.value.as_override
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
  ao_key_chain_name                                                 = each.value.ao_key_chain_name
  ao_key_chain_include_tcp_options                                  = each.value.ao_key_chain_include_tcp_options
  ao_key_chain_accept_mismatch                                      = each.value.ao_key_chain_accept_mismatch
  ao_inheritance_disable                                            = each.value.ao_inheritance_disable
  default_policy_action_in                                          = each.value.default_policy_action_in
  default_policy_action_out                                         = each.value.default_policy_action_out
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
  address_family                                                    = each.value.address_family

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_bmp_server.bmp_server,
    # iosxr_router_bgp.router_bgp,  # TODO: Circular dependency but needs attibutes from
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_session_group.router_bgp_session_group
  ]
}
