locals {
  router_bgp_vrf = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for vrf in try(bgp_process.vrfs, []) : {
          key         = format("%s/%s/%s", device.name, bgp_process.as_number, vrf.vrf_name)
          device_name = device.name
          as_number   = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          vrf_name    = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.vrf_name, null)
          mpls_activate_interfaces = try(length(vrf.mpls_activate_interfaces) == 0, true) ? null : [for iface in vrf.mpls_activate_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.mpls_activate_interfaces.interface_name, null)
            }
          ]
          default_information_originate                        = try(vrf.default_information_originate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.default_information_originate, null)
          default_metric                                       = try(vrf.default_metric, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.default_metric, null)
          socket_receive_buffer_size                           = try(vrf.socket_receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_receive_buffer_size, null)
          socket_receive_buffer_size_read                      = try(vrf.socket_receive_buffer_size_read, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_receive_buffer_size_read, null)
          socket_send_buffer_size                              = try(vrf.socket_send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_send_buffer_size, null)
          socket_send_buffer_size_write                        = try(vrf.socket_send_buffer_size_write, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.socket_send_buffer_size_write, null)
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
          bgp_origin_as_validation_time_off                    = try(vrf.bgp_origin_as_validation_time_off, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_origin_as_validation_time_off, null)
          bgp_origin_as_validation_time                        = try(vrf.bgp_origin_as_validation_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bgp_origin_as_validation_time, null)
          bfd_minimum_interval                                 = try(vrf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bfd_minimum_interval, null)
          bfd_multiplier                                       = try(vrf.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.bfd_multiplier, null)
          rd_auto                                              = try(vrf.rd_auto, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_auto, null)
          rd_two_byte_as_number                                = try(vrf.rd_two_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_two_byte_as_number, null)
          rd_two_byte_as_index                                 = try(vrf.rd_two_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_two_byte_as_index, null)
          rd_four_byte_as_number                               = try(vrf.rd_four_byte_as_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_four_byte_as_number, null)
          rd_four_byte_as_index                                = try(vrf.rd_four_byte_as_index, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_four_byte_as_index, null)
          rd_ipv4_address_address                              = try(vrf.rd_ipv4_address_address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_ipv4_address_address, null)
          rd_ipv4_address_index                                = try(vrf.rd_ipv4_address_index, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.rd_ipv4_address_index, null)
          neighbors = try(length(vrf.neighbors) == 0, true) ? null : [for neighbor in vrf.neighbors : {
            address                                   = try(neighbor.ip, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ip, null)
            evpn_link_bandwidth                       = try(neighbor.evpn_link_bandwidth, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.evpn_link_bandwidth, null)
            evpn_link_bandwidth_per_path_number       = try(neighbor.evpn_link_bandwidth_per_path_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.evpn_link_bandwidth_per_path_number, null)
            evpn_link_bandwidth_inheritance_disable   = try(neighbor.evpn_link_bandwidth_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.evpn_link_bandwidth_inheritance_disable, null)
            remote_as                                 = try(neighbor.remote_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.remote_as, null)
            maximum_peers                             = try(neighbor.maximum_peers, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.maximum_peers, null)
            remote_as_list                            = try(neighbor.remote_as_list, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.remote_as_list, null)
            as_path_loopcheck_out                     = try(neighbor.as_path_loopcheck_out, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.as_path_loopcheck_out, null)
            use_neighbor_group                        = try(neighbor.use_neighbor_group, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.use_neighbor_group, null)
            use_session_group                         = try(neighbor.use_session_group, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.use_session_group, null)
            advertisement_interval_seconds            = try(neighbor.advertisement_interval_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.advertisement_interval_seconds, null)
            advertisement_interval_milliseconds       = try(neighbor.advertisement_interval_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.advertisement_interval_milliseconds, null)
            description                               = try(neighbor.description, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.description, null)
            ignore_connected_check                    = try(neighbor.ignore_connected_check, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ignore_connected_check, null)
            ebgp_multihop_maximum_hop_count           = try(neighbor.ebgp_multihop_maximum_hop_count, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_multihop_maximum_hop_count, null)
            ebgp_multihop_mpls                        = try(neighbor.ebgp_multihop_mpls, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_multihop_mpls, null)
            tcp_mss_value                             = try(neighbor.tcp_mss_value, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.tcp_mss_value, null)
            tcp_mss_inheritance_disable               = try(neighbor.tcp_mss_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.tcp_mss_inheritance_disable, null)
            tcp_mtu_discovery                         = try(neighbor.tcp_mtu_discovery, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.tcp_mtu_discovery, null)
            tcp_mtu_discovery_inheritance_disable     = try(neighbor.tcp_mtu_discovery_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.tcp_mtu_discovery_inheritance_disable, null)
            tcp_ip_only_preferred                     = try(neighbor.tcp_ip_only_preferred, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.tcp_ip_only_preferred, null)
            tcp_ip_only_preferred_inheritance_disable = try(neighbor.tcp_ip_only_preferred_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.tcp_ip_only_preferred_inheritance_disable, null)
            bmp_activate_servers = try(length(neighbor.bmp_activate_servers) == 0, true) ? null : [for server in neighbor.bmp_activate_servers : {
              server_number = try(server.server_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bmp_activate_servers.server_number, null)
              }
            ]
            bfd_minimum_interval                                              = try(neighbor.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_minimum_interval, null)
            bfd_multiplier                                                    = try(neighbor.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_multiplier, null)
            bfd_fast_detect                                                   = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect, null) == "enable" ? true : null
            bfd_fast_detect_strict_mode                                       = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect, null) == "strict-mode" ? true : null
            bfd_fast_detect_disable                                           = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect, null) == "disable" ? true : null
            bfd_fast_detect_strict_mode_negotiate                             = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect, null) == "strict-mode-negotiate" ? true : null
            bfd_fast_detect_strict_mode_negotiate_override                    = try(neighbor.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bfd_fast_detect, null) == "strict-mode-negotiate-override" ? true : null
            keychain_name                                                     = try(neighbor.keychain_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.keychain_name, null)
            keychain_inheritance_disable                                      = try(neighbor.keychain_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.keychain_inheritance_disable, null)
            local_as_inheritance_disable                                      = try(neighbor.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_inheritance_disable, null)
            local_as                                                          = try(neighbor.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as, null)
            local_as_no_prepend                                               = try(neighbor.local_as_no_prepend, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_no_prepend, null)
            local_as_no_prepend_replace_as                                    = try(neighbor.local_as_no_prepend_replace_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_no_prepend_replace_as, null)
            local_as_no_prepend_replace_as_dual_as                            = try(neighbor.local_as_no_prepend_replace_as_dual_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_as_no_prepend_replace_as_dual_as, null)
            password                                                          = try(neighbor.password, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.password, null)
            password_inheritance_disable                                      = try(neighbor.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.password_inheritance_disable, null)
            receive_buffer_size                                               = try(neighbor.receive_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.receive_buffer_size, null)
            receive_buffer_size_read                                          = try(neighbor.receive_buffer_size_read, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.receive_buffer_size_read, null)
            send_buffer_size                                                  = try(neighbor.send_buffer_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.send_buffer_size, null)
            send_buffer_size_write                                            = try(neighbor.send_buffer_size_write, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.send_buffer_size_write, null)
            fast_fallover                                                     = try(neighbor.fast_fallover, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.fast_fallover, null)
            fast_fallover_inheritance_disable                                 = try(neighbor.fast_fallover_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.fast_fallover_inheritance_disable, null)
            shutdown                                                          = try(neighbor.shutdown, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.shutdown, null)
            timers_keepalive_interval                                         = try(neighbor.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_keepalive_interval, null)
            timers_holddown_zero                                              = try(neighbor.timers_holddown_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holddown_zero, null)
            timers_holddown_zero_minimum_acceptable_zero                      = try(neighbor.timers_holddown_zero_minimum_acceptable_zero, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holddown_zero_minimum_acceptable_zero, null)
            timers_holddown_zero_minimum_acceptable_holdtime                  = try(neighbor.timers_holddown_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holddown_zero_minimum_acceptable_holdtime, null)
            timers_holdtime                                                   = try(neighbor.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holdtime, null)
            timers_holdtime_minimum_acceptable_holdtime                       = try(neighbor.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.timers_holdtime_minimum_acceptable_holdtime, null)
            local_address                                                     = try(neighbor.local_address, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_address, null)
            local_address_inheritance_disable                                 = try(neighbor.local_address_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_address_inheritance_disable, null)
            log_neighbor_changes_detail                                       = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_neighbor_changes, null) == "detail" ? true : null
            log_neighbor_changes_disable                                      = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_neighbor_changes, null) == "disable" ? true : null
            log_neighbor_changes_inheritance_disable                          = try(neighbor.log_neighbor_changes, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_neighbor_changes, null) == "inheritance-disable" ? true : null
            log_message_in_size                                               = try(neighbor.log_message_in_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_message_in_size, null)
            log_message_in_disable                                            = try(neighbor.log_message_in_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_message_in_disable, null)
            log_message_in_inheritance_disable                                = try(neighbor.log_message_in_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_message_in_inheritance_disable, null)
            log_message_out_size                                              = try(neighbor.log_message_out_size, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_message_out_size, null)
            log_message_out_disable                                           = try(neighbor.log_message_out_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_message_out_disable, null)
            log_message_out_inheritance_disable                               = try(neighbor.log_message_out_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.log_message_out_inheritance_disable, null)
            update_source                                                     = try(neighbor.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_source, null)
            local_address_subnet_prefix                                       = try(neighbor.local_address_subnet_prefix, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_address_subnet_prefix, null)
            local_address_subnet_mask                                         = try(neighbor.local_address_subnet_mask, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.local_address_subnet_mask, null)
            dmz_link_bandwidth                                                = try(neighbor.dmz_link_bandwidth, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.dmz_link_bandwidth, null)
            dmz_link_bandwidth_inheritance_disable                            = try(neighbor.dmz_link_bandwidth_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.dmz_link_bandwidth_inheritance_disable, null)
            ebgp_recv_extcommunity_dmz                                        = try(neighbor.ebgp_recv_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_recv_extcommunity_dmz, null)
            ebgp_recv_extcommunity_dmz_inheritance_disable                    = try(neighbor.ebgp_recv_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_recv_extcommunity_dmz_inheritance_disable, null)
            ebgp_send_extcommunity_dmz                                        = try(neighbor.ebgp_send_extcommunity_dmz, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_send_extcommunity_dmz, null)
            ebgp_send_extcommunity_dmz_cumulative                             = try(neighbor.ebgp_send_extcommunity_dmz_cumulative, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_send_extcommunity_dmz_cumulative, null)
            ebgp_send_extcommunity_dmz_inheritance_disable                    = try(neighbor.ebgp_send_extcommunity_dmz_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ebgp_send_extcommunity_dmz_inheritance_disable, null)
            ttl_security                                                      = try(neighbor.ttl_security, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ttl_security, null)
            ttl_security_inheritance_disable                                  = try(neighbor.ttl_security_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ttl_security_inheritance_disable, null)
            session_open_mode                                                 = try(neighbor.session_open_mode, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.session_open_mode, null)
            dscp                                                              = try(neighbor.dscp, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.dscp, null)
            precedence                                                        = try(neighbor.precedence, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.precedence, null)
            capability_additional_paths_send                                  = try(neighbor.capability_additional_paths_send, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_additional_paths_send, null)
            capability_additional_paths_send_disable                          = try(neighbor.capability_additional_paths_send_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_additional_paths_send_disable, null)
            capability_additional_paths_receive                               = try(neighbor.capability_additional_paths_receive, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_additional_paths_receive, null)
            capability_additional_paths_receive_disable                       = try(neighbor.capability_additional_paths_receive_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_additional_paths_receive_disable, null)
            capability_suppress_all                                           = try(neighbor.capability_suppress_all, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_suppress_all, null)
            capability_suppress_all_inheritance_disable                       = try(neighbor.capability_suppress_all_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_suppress_all_inheritance_disable, null)
            capability_suppress_extended_nexthop_encoding                     = try(neighbor.capability_suppress_extended_nexthop_encoding, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_suppress_extended_nexthop_encoding, null)
            capability_suppress_extended_nexthop_encoding_inheritance_disable = try(neighbor.capability_suppress_extended_nexthop_encoding_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_suppress_extended_nexthop_encoding_inheritance_disable, null)
            capability_suppress_four_byte_as                                  = try(neighbor.capability_suppress_four_byte_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_suppress_four_byte_as, null)
            capability_suppress_four_byte_as_inheritance_disable              = try(neighbor.capability_suppress_four_byte_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.capability_suppress_four_byte_as_inheritance_disable, null)
            graceful_restart                                                  = try(neighbor.graceful_restart, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_restart, null)
            graceful_restart_disable                                          = try(neighbor.graceful_restart_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_restart_disable, null)
            graceful_restart_helper_only                                      = try(neighbor.graceful_restart_helper_only, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_restart_helper_only, null)
            graceful_restart_helper_only_inheritance_disable                  = try(neighbor.graceful_restart_helper_only_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_restart_helper_only_inheritance_disable, null)
            graceful_restart_restart_time                                     = try(neighbor.graceful_restart_restart_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_restart_restart_time, null)
            graceful_restart_stalepath_time                                   = try(neighbor.graceful_restart_stalepath_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_restart_stalepath_time, null)
            enforce_first_as                                                  = try(neighbor.enforce_first_as, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.enforce_first_as, null)
            cluster_id_32bit_format                                           = can(tonumber(try(neighbor.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.cluster_id, null))) ? try(tonumber(neighbor.cluster_id), tonumber(local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.cluster_id), null) : null
            cluster_id_ip_format                                              = can(tonumber(try(neighbor.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.cluster_id, null))) ? null : try(neighbor.cluster_id, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.cluster_id, null)
            idle_watch_time                                                   = try(neighbor.idle_watch_time, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.idle_watch_time, null)
            allowas_in                                                        = try(neighbor.allowas_in, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.allowas_in, null)
            egress_engineering                                                = try(neighbor.egress_engineering, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.egress_engineering, null)
            egress_engineering_inheritance_disable                            = try(neighbor.egress_engineering_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.egress_engineering_inheritance_disable, null)
            peer_sets = try(length(neighbor.peer_sets) == 0, true) ? null : [for peer_set in neighbor.peer_sets : {
              peer = try(peer_set.peer, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.peer_sets.peer, null)
              }
            ]
            ao_key_chain_name                                              = try(neighbor.ao_key_chain_name, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ao_key_chain_name, null)
            ao_key_chain_include_tcp_options                               = try(neighbor.ao_key_chain_include_tcp_options, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ao_key_chain_include_tcp_options, null)
            ao_key_chain_accept_mismatch                                   = try(neighbor.ao_key_chain_accept_mismatch, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ao_key_chain_accept_mismatch, null)
            ao_inheritance_disable                                         = try(neighbor.ao_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.ao_inheritance_disable, null)
            dampening                                                      = try(neighbor.dampening, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.dampening, null)
            as_override                                                    = try(neighbor.as_override, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.as_override, null)
            default_policy_action_in                                       = try(neighbor.default_policy_action_in, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.default_policy_action_in, null)
            default_policy_action_out                                      = try(neighbor.default_policy_action_out, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.default_policy_action_out, null)
            origin_as_validation_disable                                   = try(neighbor.origin_as_validation_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.origin_as_validation_disable, null)
            send_extended_community_ebgp                                   = try(neighbor.send_extended_community_ebgp, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.send_extended_community_ebgp, null)
            send_extended_community_ebgp_inheritance_disable               = try(neighbor.send_extended_community_ebgp_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.send_extended_community_ebgp_inheritance_disable, null)
            bestpath_origin_as_allow_invalid                               = try(neighbor.bestpath_origin_as_allow_invalid, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.bestpath_origin_as_allow_invalid, null)
            update_in_filtering_message_buffers                            = try(neighbor.update_in_filtering_message_buffers, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_filtering_message_buffers, null)
            update_in_filtering_message_buffers_type                       = try(neighbor.update_in_filtering_message_buffers_type, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_filtering_message_buffers_type, null)
            update_in_filtering_logging_disable                            = try(neighbor.update_in_filtering_logging_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_filtering_logging_disable, null)
            update_in_filtering_attribute_filter_group                     = try(neighbor.update_in_filtering_attribute_filter_group, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_filtering_attribute_filter_group, null)
            update_in_labeled_unicast_equivalent                           = try(neighbor.update_in_labeled_unicast_equivalent, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_labeled_unicast_equivalent, null)
            update_in_labeled_unicast_equivalent_inheritance_disable       = try(neighbor.update_in_labeled_unicast_equivalent_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_labeled_unicast_equivalent_inheritance_disable, null)
            update_in_error_handling_avoid_reset                           = try(neighbor.update_in_error_handling_avoid_reset, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_error_handling_avoid_reset, null)
            update_in_error_handling_treat_as_withdraw                     = try(neighbor.update_in_error_handling_treat_as_withdraw, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.update_in_error_handling_treat_as_withdraw, null)
            graceful_maintenance_activate                                  = try(neighbor.graceful_maintenance_activate, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_activate, null)
            graceful_maintenance_activate_inheritance_disable              = try(neighbor.graceful_maintenance_activate_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_activate_inheritance_disable, null)
            graceful_maintenance_local_preference                          = try(neighbor.graceful_maintenance_local_preference, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_local_preference, null)
            graceful_maintenance_local_preference_inheritance_disable      = try(neighbor.graceful_maintenance_local_preference_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_local_preference_inheritance_disable, null)
            graceful_maintenance_as_prepends_number                        = try(neighbor.graceful_maintenance_as_prepends_number, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_as_prepends_number, null)
            graceful_maintenance_as_prepends_inheritance_disable           = try(neighbor.graceful_maintenance_as_prepends_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_as_prepends_inheritance_disable, null)
            graceful_maintenance_bandwidth_aware_percentage_threshold      = try(neighbor.graceful_maintenance_bandwidth_aware_percentage_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_bandwidth_aware_percentage_threshold, null)
            graceful_maintenance_bandwidth_aware_percentage_threshold_high = try(neighbor.graceful_maintenance_bandwidth_aware_percentage_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_bandwidth_aware_percentage_threshold_high, null)
            graceful_maintenance_bandwidth_aware_bandwidth_threshold       = try(neighbor.graceful_maintenance_bandwidth_aware_bandwidth_threshold, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_bandwidth_aware_bandwidth_threshold, null)
            graceful_maintenance_bandwidth_aware_bandwidth_threshold_high  = try(neighbor.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_bandwidth_aware_bandwidth_threshold_high, null)
            graceful_maintenance_bandwidth_aware_inheritance_disable       = try(neighbor.graceful_maintenance_bandwidth_aware_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.vrfs.neighbors.graceful_maintenance_bandwidth_aware_inheritance_disable, null)
            }
          ]
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
  rd_auto                                              = each.value.rd_auto
  rd_two_byte_as_number                                = each.value.rd_two_byte_as_number
  rd_two_byte_as_index                                 = each.value.rd_two_byte_as_index
  rd_four_byte_as_number                               = each.value.rd_four_byte_as_number
  rd_four_byte_as_index                                = each.value.rd_four_byte_as_index
  rd_ipv4_address_address                              = each.value.rd_ipv4_address_address
  rd_ipv4_address_index                                = each.value.rd_ipv4_address_index
  neighbors                                            = each.value.neighbors

  depends_on = [
    iosxr_key_chain.key_chain,
    iosxr_route_policy.route_policy,
    iosxr_bmp_server.bmp_server,
    iosxr_router_bgp.router_bgp,
    iosxr_router_bgp_address_family.ipv4_unicast,
    iosxr_router_bgp_address_family.ipv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_unicast,
    iosxr_router_bgp_address_family.vpnv6_unicast,
    iosxr_router_bgp_address_family.vpnv4_multicast,
    iosxr_router_bgp_address_family.vpnv6_multicast,
    iosxr_router_bgp_address_family.l2vpn_evpn,
    iosxr_router_bgp_session_group.router_bgp_session_group,
    iosxr_router_bgp_neighbor_group.router_bgp_neighbor_group,
    iosxr_router_bgp_af_group.router_bgp_af_group
  ]
}
