locals {
  router_ospf_vrf_area = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for vrf in try(ospf_process.vrfs, []) : [
          for area in try(vrf.areas, []) : {
            key                                                             = format("%s/%s/%s/%s", device.name, ospf_process.id, vrf.vrf_name, area.area_id)
            device_name                                                     = device.name
            process_name                                                    = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
            vrf_name                                                        = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.vrf_name, null)
            area_id                                                         = try(area.area_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.area_id, null)
            default_cost                                                    = try(area.default_cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.default_cost, null)
            stub                                                            = try(area.stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.stub, null)
            stub_no_summary                                                 = try(area.stub_no_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.stub_no_summary, null)
            nssa                                                            = try(area.nssa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa, null)
            nssa_no_redistribution                                          = try(area.nssa_no_redistribution, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa_no_redistribution, null)
            nssa_default_information_originate                              = try(area.nssa_default_information_originate, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa_default_information_originate, null)
            nssa_default_information_originate_metric                       = try(area.nssa_default_information_originate_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa_default_information_originate_metric, null)
            nssa_default_information_originate_metric_type                  = try(area.nssa_default_information_originate_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa_default_information_originate_metric_type, null)
            nssa_no_summary                                                 = try(area.nssa_no_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa_no_summary, null)
            nssa_translate_type7_always                                     = try(area.nssa_translate_type7_always, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.nssa_translate_type7_always, null)
            route_policy_in                                                 = try(area.route_policy_in, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.route_policy_in, null)
            route_policy_out                                                = try(area.route_policy_out, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.route_policy_out, null)
            external_out_enable                                             = try(area.external_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.external_out_enable, null)
            external_out_disable                                            = try(area.external_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.external_out_disable, null)
            summary_in_enable                                               = try(area.summary_in_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.summary_in_enable, null)
            summary_in_disable                                              = try(area.summary_in_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.summary_in_disable, null)
            authentication_key_encrypted                                    = try(area.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.authentication_key_encrypted, null)
            authentication_message_digest                                   = try(area.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.authentication_message_digest, null)
            authentication_keychain_name                                    = try(area.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.authentication_keychain_name, null)
            authentication_keychain                                         = try(area.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.authentication_keychain, null)
            authentication_null                                             = try(area.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.authentication_null, null)
            network_broadcast                                               = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.network, null) == "broadcast" ? true : null
            network_non_broadcast                                           = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.network, null) == "non_broadcast" ? true : null
            network_point_to_point                                          = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.network, null) == "point_to_point" ? true : null
            network_point_to_multipoint                                     = try(area.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.network, null) == "point_to_multipoint" ? true : null
            mpls_ldp_sync_disable                                           = try(area.mpls_ldp_sync_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.mpls_ldp_sync_disable, null)
            cost                                                            = try(area.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost, null)
            cost_fallback_anomaly_delay_igp_metric_increment                = try(area.cost_fallback_anomaly_delay_igp_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_igp_metric_increment, null)
            cost_fallback_anomaly_delay_igp_metric_multiplier               = try(area.cost_fallback_anomaly_delay_igp_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_igp_metric_multiplier, null)
            cost_fallback_anomaly_delay_igp_metric_value                    = try(area.cost_fallback_anomaly_delay_igp_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_igp_metric_value, null)
            cost_fallback_anomaly_delay_igp_metric_disable                  = try(area.cost_fallback_anomaly_delay_igp_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_igp_metric_disable, null)
            cost_fallback_anomaly_delay_te_metric_increment                 = try(area.cost_fallback_anomaly_delay_te_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_te_metric_increment, null)
            cost_fallback_anomaly_delay_te_metric_multiplier                = try(area.cost_fallback_anomaly_delay_te_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_te_metric_multiplier, null)
            cost_fallback_anomaly_delay_te_metric_value                     = try(area.cost_fallback_anomaly_delay_te_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_te_metric_value, null)
            cost_fallback_anomaly_delay_te_metric_disable                   = try(area.cost_fallback_anomaly_delay_te_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.cost_fallback_anomaly_delay_te_metric_disable, null)
            hello_interval                                                  = try(area.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.hello_interval, null)
            dead_interval                                                   = try(area.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.dead_interval, null)
            priority                                                        = try(area.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.priority, null)
            retransmit_interval                                             = try(area.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.retransmit_interval, null)
            transmit_delay                                                  = try(area.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.transmit_delay, null)
            flood_reduction_enable                                          = try(area.flood_reduction_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.flood_reduction_enable, null)
            flood_reduction_disable                                         = try(area.flood_reduction_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.flood_reduction_disable, null)
            demand_circuit_enable                                           = try(area.demand_circuit_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.demand_circuit_enable, null)
            demand_circuit_disable                                          = try(area.demand_circuit_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.demand_circuit_disable, null)
            mtu_ignore_enable                                               = try(area.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.mtu_ignore_enable, null)
            mtu_ignore_disable                                              = try(area.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.mtu_ignore_disable, null)
            database_filter_all_out_enable                                  = try(area.database_filter_all_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.database_filter_all_out_enable, null)
            database_filter_all_out_disable                                 = try(area.database_filter_all_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.database_filter_all_out_disable, null)
            passive_enable                                                  = try(area.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.passive_enable, null)
            passive_disable                                                 = try(area.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.passive_disable, null)
            distribute_list_in_acl                                          = try(area.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.distribute_list_in_acl, null)
            distribute_list_in_route_policy                                 = try(area.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.distribute_list_in_route_policy, null)
            packet_size                                                     = try(area.packet_size, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.packet_size, null)
            bfd_fast_detect                                                 = try(area.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.bfd_fast_detect, null) == "enable" ? true : null
            bfd_fast_detect_strict_mode                                     = try(area.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.bfd_fast_detect, null) == "strict_mode" ? true : null
            bfd_fast_detect_disable                                         = try(area.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.bfd_fast_detect, null) == "disable" ? true : null
            bfd_minimum_interval                                            = try(area.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.bfd_minimum_interval, null)
            bfd_multiplier                                                  = try(area.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.bfd_multiplier, null)
            security_ttl                                                    = try(area.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.security_ttl, null)
            security_ttl_hops                                               = try(area.security_ttl_hops, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.security_ttl_hops, null)
            security_ttl_disable                                            = try(area.security_ttl_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.security_ttl_disable, null)
            prefix_suppression                                              = try(area.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.prefix_suppression, null)
            prefix_suppression_disable                                      = try(area.prefix_suppression_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.prefix_suppression_disable, null)
            fast_reroute_disable                                            = try(area.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_disable, null)
            fast_reroute_per_link                                           = try(area.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_link.enable, null)
            fast_reroute_per_link_use_candidate_only_enable                 = try(area.fast_reroute_per_link.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_link.use_candidate_only_enable, null)
            fast_reroute_per_link_use_candidate_only_disable                = try(area.fast_reroute_per_link.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_link.use_candidate_only_disable, null)
            fast_reroute_per_prefix                                         = try(area.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.enable, null)
            fast_reroute_per_prefix_use_candidate_only_enable               = try(area.fast_reroute_per_prefix.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.use_candidate_only_enable, null)
            fast_reroute_per_prefix_use_candidate_only_disable              = try(area.fast_reroute_per_prefix.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.use_candidate_only_disable, null)
            fast_reroute_per_prefix_tiebreaker_downstream_index             = try(area.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
            fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(area.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(area.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(area.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
            fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(area.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
            fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(area.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(area.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
            fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(area.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
            fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(area.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
            fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(area.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
            fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(area.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
            fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(area.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
            fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(area.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(area.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(area.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
            fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(area.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
            loopback_stub_network_enable                                    = try(area.loopback_stub_network_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.loopback_stub_network_enable, null)
            loopback_stub_network_disable                                   = try(area.loopback_stub_network_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.loopback_stub_network_disable, null)
            link_down_fast_detect                                           = try(area.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.link_down_fast_detect, null)
            weight                                                          = try(area.weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.weight, null)
            delay_normalize_interval                                        = try(area.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.delay_normalize_interval, null)
            delay_normalize_offset                                          = try(area.delay_normalize_offset, area.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.delay_normalize_offset, null)
            ranges = try(length(area.ranges) == 0, true) ? null : [for range in area.ranges : {
              address       = try(range.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.ranges.address, null)
              mask          = try(range.mask, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.ranges.mask, null)
              advertise     = try(range.advertise, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.ranges.advertise, null)
              not_advertise = try(range.not_advertise, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.ranges.not_advertise, null)
            }]
            message_digest_keys = try(length(area.message_digest_keys) == 0, true) ? null : [for key in area.message_digest_keys : {
              key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.message_digest_keys.key_id, null)
              md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.message_digest_keys.md5_encrypted, null)
            }]
            fast_reroute_per_link_exclude_interfaces = try(length(area.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_link.exclude_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_link.exclude_interfaces.interface_name, null)
            }]
            fast_reroute_per_link_lfa_candidate_interfaces = try(length(area.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_link.lfa_candidate_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
            }]
            fast_reroute_per_prefix_exclude_interfaces = try(length(area.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_prefix.exclude_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
            }]
            fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(area.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in area.fast_reroute_per_prefix.lfa_candidate_interfaces : {
              interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
            }]
            virtual_links = try(length(area.virtual_links) == 0, true) ? null : [for vl in area.virtual_links : {
              address                       = try(vl.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.address, null)
              hello_interval                = try(vl.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.hello_interval, null)
              dead_interval                 = try(vl.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.dead_interval, null)
              retransmit_interval           = try(vl.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.retransmit_interval, null)
              transmit_delay                = try(vl.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.transmit_delay, null)
              authentication_key_encrypted  = try(vl.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.authentication_key_encrypted, null)
              authentication_message_digest = try(vl.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.authentication_message_digest, null)
              authentication_keychain       = try(vl.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.authentication_keychain, null)
              authentication_keychain_name  = try(vl.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.authentication_keychain_name, null)
              authentication_null           = try(vl.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.authentication_null, null)
              message_digest_keys = try(length(vl.message_digest_keys) == 0, true) ? null : [for key in vl.message_digest_keys : {
                key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.message_digest_keys.key_id, null)
                md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.virtual_links.message_digest_keys.md5_encrypted, null)
              }]
            }]
            sham_links = try(length(area.sham_links) == 0, true) ? null : [for sl in area.sham_links : {
              local_address                 = try(sl.local_address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.local_address, null)
              remote_address                = try(sl.remote_address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.remote_address, null)
              cost                          = try(sl.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.cost, null)
              hello_interval                = try(sl.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.hello_interval, null)
              dead_interval                 = try(sl.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.dead_interval, null)
              retransmit_interval           = try(sl.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.retransmit_interval, null)
              transmit_delay                = try(sl.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.transmit_delay, null)
              authentication_key_encrypted  = try(sl.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.authentication_key_encrypted, null)
              authentication_message_digest = try(sl.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.authentication_message_digest, null)
              authentication_keychain       = try(sl.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.authentication_keychain, null)
              authentication_keychain_name  = try(sl.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.authentication_keychain_name, null)
              authentication_null           = try(sl.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.authentication_null, null)
              message_digest_keys = try(length(sl.message_digest_keys) == 0, true) ? null : [for key in sl.message_digest_keys : {
                key_id        = try(key.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.message_digest_keys.key_id, null)
                md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.sham_links.message_digest_keys.md5_encrypted, null)
              }]
            }]
          }
        ]
      ]
    ]
  ])
}

resource "iosxr_router_ospf_vrf_area" "router_ospf_vrf_area" {
  for_each                                                        = { for area in local.router_ospf_vrf_area : area.key => area }
  device                                                          = each.value.device_name
  process_name                                                    = each.value.process_name
  vrf_name                                                        = each.value.vrf_name
  area_id                                                         = each.value.area_id
  default_cost                                                    = each.value.default_cost
  stub                                                            = each.value.stub
  stub_no_summary                                                 = each.value.stub_no_summary
  nssa                                                            = each.value.nssa
  nssa_no_redistribution                                          = each.value.nssa_no_redistribution
  nssa_default_information_originate                              = each.value.nssa_default_information_originate
  nssa_default_information_originate_metric                       = each.value.nssa_default_information_originate_metric
  nssa_default_information_originate_metric_type                  = each.value.nssa_default_information_originate_metric_type
  nssa_no_summary                                                 = each.value.nssa_no_summary
  nssa_translate_type7_always                                     = each.value.nssa_translate_type7_always
  route_policy_in                                                 = each.value.route_policy_in
  route_policy_out                                                = each.value.route_policy_out
  external_out_enable                                             = each.value.external_out_enable
  external_out_disable                                            = each.value.external_out_disable
  summary_in_enable                                               = each.value.summary_in_enable
  summary_in_disable                                              = each.value.summary_in_disable
  authentication_key_encrypted                                    = each.value.authentication_key_encrypted
  authentication_message_digest                                   = each.value.authentication_message_digest
  authentication_keychain_name                                    = each.value.authentication_keychain_name
  authentication_keychain                                         = each.value.authentication_keychain
  authentication_null                                             = each.value.authentication_null
  network_broadcast                                               = each.value.network_broadcast
  network_non_broadcast                                           = each.value.network_non_broadcast
  network_point_to_point                                          = each.value.network_point_to_point
  network_point_to_multipoint                                     = each.value.network_point_to_multipoint
  mpls_ldp_sync_disable                                           = each.value.mpls_ldp_sync_disable
  cost                                                            = each.value.cost
  cost_fallback_anomaly_delay_igp_metric_increment                = each.value.cost_fallback_anomaly_delay_igp_metric_increment
  cost_fallback_anomaly_delay_igp_metric_multiplier               = each.value.cost_fallback_anomaly_delay_igp_metric_multiplier
  cost_fallback_anomaly_delay_igp_metric_value                    = each.value.cost_fallback_anomaly_delay_igp_metric_value
  cost_fallback_anomaly_delay_igp_metric_disable                  = each.value.cost_fallback_anomaly_delay_igp_metric_disable
  cost_fallback_anomaly_delay_te_metric_increment                 = each.value.cost_fallback_anomaly_delay_te_metric_increment
  cost_fallback_anomaly_delay_te_metric_multiplier                = each.value.cost_fallback_anomaly_delay_te_metric_multiplier
  cost_fallback_anomaly_delay_te_metric_value                     = each.value.cost_fallback_anomaly_delay_te_metric_value
  cost_fallback_anomaly_delay_te_metric_disable                   = each.value.cost_fallback_anomaly_delay_te_metric_disable
  hello_interval                                                  = each.value.hello_interval
  dead_interval                                                   = each.value.dead_interval
  priority                                                        = each.value.priority
  retransmit_interval                                             = each.value.retransmit_interval
  transmit_delay                                                  = each.value.transmit_delay
  flood_reduction_enable                                          = each.value.flood_reduction_enable
  flood_reduction_disable                                         = each.value.flood_reduction_disable
  demand_circuit_enable                                           = each.value.demand_circuit_enable
  demand_circuit_disable                                          = each.value.demand_circuit_disable
  mtu_ignore_enable                                               = each.value.mtu_ignore_enable
  mtu_ignore_disable                                              = each.value.mtu_ignore_disable
  database_filter_all_out_enable                                  = each.value.database_filter_all_out_enable
  database_filter_all_out_disable                                 = each.value.database_filter_all_out_disable
  passive_enable                                                  = each.value.passive_enable
  passive_disable                                                 = each.value.passive_disable
  distribute_list_in_acl                                          = each.value.distribute_list_in_acl
  distribute_list_in_route_policy                                 = each.value.distribute_list_in_route_policy
  packet_size                                                     = each.value.packet_size
  bfd_fast_detect                                                 = each.value.bfd_fast_detect
  bfd_fast_detect_strict_mode                                     = each.value.bfd_fast_detect_strict_mode
  bfd_fast_detect_disable                                         = each.value.bfd_fast_detect_disable
  bfd_minimum_interval                                            = each.value.bfd_minimum_interval
  bfd_multiplier                                                  = each.value.bfd_multiplier
  security_ttl                                                    = each.value.security_ttl
  security_ttl_hops                                               = each.value.security_ttl_hops
  security_ttl_disable                                            = each.value.security_ttl_disable
  prefix_suppression                                              = each.value.prefix_suppression
  prefix_suppression_disable                                      = each.value.prefix_suppression_disable
  fast_reroute_disable                                            = each.value.fast_reroute_disable
  fast_reroute_per_link                                           = each.value.fast_reroute_per_link
  fast_reroute_per_link_use_candidate_only_enable                 = each.value.fast_reroute_per_link_use_candidate_only_enable
  fast_reroute_per_link_use_candidate_only_disable                = each.value.fast_reroute_per_link_use_candidate_only_disable
  fast_reroute_per_prefix                                         = each.value.fast_reroute_per_prefix
  fast_reroute_per_prefix_use_candidate_only_enable               = each.value.fast_reroute_per_prefix_use_candidate_only_enable
  fast_reroute_per_prefix_use_candidate_only_disable              = each.value.fast_reroute_per_prefix_use_candidate_only_disable
  fast_reroute_per_prefix_tiebreaker_downstream_index             = each.value.fast_reroute_per_prefix_tiebreaker_downstream_index
  fast_reroute_per_prefix_tiebreaker_downstream_disable           = each.value.fast_reroute_per_prefix_tiebreaker_downstream_disable
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable
  fast_reroute_per_prefix_tiebreaker_node_protecting_index        = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_disable
  fast_reroute_per_prefix_tiebreaker_primary_path_index           = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_index
  fast_reroute_per_prefix_tiebreaker_primary_path_disable         = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_disable
  fast_reroute_per_prefix_tiebreaker_secondary_path_index         = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_index
  fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_disable
  fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = each.value.fast_reroute_per_prefix_tiebreaker_interface_disjoint_index
  fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = each.value.fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable
  loopback_stub_network_enable                                    = each.value.loopback_stub_network_enable
  loopback_stub_network_disable                                   = each.value.loopback_stub_network_disable
  link_down_fast_detect                                           = each.value.link_down_fast_detect
  weight                                                          = each.value.weight
  delay_normalize_interval                                        = each.value.delay_normalize_interval
  delay_normalize_offset                                          = each.value.delay_normalize_offset
  ranges                                                          = each.value.ranges
  message_digest_keys                                             = each.value.message_digest_keys
  fast_reroute_per_link_exclude_interfaces                        = each.value.fast_reroute_per_link_exclude_interfaces
  fast_reroute_per_link_lfa_candidate_interfaces                  = each.value.fast_reroute_per_link_lfa_candidate_interfaces
  fast_reroute_per_prefix_exclude_interfaces                      = each.value.fast_reroute_per_prefix_exclude_interfaces
  fast_reroute_per_prefix_lfa_candidate_interfaces                = each.value.fast_reroute_per_prefix_lfa_candidate_interfaces
  virtual_links                                                   = each.value.virtual_links
  sham_links                                                      = each.value.sham_links

  depends_on = [
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain,
    iosxr_vrf.vrf,
    iosxr_router_ospf_vrf.router_ospf_vrf
  ]
}
