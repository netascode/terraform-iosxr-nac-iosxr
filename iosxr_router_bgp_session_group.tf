locals {
  router_bgp_session_group = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for session_group in try(bgp_process.session_groups, []) : {
          key                                              = format("%s/%s/%s", device.name, bgp_process.as_number, session_group.group_name)
          device_name                                      = device.name
          as_number                                        = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          name                                             = try(session_group.group_name, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.group_name, null)
          remote_as                                        = try(session_group.remote_as, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.remote_as, null)
          remote_as_list                                   = try(session_group.remote_as_list, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.remote_as_list, null)
          maximum_peers                                    = try(session_group.maximum_peers, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.maximum_peers, null)
          send_community_ebgp                              = try(session_group.send_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.send_community_ebgp, null)
          send_community_ebgp_inheritance_disable          = try(session_group.send_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.send_community_ebgp_inheritance_disable, null)
          send_extended_community_ebgp                     = try(session_group.send_extended_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.send_extended_community_ebgp, null)
          send_extended_community_ebgp_inheritance_disable = try(session_group.send_extended_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.send_extended_community_ebgp_inheritance_disable, null)
          as_path_loopcheck_out                            = try(session_group.as_path_loopcheck_out, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.as_path_loopcheck_out, null)
          dampening                                        = try(session_group.dampening, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.dampening, null)
          as_override                                      = try(session_group.as_override, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.as_override, null)
          use_session_group                                = try(session_group.use_session_group, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.use_session_group, null)
          advertisement_interval_seconds                   = try(session_group.advertisement_interval_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.advertisement_interval_seconds, null)
          advertisement_interval_milliseconds              = try(session_group.advertisement_interval_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.advertisement_interval_milliseconds, null)
          description                                      = try(session_group.description, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.description, null)
          ignore_connected_check                           = try(session_group.ignore_connected_check, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ignore_connected_check, null)
          ignore_connected_check_inheritance_disable       = try(session_group.ignore_connected_check_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ignore_connected_check_inheritance_disable, null)
          internal_vpn_client                              = try(session_group.internal_vpn_client, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.internal_vpn_client, null)
          ebgp_multihop_maximum_hop_count                  = try(session_group.ebgp_multihop_maximum_hop_count, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_multihop_maximum_hop_count, null)
          ebgp_multihop_mpls                               = try(session_group.ebgp_multihop_mpls, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_multihop_mpls, null)
          tcp_mss_value                                    = try(session_group.tcp_mss_value, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.tcp_mss_value, null)
          tcp_mss_inheritance_disable                      = try(session_group.tcp_mss_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.tcp_mss_inheritance_disable, null)
          tcp_mtu_discovery                                = try(session_group.tcp_mtu_discovery, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.tcp_mtu_discovery, null)
          tcp_mtu_discovery_inheritance_disable            = try(session_group.tcp_mtu_discovery_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.tcp_mtu_discovery_inheritance_disable, null)
          tcp_ip_only_preferred                            = try(session_group.tcp_ip_only_preferred, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.tcp_ip_only_preferred, null)
          tcp_ip_only_preferred_inheritance_disable        = try(session_group.tcp_ip_only_preferred_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.tcp_ip_only_preferred_inheritance_disable, null)
          bmp_activate_servers = try(length(session_group.bmp_activate_servers) == 0, true) ? null : [for server in session_group.bmp_activate_servers : {
            server_number = try(server.server_number, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bmp_activate_servers.server_number, null)
            }
          ]
          bfd_minimum_interval                                              = try(session_group.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_minimum_interval, null)
          bfd_multiplier                                                    = try(session_group.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_multiplier, null)
          bfd_fast_detect                                                   = try(session_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_fast_detect, null) == "enable" ? true : null
          bfd_fast_detect_strict_mode                                       = try(session_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_fast_detect, null) == "strict-mode" ? true : null
          bfd_fast_detect_disable                                           = try(session_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_fast_detect, null) == "disable" ? true : null
          bfd_fast_detect_strict_mode_negotiate                             = try(session_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_fast_detect, null) == "strict-mode-negotiate" ? true : null
          bfd_fast_detect_strict_mode_negotiate_override                    = try(session_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.bfd_fast_detect, null) == "strict-mode-negotiate-override" ? true : null
          keychain_name                                                     = try(session_group.keychain_name, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.keychain_name, null)
          keychain_inheritance_disable                                      = try(session_group.keychain_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.keychain_inheritance_disable, null)
          local_as_inheritance_disable                                      = try(session_group.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_as_inheritance_disable, null)
          local_as                                                          = try(session_group.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_as, null)
          local_as_no_prepend                                               = try(session_group.local_as_no_prepend, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_as_no_prepend, null)
          local_as_no_prepend_replace_as                                    = try(session_group.local_as_no_prepend_replace_as, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_as_no_prepend_replace_as, null)
          local_as_no_prepend_replace_as_dual_as                            = try(session_group.local_as_no_prepend_replace_as_dual_as, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_as_no_prepend_replace_as_dual_as, null)
          password                                                          = try(session_group.password, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.password, null)
          password_inheritance_disable                                      = try(session_group.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.password_inheritance_disable, null)
          receive_buffer_size                                               = try(session_group.receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.receive_buffer_size, null)
          receive_buffer_size_read                                          = try(session_group.receive_buffer_size_read, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.receive_buffer_size_read, null)
          send_buffer_size                                                  = try(session_group.send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.send_buffer_size, null)
          send_buffer_size_write                                            = try(session_group.send_buffer_size_write, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.send_buffer_size_write, null)
          shutdown                                                          = try(session_group.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.shutdown, null)
          timers_keepalive_interval                                         = try(session_group.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.timers_keepalive_interval, null)
          timers_holddown_zero                                              = try(session_group.timers_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.timers_holddown_zero, null)
          timers_holddown_zero_minimum_acceptable_zero                      = try(session_group.timers_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.timers_holddown_zero_minimum_acceptable_zero, null)
          timers_holddown_zero_minimum_acceptable_holdtime                  = try(session_group.timers_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.timers_holddown_zero_minimum_acceptable_holdtime, null)
          timers_holdtime                                                   = try(session_group.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.timers_holdtime, null)
          timers_holdtime_minimum_acceptable_holdtime                       = try(session_group.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.timers_holdtime_minimum_acceptable_holdtime, null)
          local_address                                                     = try(session_group.local_address, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_address, null)
          local_address_inheritance_disable                                 = try(session_group.local_address_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_address_inheritance_disable, null)
          log_neighbor_changes_detail                                       = try(session_group.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_neighbor_changes, null) == "detail" ? true : null
          log_neighbor_changes_disable                                      = try(session_group.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_neighbor_changes, null) == "disable" ? true : null
          log_neighbor_changes_inheritance_disable                          = try(session_group.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_neighbor_changes, null) == "inheritance-disable" ? true : null
          log_message_in_size                                               = try(session_group.log_message_in_size, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_message_in_size, null)
          log_message_in_disable                                            = try(session_group.log_message_in_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_message_in_disable, null)
          log_message_in_inheritance_disable                                = try(session_group.log_message_in_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_message_in_inheritance_disable, null)
          log_message_out_size                                              = try(session_group.log_message_out_size, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_message_out_size, null)
          log_message_out_disable                                           = try(session_group.log_message_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_message_out_disable, null)
          log_message_out_inheritance_disable                               = try(session_group.log_message_out_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.log_message_out_inheritance_disable, null)
          update_source                                                     = try(session_group.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.update_source, null)
          local_address_subnet_prefix                                       = try(session_group.local_address_subnet_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_address_subnet_prefix, null)
          local_address_subnet_mask                                         = try(session_group.local_address_subnet_mask, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.local_address_subnet_mask, null)
          dmz_link_bandwidth                                                = try(session_group.dmz_link_bandwidth, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.dmz_link_bandwidth, null)
          dmz_link_bandwidth_inheritance_disable                            = try(session_group.dmz_link_bandwidth_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.dmz_link_bandwidth_inheritance_disable, null)
          ebgp_recv_extcommunity_dmz                                        = try(session_group.ebgp_recv_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_recv_extcommunity_dmz, null)
          ebgp_recv_extcommunity_dmz_inheritance_disable                    = try(session_group.ebgp_recv_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_recv_extcommunity_dmz_inheritance_disable, null)
          ebgp_send_extcommunity_dmz                                        = try(session_group.ebgp_send_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_send_extcommunity_dmz, null)
          ebgp_send_extcommunity_dmz_cumulative                             = try(session_group.ebgp_send_extcommunity_dmz_cumulative, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_send_extcommunity_dmz_cumulative, null)
          ebgp_send_extcommunity_dmz_inheritance_disable                    = try(session_group.ebgp_send_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ebgp_send_extcommunity_dmz_inheritance_disable, null)
          ttl_security                                                      = try(session_group.ttl_security, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ttl_security, null)
          ttl_security_inheritance_disable                                  = try(session_group.ttl_security_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ttl_security_inheritance_disable, null)
          session_open_mode                                                 = try(session_group.session_open_mode, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.session_open_mode, null)
          dscp                                                              = try(session_group.dscp, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.dscp, null)
          precedence                                                        = try(session_group.precedence, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.precedence, null)
          capability_additional_paths_send                                  = try(session_group.capability_additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_additional_paths_send, null)
          capability_additional_paths_send_disable                          = try(session_group.capability_additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_additional_paths_send_disable, null)
          capability_additional_paths_receive                               = try(session_group.capability_additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_additional_paths_receive, null)
          capability_additional_paths_receive_disable                       = try(session_group.capability_additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_additional_paths_receive_disable, null)
          capability_suppress_all                                           = try(session_group.capability_suppress_all, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_suppress_all, null)
          capability_suppress_all_inheritance_disable                       = try(session_group.capability_suppress_all_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_suppress_all_inheritance_disable, null)
          capability_suppress_extended_nexthop_encoding                     = try(session_group.capability_suppress_extended_nexthop_encoding, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_suppress_extended_nexthop_encoding, null)
          capability_suppress_extended_nexthop_encoding_inheritance_disable = try(session_group.capability_suppress_extended_nexthop_encoding_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_suppress_extended_nexthop_encoding_inheritance_disable, null)
          capability_suppress_four_byte_as                                  = try(session_group.capability_suppress_four_byte_as, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_suppress_four_byte_as, null)
          capability_suppress_four_byte_as_inheritance_disable              = try(session_group.capability_suppress_four_byte_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.capability_suppress_four_byte_as_inheritance_disable, null)
          graceful_restart                                                  = try(session_group.graceful_restart, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.graceful_restart, null)
          graceful_restart_disable                                          = try(session_group.graceful_restart_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.graceful_restart_disable, null)
          graceful_restart_helper_only                                      = try(session_group.graceful_restart_helper_only, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.graceful_restart_helper_only, null)
          graceful_restart_helper_only_inheritance_disable                  = try(session_group.graceful_restart_helper_only_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.graceful_restart_helper_only_inheritance_disable, null)
          graceful_restart_restart_time                                     = try(session_group.graceful_restart_restart_time, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.graceful_restart_restart_time, null)
          graceful_restart_stalepath_time                                   = try(session_group.graceful_restart_stalepath_time, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.graceful_restart_stalepath_time, null)
          enforce_first_as                                                  = try(session_group.enforce_first_as, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.enforce_first_as, null)
          cluster_id_32bit_format                                           = can(tonumber(try(session_group.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.cluster_id, null))) ? try(tonumber(session_group.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.cluster_id), null) : null
          cluster_id_ip_format                                              = can(tonumber(try(session_group.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.cluster_id, null))) ? null : try(session_group.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.cluster_id, null)
          idle_watch_time                                                   = try(session_group.idle_watch_time, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.idle_watch_time, null)
          allowas_in                                                        = try(session_group.allowas_in, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.allowas_in, null)
          egress_engineering                                                = try(session_group.egress_engineering, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.egress_engineering, null)
          egress_engineering_inheritance_disable                            = try(session_group.egress_engineering_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.egress_engineering_inheritance_disable, null)
          peer_sets = try(length(session_group.peer_sets) == 0, true) ? null : [for peer_set in session_group.peer_sets : {
            peer = try(peer_set.peer, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.peer_sets.peer, null)
            }
          ]
          ao_key_chain_name                                        = try(session_group.ao_key_chain_name, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ao_key_chain_name, null)
          ao_key_chain_include_tcp_options                         = try(session_group.ao_key_chain_include_tcp_options, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ao_key_chain_include_tcp_options, null)
          ao_key_chain_accept_mismatch                             = try(session_group.ao_key_chain_accept_mismatch, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ao_key_chain_accept_mismatch, null)
          ao_inheritance_disable                                   = try(session_group.ao_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.ao_inheritance_disable, null)
          default_policy_action_in                                 = try(session_group.default_policy_action_in, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.default_policy_action_in, null)
          default_policy_action_out                                = try(session_group.default_policy_action_out, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.default_policy_action_out, null)
          fast_fallover                                            = try(session_group.fast_fallover, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.fast_fallover, null)
          fast_fallover_inheritance_disable                        = try(session_group.fast_fallover_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.fast_fallover_inheritance_disable, null)
          update_in_labeled_unicast_equivalent                     = try(session_group.update_in_labeled_unicast_equivalent, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.update_in_labeled_unicast_equivalent, null)
          update_in_labeled_unicast_equivalent_inheritance_disable = try(session_group.update_in_labeled_unicast_equivalent_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.update_in_labeled_unicast_equivalent_inheritance_disable, null)
          update_in_error_handling_avoid_reset                     = try(session_group.update_in_error_handling_avoid_reset, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.update_in_error_handling_avoid_reset, null)
          update_in_error_handling_treat_as_withdraw               = try(session_group.update_in_error_handling_treat_as_withdraw, local.defaults.iosxr.devices.configuration.routing.bgp.session_groups.update_in_error_handling_treat_as_withdraw, null)
        }
      ]
    ]
  ])
}

resource "iosxr_router_bgp_session_group" "router_bgp_session_group" {
  for_each                                                          = { for group in local.router_bgp_session_group : group.key => group }
  device                                                            = each.value.device_name
  as_number                                                         = each.value.as_number
  name                                                              = each.value.name
  remote_as                                                         = each.value.remote_as
  remote_as_list                                                    = each.value.remote_as_list
  maximum_peers                                                     = each.value.maximum_peers
  send_community_ebgp                                               = each.value.send_community_ebgp
  send_community_ebgp_inheritance_disable                           = each.value.send_community_ebgp_inheritance_disable
  send_extended_community_ebgp                                      = each.value.send_extended_community_ebgp
  send_extended_community_ebgp_inheritance_disable                  = each.value.send_extended_community_ebgp_inheritance_disable
  as_path_loopcheck_out                                             = each.value.as_path_loopcheck_out
  dampening                                                         = each.value.dampening
  as_override                                                       = each.value.as_override
  use_session_group                                                 = each.value.use_session_group
  advertisement_interval_seconds                                    = each.value.advertisement_interval_seconds
  advertisement_interval_milliseconds                               = each.value.advertisement_interval_milliseconds
  description                                                       = each.value.description
  ignore_connected_check                                            = each.value.ignore_connected_check
  ignore_connected_check_inheritance_disable                        = each.value.ignore_connected_check_inheritance_disable
  internal_vpn_client                                               = each.value.internal_vpn_client
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
  fast_fallover                                                     = each.value.fast_fallover
  fast_fallover_inheritance_disable                                 = each.value.fast_fallover_inheritance_disable
  update_in_labeled_unicast_equivalent                              = each.value.update_in_labeled_unicast_equivalent
  update_in_labeled_unicast_equivalent_inheritance_disable          = each.value.update_in_labeled_unicast_equivalent_inheritance_disable
  update_in_error_handling_avoid_reset                              = each.value.update_in_error_handling_avoid_reset
  update_in_error_handling_treat_as_withdraw                        = each.value.update_in_error_handling_treat_as_withdraw

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn
  ]
}
