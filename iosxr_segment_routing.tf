##### Segment Routing #####

locals {
  segment_routing = [
    for device in local.devices : {
      device_name              = device.name
      enable                   = try(local.device_config[device.name].segment_routing.enable, local.defaults.iosxr.devices.configuration.segment_routing.enable, null)
      global_block_lower_bound = try(local.device_config[device.name].segment_routing.global_block_from, local.defaults.iosxr.devices.configuration.segment_routing.global_block_from, null)
      global_block_upper_bound = try(local.device_config[device.name].segment_routing.global_block_to, local.defaults.iosxr.devices.configuration.segment_routing.global_block_to, null)
      local_block_lower_bound  = try(local.device_config[device.name].segment_routing.local_block_from, local.defaults.iosxr.devices.configuration.segment_routing.local_block_from, null)
      local_block_upper_bound  = try(local.device_config[device.name].segment_routing.local_block_to, local.defaults.iosxr.devices.configuration.segment_routing.local_block_to, null)
    } if try(local.device_config[device.name].segment_routing, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing, null) != null
  ]
}

resource "iosxr_segment_routing" "segment_routing" {
  for_each                 = { for sr in local.segment_routing : sr.device_name => sr }
  device                   = each.value.device_name
  enable                   = each.value.enable
  global_block_lower_bound = each.value.global_block_lower_bound
  global_block_upper_bound = each.value.global_block_upper_bound
  local_block_lower_bound  = each.value.local_block_lower_bound
  local_block_upper_bound  = each.value.local_block_upper_bound
}

##### Segment Routing Mapping Server #####

locals {
  segment_routing_mapping_server = [
    for device in local.devices : {
      device_name = device.name
      mapping_prefix_sid_address_family = try(length(local.device_config[device.name].segment_routing.mapping_server) == 0, true) ? null : [
        for af in local.device_config[device.name].segment_routing.mapping_server : {
          af_name = try(af.address_family, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.address_family, null)
          prefix_addresses = try(length(af.prefix_sid_maps) == 0, true) ? null : [
            for entry in af.prefix_sid_maps : {
              address   = try(entry.prefix, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.prefix, null)
              length    = try(entry.length, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.length, null)
              sid_index = try(entry.sid_index, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.sid_index, null)
              range     = try(entry.range, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.range, null)
              attached  = try(entry.attached, local.defaults.iosxr.devices.configuration.segment_routing.mapping_server.prefix_sid_maps.attached, null)
            }
          ]
        }
      ]
    } if try(local.device_config[device.name].segment_routing.mapping_server, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing.mapping_server, null) != null
  ]
}

resource "iosxr_segment_routing_mapping_server" "segment_routing_mapping_server" {
  for_each                          = { for ms in local.segment_routing_mapping_server : ms.device_name => ms }
  device                            = each.value.device_name
  mapping_prefix_sid_address_family = each.value.mapping_prefix_sid_address_family

  depends_on = [
    iosxr_segment_routing.segment_routing,
  ]
}

##### Segment Routing v6 #####

locals {
  segment_routing_v6 = [
    for device in local.devices : {
      device_name = device.name
      enable      = try(local.device_config[device.name].segment_routing.srv6.enable, local.defaults.iosxr.devices.configuration.segment_routing.srv6.enable, null)
      encapsulation_hop_limit_option = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, ""))) ? "count" : try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, null),
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, ""))) ? "count" : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, null),
        null
      )
      encapsulation_hop_limit_value = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, ""))) ? tonumber(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit) : try(local.device_config[device.name].segment_routing.srv6.encapsulation.hop_limit, null) != null ? 0 : null,
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, ""))) ? tonumber(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit) : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.hop_limit, null) != null ? 0 : null,
        null
      )
      encapsulation_source_address = try(local.device_config[device.name].segment_routing.srv6.encapsulation.source_address, local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.source_address, null)
      encapsulation_traffic_class_option = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, ""))) ? "value" : try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, null),
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, ""))) ? "value" : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, null),
        null
      )
      encapsulation_traffic_class_value = try(
        can(tonumber(try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, ""))) ? tonumber(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class) : try(local.device_config[device.name].segment_routing.srv6.encapsulation.traffic_class, null) != null ? 0 : null,
        can(tonumber(try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, ""))) ? tonumber(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class) : try(local.defaults.iosxr.devices.configuration.segment_routing.srv6.encapsulation.traffic_class, null) != null ? 0 : null,
        null
      )
      logging_locator_status = try(local.device_config[device.name].segment_routing.srv6.logging_locator_status, local.defaults.iosxr.devices.configuration.segment_routing.srv6.logging_locator_status, null)
      sid_holdtime           = try(local.device_config[device.name].segment_routing.srv6.sid_holdtime, local.defaults.iosxr.devices.configuration.segment_routing.srv6.sid_holdtime, null)
      formats = try(length(local.device_config[device.name].segment_routing.srv6.formats) == 0, true) ? null : [
        for format in local.device_config[device.name].segment_routing.srv6.formats : {
          name                                         = try(format.name, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.name, null)
          usid_local_id_block_ranges_lib_start         = try(format.usid_local_id_block_explicit_from, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.usid_local_id_block_explicit_from, null)
          usid_local_id_block_ranges_explict_lib_start = try(format.usid_local_id_block_explicit_to, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.usid_local_id_block_explicit_to, null)
          usid_wide_local_id_block_explicit_range      = try(format.usid_wide_local_id_block_start, local.defaults.iosxr.devices.configuration.segment_routing.srv6.formats.usid_wide_local_id_block_start, null)
        }
      ]
      locators = try(length(local.device_config[device.name].segment_routing.srv6.locators) == 0, true) ? null : [
        for locator in local.device_config[device.name].segment_routing.srv6.locators : {
          name                   = try(locator.name, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.name, null)
          algorithm              = try(locator.algorithm, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.algorithm, null)
          anycast                = try(locator.anycast, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.anycast, null)
          micro_segment_behavior = try(locator.micro_segment_behavior_unode, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.micro_segment_behavior_unode, null) == "psp-usd" ? "unode-psp-usd" : try(locator.micro_segment_behavior_unode, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.micro_segment_behavior_unode, null) == "shift-only" ? "unode-shift-only" : null
          prefix                 = try(locator.prefix, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.prefix, null)
          prefix_length          = try(locator.length, local.defaults.iosxr.devices.configuration.segment_routing.srv6.locators.length, null)
        }
      ]
    } if try(local.device_config[device.name].segment_routing.srv6, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing.srv6, null) != null
  ]
}

resource "iosxr_segment_routing_v6" "segment_routing_v6" {
  for_each                           = { for srv6 in local.segment_routing_v6 : srv6.device_name => srv6 }
  device                             = each.value.device_name
  enable                             = each.value.enable
  encapsulation_hop_limit_option     = each.value.encapsulation_hop_limit_option
  encapsulation_hop_limit_value      = each.value.encapsulation_hop_limit_value
  encapsulation_source_address       = each.value.encapsulation_source_address
  encapsulation_traffic_class_option = each.value.encapsulation_traffic_class_option
  encapsulation_traffic_class_value  = each.value.encapsulation_traffic_class_value
  formats                            = each.value.formats
  locators                           = each.value.locators
  logging_locator_status             = each.value.logging_locator_status
  sid_holdtime                       = each.value.sid_holdtime

  lifecycle {
    replace_triggered_by = [terraform_data.segment_routing_v6_replace[each.key]]
  }

  depends_on = [
    iosxr_segment_routing.segment_routing
  ]
}

##### Trigger a replace if the formats or locators change. Cannot modify locators when formats are present. #####

resource "terraform_data" "segment_routing_v6_replace" {
  for_each = { for srv6 in local.segment_routing_v6 : srv6.device_name => srv6 }
  input = sha256(jsonencode({
    formats  = each.value.formats
    locators = each.value.locators
  }))
}

##### Segment Routing TE #####

locals {
  segment_routing_te = flatten([
    for device in local.devices : [
      {
        key                                                  = device.name
        device_name                                          = device.name
        te_latency                                           = try(local.device_config[device.name].segment_routing.traffic_engineering.te_latency, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.te_latency, null)
        max_install_standby_paths                            = try(local.device_config[device.name].segment_routing.traffic_engineering.max_install_standby_paths, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.max_install_standby_paths, null)
        kshortest_paths                                      = try(local.device_config[device.name].segment_routing.traffic_engineering.kshortest_paths, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.kshortest_paths, null)
        maximum_sid_depth                                    = try(local.device_config[device.name].segment_routing.traffic_engineering.maximum_sid_depth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.maximum_sid_depth, null)
        cspf_cache_size                                      = try(local.device_config[device.name].segment_routing.traffic_engineering.cspf_cache_size, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.cspf_cache_size, null)
        separate_next_hop                                    = try(local.device_config[device.name].segment_routing.traffic_engineering.separate_next_hop, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.separate_next_hop, null)
        bfd_timers_session_bringup                           = try(local.device_config[device.name].segment_routing.traffic_engineering.bfd_session_bringup, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.bfd_session_bringup, null)
        binding_sid_rules_dynamic                            = try(local.device_config[device.name].segment_routing.traffic_engineering.binding_sids.dynamic, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.binding_sids.dynamic, null)
        binding_sid_rules_explicit                           = try(local.device_config[device.name].segment_routing.traffic_engineering.binding_sids.explicit, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.binding_sids.explicit, null)
        distribute_link_state                                = try(local.device_config[device.name].segment_routing.traffic_engineering.distribute_link_state.enable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.distribute_link_state.enable, null)
        distribute_link_state_throttle                       = try(local.device_config[device.name].segment_routing.traffic_engineering.distribute_link_state.throttle, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.distribute_link_state.throttle, null)
        distribute_link_state_report_candidate_path_inactive = try(local.device_config[device.name].segment_routing.traffic_engineering.distribute_link_state.report_candidate_path_inactive, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.distribute_link_state.report_candidate_path_inactive, null)
        logging_pcep_peer_status                             = try(local.device_config[device.name].segment_routing.traffic_engineering.logging.pcep_peer_status, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.logging.pcep_peer_status, null)
        logging_policy_status                                = try(local.device_config[device.name].segment_routing.traffic_engineering.logging.policy_status, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.logging.policy_status, null)
        steering_labeled_services_disable_all_policies       = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_all, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_all, null)
        steering_labeled_services_disable_bgp_sr_te_policies = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_bgp_sr_te, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_bgp_sr_te, null)
        steering_labeled_services_disable_local_policies     = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_local, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_local, null)
        steering_labeled_services_disable_on_demand_policies = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_on_demand, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_on_demand, null)
        steering_labeled_services_disable_pcep_policies      = try(local.device_config[device.name].segment_routing.traffic_engineering.steering.labeled_services.disable_pcep, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.steering.labeled_services.disable_pcep, null)
        timers_candidate_path_cleanup_delay                  = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.candidate_path_cleanup_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.candidate_path_cleanup_delay, null)
        timers_cleanup_delay                                 = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.cleanup_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.cleanup_delay, null)
        timers_delete_delay                                  = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.delete_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.delete_delay, null)
        timers_initial_verify_restart                        = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.initial_verify_restart, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.initial_verify_restart, null)
        timers_initial_verify_startup                        = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.initial_verify_startup, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.initial_verify_startup, null)
        timers_initial_verify_switchover                     = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.initial_verify_switchover, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.initial_verify_switchover, null)
        timers_install_delay                                 = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.install_delay, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.install_delay, null)
        timers_periodic_reoptimization                       = try(local.device_config[device.name].segment_routing.traffic_engineering.timers.periodic_reoptimization, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.timers.periodic_reoptimization, null)
        pcc_dead_timer                                       = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.dead_timer, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.dead_timer, null)
        pcc_delegation_timeout                               = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.delegation_timeout, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.delegation_timeout, null)
        pcc_initiated_orphan                                 = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.initiated_orphan, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.initiated_orphan, null)
        pcc_initiated_state                                  = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.initiated_state, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.initiated_state, null)
        pcc_keepalive_timer                                  = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.keepalive_timer, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.keepalive_timer, null)
        pcc_redundancy_pcc_centric                           = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.redundancy, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.redundancy, null) == "pcc_centric" ? true : null
        pcc_redundancy_pce_centric                           = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.redundancy, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.redundancy, null) == "pce_centric" ? true : null
        pcc_report_all                                       = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.report_all, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.report_all, null)
        pcc_source_address_ipv4                              = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.source_address_ipv4, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.source_address_ipv4, null)
        pcc_source_address_ipv6                              = try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.source_address_ipv6, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.source_address_ipv6, null)
        path_disable_algo_checks_strict_spf_all_areas        = try(local.device_config[device.name].segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.all_areas, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.all_areas, null)
        srv6_locator                                         = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.locator, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.locator, null)
        srv6_locator_behavior                                = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.behavior, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.behavior, null)
        srv6_locator_binding_sid_type                        = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.binding_sid_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.binding_sid_type, try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.locator, null) != null ? "srv6-dynamic" : null)
        srv6_maximum_sid_depth                               = try(local.device_config[device.name].segment_routing.traffic_engineering.srv6.maximum_sid_depth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.srv6.maximum_sid_depth, null)
        segment_lists_srv6_sid_format                        = try(lookup(local.srv6_sid_format_map, try(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), lookup(local.srv6_sid_format_map, try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), null) != "" ? try(lookup(local.srv6_sid_format_map, try(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), lookup(local.srv6_sid_format_map, try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.sid_format, ""), ""), null) : null
        segment_lists_srv6_topology_check                    = try(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.topology_check, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.topology_check, null)
        affinity_maps = try(length(local.device_config[device.name].segment_routing.traffic_engineering.affinity_maps) == 0, true) ? null : [
          for am in local.device_config[device.name].segment_routing.traffic_engineering.affinity_maps : {
            affinity_name = try(am.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.affinity_maps.name, null)
            bit_position  = try(am.bit_position, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.affinity_maps.bit_position, null)
          }
        ]
        candidate_paths = try(length(local.device_config[device.name].segment_routing.traffic_engineering.candidate_paths) == 0, true) ? null : [
          for cp in local.device_config[device.name].segment_routing.traffic_engineering.candidate_paths : {
            path_type                = format("candidate-path-type-%s", try(cp.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.candidate_paths.type, null))
            source_address           = try(cp.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.candidate_paths.source_address, null)
            source_address_selection = true
            source_address_type      = can(regex(":", try(cp.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.candidate_paths.source_address, ""))) ? "end-point-type-ipv6" : "end-point-type-ipv4"
          }
        ]
        effective_metric_admin_distance_metric_types = try(length(local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.admin_distances) == 0, true) ? null : [
          for mt in local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.admin_distances : {
            metric_type    = lookup(local.metric_type_map, try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.admin_distances.type, ""), try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.admin_distances.type, null))
            admin_distance = try(mt.distance, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.admin_distances.distance, null)
          }
        ]
        effective_metric_admin_distance_flex_algo_metric_types = try(length(local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.flex_algos) == 0, true) ? null : [
          for mt in local.device_config[device.name].segment_routing.traffic_engineering.effective_metric.flex_algos : {
            metric_type    = tonumber(lookup(local.flex_algo_metric_type_map, tostring(try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.flex_algos.type, null)), tostring(try(mt.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.flex_algos.type, null))))
            admin_distance = try(mt.distance, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.effective_metric.flex_algos.distance, null)
          }
        ]
        interfaces = try(length(local.device_config[device.name].segment_routing.traffic_engineering.interfaces) == 0, true) ? null : [
          for iface in local.device_config[device.name].segment_routing.traffic_engineering.interfaces : {
            interface_name = try(iface.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.interfaces.name, null)
            metric         = try(iface.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.interfaces.metric, null)
            affinities = try(length(iface.affinities) == 0, true) ? null : [
              for aff in iface.affinities : {
                affinity_name = try(aff.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.interfaces.affinities.name, null)
              }
            ]
          }
        ]
        path_disable_algo_checks_strict_spf_areas = try(length(local.device_config[device.name].segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas) == 0, true) ? null : [
          for area in local.device_config[device.name].segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas : {
            area_id  = try(area.id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas.id, null)
            protocol = try(area.protocol, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.path_disable_algo_checks.strict_spf.areas.protocol, null)
          }
        ]
        pcc_profiles = try(length(local.device_config[device.name].segment_routing.traffic_engineering.pcc.profiles) == 0, true) ? null : [
          for profile in local.device_config[device.name].segment_routing.traffic_engineering.pcc.profiles : {
            profile_id                       = try(profile.id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.id, null)
            auto_route_force_sr_include      = try(profile.auto_route.force_sr_include, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.force_sr_include, null)
            auto_route_forward_class         = try(profile.auto_route.forward_class, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.forward_class, null)
            auto_route_include_all_ipv4      = try(profile.auto_route.include_all_ipv4, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.include_all_ipv4, null)
            auto_route_include_all_ipv6      = try(profile.auto_route.include_all_ipv6, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.include_all_ipv6, null)
            auto_route_metric_type           = try(profile.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric_type, null)
            auto_route_metric_relative_value = try(profile.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric_type, null) == "relative" ? try(profile.auto_route.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric, null) : null
            auto_route_metric_constant_value = try(profile.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric_type, null) == "constant" ? try(profile.auto_route.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.auto_route.metric, null) : null
            steering_invalidation_drop       = try(profile.steering_invalidation_drop, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.profiles.steering_invalidation_drop, null)
          }
        ]
        pce_peers_ipv4 = try(length([
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pces, []) :
          peer if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.address, ""))) == false
          ]) == 0, true) ? null : [
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pces, []) : {
            pce_address                = try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.address, null)
            password_encrypted         = try(peer.password, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.password, null)
            pce_group                  = try(peer.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.pce_group, null)
            precedence                 = try(peer.precedence, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.precedence, null)
            tcp_ao_include_tcp_options = try(peer.tcp_ao_include_tcp_options, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.tcp_ao_include_tcp_options, null)
            tcp_ao_keychain            = try(peer.tcp_ao_keychain, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.tcp_ao_keychain, null)
          } if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.address, ""))) == false
        ]
        pce_peers_ipv6 = try(length([
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pces, []) :
          peer if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.address, ""))) == true
          ]) == 0, true) ? null : [
          for peer in try(local.device_config[device.name].segment_routing.traffic_engineering.pcc.pces, []) : {
            pce_address                = try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.address, null)
            password_encrypted         = try(peer.password, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.password, null)
            pce_group                  = try(peer.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.pce_group, null)
            precedence                 = try(peer.precedence, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.precedence, null)
            tcp_ao_include_tcp_options = try(peer.tcp_ao_include_tcp_options, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.tcp_ao_include_tcp_options, null)
            tcp_ao_keychain            = try(peer.tcp_ao_keychain, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.tcp_ao_keychain, null)
          } if can(regex(":", try(peer.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.pcc.pces.address, ""))) == true
        ]
        resource_lists = try(length(local.device_config[device.name].segment_routing.traffic_engineering.resource_lists) == 0, true) ? null : [
          for rl in local.device_config[device.name].segment_routing.traffic_engineering.resource_lists : {
            path_name = try(rl.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.name, null)
            resources = try(length(rl.entries) == 0, true) ? null : [
              for res in rl.entries : {
                index   = try(res.index, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.entries.index, null)
                type    = try(res.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.entries.type, "ipv4-address")
                address = try(res.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.resource_lists.entries.address, null)
              }
            ]
          }
        ]
        segment_lists_sr_mpls_explicit_segments = try(length(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments) == 0, true) ? null : [
          for sl in local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments : {
            path_name = try(sl.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.name, null)
            sr_mpls_segments = try(length(sl.entries) == 0, true) ? null : [
              for seg in sl.entries : {
                index                = try(seg.index, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.index, null)
                type                 = try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null) == "label" ? "mpls-label" : try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null) == "adjacency" ? "ip-adjacency-address" : try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null)
                address              = try(seg.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.address, null)
                mpls_label           = try(seg.label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.label, null)
                address_type         = try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.type, null) == "adjacency" ? (can(regex(":", try(seg.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.address, ""))) ? 10 : 2) : null
                interface_identifier = try(seg.interface_identifier, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.mpls.explicit_segments.entries.interface_identifier, null)
              }
            ]
          }
        ]
        segment_lists_srv6_explicit_segments = try(length(local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments) == 0, true) ? null : [
          for sl in local.device_config[device.name].segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments : {
            path_name           = try(sl.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.name, null)
            srv6_topology_check = try(sl.topology_check, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.topology_check, null)
            srv6_segments = try(length(sl.entries) == 0, true) ? null : [
              for seg in sl.entries : {
                index    = try(seg.index, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.entries.index, null)
                address  = try(seg.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.entries.address, null)
                hop_type = try(seg.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.segment_lists.srv6.explicit_segments.entries.type, "srv6sid")
              }
            ]
          }
        ]
        traces = try(length(local.device_config[device.name].segment_routing.traffic_engineering.traces) == 0, true) ? null : [
          for trace in local.device_config[device.name].segment_routing.traffic_engineering.traces : {
            buffer_name = try(trace.buffer, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.traces.buffer, null)
            trace_count = try(trace.count, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.traces.count, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].segment_routing.traffic_engineering, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering, null) != null
  ])
}

resource "iosxr_segment_routing_te" "segment_routing_te" {
  for_each                                               = { for sr_te in local.segment_routing_te : sr_te.key => sr_te }
  device                                                 = each.value.device_name
  affinity_maps                                          = each.value.affinity_maps
  bfd_timers_session_bringup                             = each.value.bfd_timers_session_bringup
  binding_sid_rules_dynamic                              = each.value.binding_sid_rules_dynamic
  binding_sid_rules_explicit                             = each.value.binding_sid_rules_explicit
  candidate_paths                                        = each.value.candidate_paths
  cspf_cache_size                                        = each.value.cspf_cache_size
  distribute_link_state                                  = each.value.distribute_link_state
  distribute_link_state_report_candidate_path_inactive   = each.value.distribute_link_state_report_candidate_path_inactive
  distribute_link_state_throttle                         = each.value.distribute_link_state_throttle
  effective_metric_admin_distance_flex_algo_metric_types = each.value.effective_metric_admin_distance_flex_algo_metric_types
  effective_metric_admin_distance_metric_types           = each.value.effective_metric_admin_distance_metric_types
  interfaces                                             = each.value.interfaces
  kshortest_paths                                        = each.value.kshortest_paths
  logging_pcep_peer_status                               = each.value.logging_pcep_peer_status
  logging_policy_status                                  = each.value.logging_policy_status
  max_install_standby_paths                              = each.value.max_install_standby_paths
  maximum_sid_depth                                      = each.value.maximum_sid_depth
  path_disable_algo_checks_strict_spf_all_areas          = each.value.path_disable_algo_checks_strict_spf_all_areas
  path_disable_algo_checks_strict_spf_areas              = each.value.path_disable_algo_checks_strict_spf_areas
  pcc_dead_timer                                         = each.value.pcc_dead_timer
  pcc_delegation_timeout                                 = each.value.pcc_delegation_timeout
  pcc_initiated_orphan                                   = each.value.pcc_initiated_orphan
  pcc_initiated_state                                    = each.value.pcc_initiated_state
  pcc_keepalive_timer                                    = each.value.pcc_keepalive_timer
  pcc_profiles                                           = each.value.pcc_profiles
  pcc_redundancy_pcc_centric                             = each.value.pcc_redundancy_pcc_centric
  pcc_redundancy_pce_centric                             = each.value.pcc_redundancy_pce_centric
  pcc_report_all                                         = each.value.pcc_report_all
  pcc_source_address_ipv4                                = each.value.pcc_source_address_ipv4
  pcc_source_address_ipv6                                = each.value.pcc_source_address_ipv6
  pce_peers_ipv4                                         = each.value.pce_peers_ipv4
  pce_peers_ipv6                                         = each.value.pce_peers_ipv6
  resource_lists                                         = each.value.resource_lists
  segment_lists_sr_mpls_explicit_segments                = each.value.segment_lists_sr_mpls_explicit_segments
  segment_lists_srv6_explicit_segments                   = each.value.segment_lists_srv6_explicit_segments
  segment_lists_srv6_sid_format                          = each.value.segment_lists_srv6_sid_format
  segment_lists_srv6_topology_check                      = each.value.segment_lists_srv6_topology_check
  separate_next_hop                                      = each.value.separate_next_hop
  srv6_locator                                           = each.value.srv6_locator
  srv6_locator_behavior                                  = each.value.srv6_locator_behavior
  srv6_locator_binding_sid_type                          = each.value.srv6_locator_binding_sid_type
  srv6_maximum_sid_depth                                 = each.value.srv6_maximum_sid_depth
  steering_labeled_services_disable_all_policies         = each.value.steering_labeled_services_disable_all_policies
  steering_labeled_services_disable_bgp_sr_te_policies   = each.value.steering_labeled_services_disable_bgp_sr_te_policies
  steering_labeled_services_disable_local_policies       = each.value.steering_labeled_services_disable_local_policies
  steering_labeled_services_disable_on_demand_policies   = each.value.steering_labeled_services_disable_on_demand_policies
  steering_labeled_services_disable_pcep_policies        = each.value.steering_labeled_services_disable_pcep_policies
  te_latency                                             = each.value.te_latency
  timers_candidate_path_cleanup_delay                    = each.value.timers_candidate_path_cleanup_delay
  timers_cleanup_delay                                   = each.value.timers_cleanup_delay
  timers_delete_delay                                    = each.value.timers_delete_delay
  timers_initial_verify_restart                          = each.value.timers_initial_verify_restart
  timers_initial_verify_startup                          = each.value.timers_initial_verify_startup
  timers_initial_verify_switchover                       = each.value.timers_initial_verify_switchover
  timers_install_delay                                   = each.value.timers_install_delay
  timers_periodic_reoptimization                         = each.value.timers_periodic_reoptimization
  traces                                                 = each.value.traces

  depends_on = [
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    iosxr_key_chain.key_chain
  ]
}

##### Segment Routing TE On Demand Color #####

locals {
  segment_routing_te_on_demand_color = flatten([
    for device in local.devices : [
      for on_demand in try(local.device_config[device.name].segment_routing.traffic_engineering.on_demand, []) : {
        key                                    = format("%s/%s", device.name, on_demand.color)
        device_name                            = device.name
        color                                  = try(on_demand.color, null)
        bandwidth                              = try(on_demand.bandwidth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bandwidth, null)
        maximum_sid_depth                      = try(on_demand.maximum_sid_depth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.maximum_sid_depth, null)
        max_install_standby_paths              = try(on_demand.max_install_standby_paths, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.max_install_standby_paths, null)
        pce_group                              = try(on_demand.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.pce_group, null)
        source_address                         = try(on_demand.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.source_address, null)
        source_address_type                    = try(on_demand.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.source_address, null) != null ? (can(regex(":", try(on_demand.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.source_address, ""))) ? "end-point-type-ipv6" : "end-point-type-ipv4") : null
        dynamic_anycast_sid_inclusion          = try(on_demand.dynamic.anycast_sid_inclusion, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.anycast_sid_inclusion, null)
        dynamic_metric_type                    = try(on_demand.dynamic.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.metric_type, null)
        dynamic_metric_margin_type             = try(on_demand.dynamic.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.metric_margin_type, null)
        dynamic_metric_margin_absolute         = try(on_demand.dynamic.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.metric_margin_type, null) == "absolute" ? try(on_demand.dynamic.metric_margin, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.metric_margin, null) : null
        dynamic_metric_margin_relative         = try(on_demand.dynamic.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.metric_margin_type, null) == "relative" ? try(on_demand.dynamic.metric_margin, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.metric_margin, null) : null
        dynamic_pcep                           = try(on_demand.dynamic.pcep, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.pcep, null)
        dynamic_disjoint_path_group_id         = try(on_demand.dynamic.disjoint_path.group_id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.disjoint_path.group_id, null)
        dynamic_disjoint_path_type             = try(on_demand.dynamic.disjoint_path.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.disjoint_path.type, null)
        dynamic_disjoint_path_sub_id           = try(on_demand.dynamic.disjoint_path.sub_id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.disjoint_path.sub_id, null)
        dynamic_disjoint_path_shortest_path    = try(on_demand.dynamic.disjoint_path.shortest_path, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.disjoint_path.shortest_path, null)
        dynamic_disjoint_path_fallback_disable = try(on_demand.dynamic.disjoint_path.fallback_disable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.disjoint_path.fallback_disable, null)
        dynamic_affinity_rules = try(length(on_demand.dynamic.affinities) == 0, true) ? null : [
          for aff in on_demand.dynamic.affinities : {
            affinity_type = format("affinity-%s", try(aff.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.affinities.type, null))
            affinities = try(length(aff.entries) == 0, true) ? null : [
              for entry in aff.entries : {
                affinity_name = try(entry.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.affinities.entries.name, null)
              }
            ]
          }
        ]
        dynamic_bounds = try(length(on_demand.dynamic.bounds) == 0, true) ? null : [
          for bound in on_demand.dynamic.bounds : {
            type        = format("bound-scope-%s", try(bound.scope, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.bounds.scope, null))
            metric_type = try(bound.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.bounds.type, null)
            value       = try(bound.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.dynamic.bounds.metric, null)
          }
        ]
        constraint_segments_protection_type = try(on_demand.constraints.segments.protection_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.constraints.segments.protection_type, null)
        constraint_segments_sid_algorithm   = try(on_demand.constraints.segments.sid_algorithm, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.constraints.segments.sid_algorithm, null)
        effective_metric_type               = try(on_demand.effective_metric.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.effective_metric.type, null)
        effective_metric_value              = try(on_demand.effective_metric.value, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.effective_metric.value, null)
        bfd_enable                          = try(on_demand.bfd.enable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.enable, null)
        bfd_disable                         = null
        bfd_multiplier                      = try(on_demand.bfd.multiplier, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.multiplier, null)
        bfd_minimum_interval                = try(on_demand.bfd.minimum_interval, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.minimum_interval, null)
        bfd_invalidation_action             = try(on_demand.bfd.invalidation_action, null) != null ? format("invalid-ation-action-%s", on_demand.bfd.invalidation_action) : try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.invalidation_action, null) != null ? format("invalid-ation-action-%s", local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.invalidation_action) : null
        bfd_reverse_path_binding_label      = try(on_demand.bfd.reverse_path_binding_label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.reverse_path_binding_label, null)
        bfd_logging_session_state_change    = try(on_demand.bfd.logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.bfd.logging_session_state_change, null)
        steering_labeled_services_disable   = try(on_demand.steering.labeled_services.disable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.steering.labeled_services.disable, null)
        steering_invalidation_drop          = try(on_demand.steering.invalidation_drop, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.steering.invalidation_drop, null)
        per_flow                            = try(on_demand.per_flow.enable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.per_flow.enable, try(on_demand.per_flow, null) != null ? true : null)
        per_flow_forward_class_default      = try(on_demand.per_flow.default_class, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.per_flow.default_class, null)
        per_flow_forward_classes = try(length(on_demand.per_flow.forward_classes) == 0, true) ? null : [
          for fc in on_demand.per_flow.forward_classes : {
            forward_class = try(fc.id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.per_flow.forward_classes.id, null)
            color         = try(fc.color, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.per_flow.forward_classes.color, null)
          }
        ]
        performance_measurement_delay_profile                         = try(on_demand.performance_measurement.delay.profile, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.delay.profile, null)
        performance_measurement_delay_logging_delay_exceeded          = try(on_demand.performance_measurement.delay.logging_delay_exceeded, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.delay.logging_delay_exceeded, null)
        performance_measurement_liveness_profile                      = try(on_demand.performance_measurement.liveness.profile, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.liveness.profile, null)
        performance_measurement_liveness_backup_profile               = try(on_demand.performance_measurement.liveness.backup_profile, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.liveness.backup_profile, null)
        performance_measurement_liveness_logging_session_state_change = try(on_demand.performance_measurement.liveness.logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.liveness.logging_session_state_change, null)
        performance_measurement_liveness_invalidation_action          = try(on_demand.performance_measurement.liveness.invalidation_action, null) != null ? format("invalid-ation-action-%s", on_demand.performance_measurement.liveness.invalidation_action) : try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.liveness.invalidation_action, null) != null ? format("invalid-ation-action-%s", local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.liveness.invalidation_action) : null
        performance_measurement_reverse_path_segment_list             = try(on_demand.performance_measurement.reverse_path_segment_list, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.reverse_path_segment_list, null)
        performance_measurement_reverse_path_label                    = try(on_demand.performance_measurement.reverse_path_label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.performance_measurement.reverse_path_label, null)
        srv6_locator_name                                             = try(on_demand.srv6.locator, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.srv6.locator, null)
        srv6_locator_binding_sid_type                                 = try(on_demand.srv6.locator, null) != null ? "srv6-dynamic" : null
        srv6_locator_behavior                                         = try(on_demand.srv6.behavior, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.on_demand.srv6.behavior, null)
      }
    ] if try(local.device_config[device.name].segment_routing.traffic_engineering.on_demand, null) != null
  ])
}

resource "iosxr_segment_routing_te_on_demand_color" "segment_routing_te_on_demand_color" {
  for_each                                                      = { for odn in local.segment_routing_te_on_demand_color : odn.key => odn }
  device                                                        = each.value.device_name
  color                                                         = each.value.color
  bandwidth                                                     = each.value.bandwidth
  bfd_disable                                                   = each.value.bfd_disable
  bfd_enable                                                    = each.value.bfd_enable
  bfd_invalidation_action                                       = each.value.bfd_invalidation_action
  bfd_logging_session_state_change                              = each.value.bfd_logging_session_state_change
  bfd_minimum_interval                                          = each.value.bfd_minimum_interval
  bfd_multiplier                                                = each.value.bfd_multiplier
  bfd_reverse_path_binding_label                                = each.value.bfd_reverse_path_binding_label
  constraint_segments_protection_type                           = each.value.constraint_segments_protection_type
  constraint_segments_sid_algorithm                             = each.value.constraint_segments_sid_algorithm
  dynamic_affinity_rules                                        = each.value.dynamic_affinity_rules
  dynamic_anycast_sid_inclusion                                 = each.value.dynamic_anycast_sid_inclusion
  dynamic_bounds                                                = each.value.dynamic_bounds
  dynamic_disjoint_path_fallback_disable                        = each.value.dynamic_disjoint_path_fallback_disable
  dynamic_disjoint_path_group_id                                = each.value.dynamic_disjoint_path_group_id
  dynamic_disjoint_path_shortest_path                           = each.value.dynamic_disjoint_path_shortest_path
  dynamic_disjoint_path_sub_id                                  = each.value.dynamic_disjoint_path_sub_id
  dynamic_disjoint_path_type                                    = each.value.dynamic_disjoint_path_type
  dynamic_metric_margin_absolute                                = each.value.dynamic_metric_margin_absolute
  dynamic_metric_margin_relative                                = each.value.dynamic_metric_margin_relative
  dynamic_metric_margin_type                                    = each.value.dynamic_metric_margin_type
  dynamic_metric_type                                           = each.value.dynamic_metric_type
  dynamic_pcep                                                  = each.value.dynamic_pcep
  effective_metric_type                                         = each.value.effective_metric_type
  effective_metric_value                                        = each.value.effective_metric_value
  max_install_standby_paths                                     = each.value.max_install_standby_paths
  maximum_sid_depth                                             = each.value.maximum_sid_depth
  pce_group                                                     = each.value.pce_group
  per_flow                                                      = each.value.per_flow
  per_flow_forward_class_default                                = each.value.per_flow_forward_class_default
  per_flow_forward_classes                                      = each.value.per_flow_forward_classes
  performance_measurement_delay_logging_delay_exceeded          = each.value.performance_measurement_delay_logging_delay_exceeded
  performance_measurement_delay_profile                         = each.value.performance_measurement_delay_profile
  performance_measurement_liveness_backup_profile               = each.value.performance_measurement_liveness_backup_profile
  performance_measurement_liveness_invalidation_action          = each.value.performance_measurement_liveness_invalidation_action
  performance_measurement_liveness_logging_session_state_change = each.value.performance_measurement_liveness_logging_session_state_change
  performance_measurement_liveness_profile                      = each.value.performance_measurement_liveness_profile
  performance_measurement_reverse_path_label                    = each.value.performance_measurement_reverse_path_label
  performance_measurement_reverse_path_segment_list             = each.value.performance_measurement_reverse_path_segment_list
  source_address                                                = each.value.source_address
  source_address_type                                           = each.value.source_address_type
  srv6_locator_behavior                                         = each.value.srv6_locator_behavior
  srv6_locator_binding_sid_type                                 = each.value.srv6_locator_binding_sid_type
  srv6_locator_name                                             = each.value.srv6_locator_name
  steering_invalidation_drop                                    = each.value.steering_invalidation_drop
  steering_labeled_services_disable                             = each.value.steering_labeled_services_disable

  depends_on = [
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    iosxr_segment_routing_te.segment_routing_te
  ]
}

##### Segment Routing TE Policy #####

locals {
  segment_routing_te_policies = flatten([
    for device in local.devices : [
      for policy in try(local.device_config[device.name].segment_routing.traffic_engineering.policies, []) : {
        key                                                           = format("%s/%s", device.name, policy.name)
        device_name                                                   = device.name
        policy_name                                                   = try(policy.name, null)
        policy_color                                                  = try(policy.color, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.color, null)
        policy_color_endpoint_address                                 = try(policy.endpoint_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.endpoint_address, null)
        policy_color_endpoint_type                                    = try(policy.endpoint_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.endpoint_address, null) != null ? (can(regex(":", try(policy.endpoint_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.endpoint_address, ""))) ? "end-point-type-ipv6" : "end-point-type-ipv4") : null
        ipv6_disable                                                  = try(policy.ipv6_disable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.ipv6_disable, null)
        transit_eligible                                              = try(policy.transit_eligible, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.transit_eligible, null)
        shutdown                                                      = try(policy.shutdown, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.shutdown, null)
        bandwidth                                                     = try(policy.bandwidth, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bandwidth, null)
        max_install_standby_paths                                     = try(policy.max_install_standby_paths, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.max_install_standby_paths, null)
        pce_group                                                     = try(policy.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.pce_group, null)
        binding_sid_type                                              = try(policy.binding_sid_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.binding_sid_type, null) == "mpls" ? "mpls-label-specified" : null
        binding_sid_mpls_label                                        = try(policy.binding_sid_mpls_label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.binding_sid_mpls_label, null)
        path_protection                                               = try(policy.path_protection, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.path_protection, null)
        source_address                                                = try(policy.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.source_address, null)
        source_address_type                                           = try(policy.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.source_address, null) != null ? (can(regex(":", try(policy.source_address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.source_address, ""))) ? "end-point-type-ipv6" : "end-point-type-ipv4") : null
        effective_metric_type                                         = try(policy.effective_metric.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.effective_metric.type, null)
        effective_metric_value                                        = try(policy.effective_metric.value, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.effective_metric.value, null)
        auto_route_force_sr_include                                   = try(policy.auto_route.force_sr_include, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.force_sr_include, null)
        auto_route_forward_class                                      = try(policy.auto_route.forward_class, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.forward_class, null)
        auto_route_include_all_ipv4                                   = try(policy.auto_route.include_all_ipv4, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.include_all_ipv4, null)
        auto_route_include_all_ipv6                                   = try(policy.auto_route.include_all_ipv6, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.include_all_ipv6, null)
        auto_route_metric_type                                        = try(policy.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.metric_type, null)
        auto_route_metric_constant_value                              = try(policy.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.metric_type, null) == "constant" ? try(policy.auto_route.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.metric, null) : null
        auto_route_metric_relative_value                              = try(policy.auto_route.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.metric_type, null) == "relative" ? try(policy.auto_route.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.metric, null) : null
        bfd_enable                                                    = try(policy.bfd.enable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.enable, null)
        bfd_disable                                                   = try(policy.bfd.disable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.disable, null)
        bfd_multiplier                                                = try(policy.bfd.multiplier, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.multiplier, null)
        bfd_minimum_interval                                          = try(policy.bfd.minimum_interval, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.minimum_interval, null)
        bfd_invalidation_action                                       = try(policy.bfd.invalidation_action, null) != null ? format("invalid-ation-action-%s", policy.bfd.invalidation_action) : try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.invalidation_action, null) != null ? format("invalid-ation-action-%s", local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.invalidation_action) : null
        bfd_reverse_path_binding_label                                = try(policy.bfd.reverse_path_binding_label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.reverse_path_binding_label, null)
        bfd_logging_session_state_change                              = try(policy.bfd.logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.bfd.logging_session_state_change, null)
        steering_invalidation_drop                                    = try(policy.steering.invalidation_drop, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.steering.invalidation_drop, null)
        steering_labeled_services_disable                             = try(policy.steering.labeled_services.disable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.steering.labeled_services.disable, null)
        performance_measurement_delay_profile                         = try(policy.performance_measurement.delay.profile, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.delay.profile, null)
        performance_measurement_delay_logging_delay_exceeded          = try(policy.performance_measurement.delay.logging_delay_exceeded, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.delay.logging_delay_exceeded, null)
        performance_measurement_liveness_profile                      = try(policy.performance_measurement.liveness.profile, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.liveness.profile, null)
        performance_measurement_liveness_backup_profile               = try(policy.performance_measurement.liveness.backup_profile, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.liveness.backup_profile, null)
        performance_measurement_liveness_logging_session_state_change = try(policy.performance_measurement.liveness.logging_session_state_change, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.liveness.logging_session_state_change, null)
        performance_measurement_liveness_invalidation_action          = try(policy.performance_measurement.liveness.invalidation_action, null) != null ? format("invalid-ation-action-%s", policy.performance_measurement.liveness.invalidation_action) : try(local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.liveness.invalidation_action, null) != null ? format("invalid-ation-action-%s", local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.liveness.invalidation_action) : null
        performance_measurement_reverse_path_segment_list             = try(policy.performance_measurement.reverse_path_segment_list, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.reverse_path_segment_list, null)
        performance_measurement_reverse_path_label                    = try(policy.performance_measurement.reverse_path_label, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.performance_measurement.reverse_path_label, null)
        srv6_locator_name                                             = try(policy.srv6.locator, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.srv6.locator, null)
        srv6_locator_binding_sid_type                                 = try(policy.srv6.locator, null) != null ? "srv6-dynamic" : null
        srv6_locator_behavior                                         = try(policy.srv6.behavior, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.srv6.behavior, null)
        auto_route_include_prefixes = try(length(policy.auto_route.include_prefixes) == 0, true) ? null : [
          for prefix in policy.auto_route.include_prefixes : {
            af_type = format("af-type-%s", try(prefix.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.include_prefixes.type, null))
            address = try(prefix.address, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.include_prefixes.address, null)
            length  = try(prefix.length, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.auto_route.include_prefixes.length, null)
          }
        ]
        candidate_paths_preferences = try(length(policy.candidate_paths) == 0, true) ? null : [
          for pref in policy.candidate_paths : {
            path_index                                   = try(pref.preference, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.preference, null)
            lock_duration                                = try(pref.lock_duration, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.lock_duration, null)
            pce_group                                    = try(pref.pce_group, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.pce_group, null)
            backup_ineligible                            = try(pref.backup_ineligible, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.backup_ineligible, null)
            bidirectional_association_id                 = try(pref.bidirectional_association_id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.bidirectional_association_id, null)
            bidirectional_corouted                       = try(pref.bidirectional_corouted, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.bidirectional_corouted, null)
            per_flow                                     = try(pref.per_flow.enable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.per_flow.enable, try(pref.per_flow, null) != null ? true : null)
            per_flow_forward_class_default               = try(pref.per_flow.default_class, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.per_flow.default_class, null)
            effective_metric_type                        = try(pref.effective_metric.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.effective_metric.type, null)
            effective_metric_value                       = try(pref.effective_metric.value, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.effective_metric.value, null)
            constraints_segment_rules_protection_type    = try(pref.constraints.segments.protection_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.segments.protection_type, null)
            constraints_segment_rules_sid_algorithm      = try(pref.constraints.segments.sid_algorithm, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.segments.sid_algorithm, null)
            constraints_segment_rules_adjacency_sid_only = try(pref.constraints.segments.adjacency_sid_only, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.segments.adjacency_sid_only, null)
            constraints_disjoint_path_group_id           = try(pref.constraints.disjoint_path.group_id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.disjoint_path.group_id, null)
            constraints_disjoint_path_type               = try(pref.constraints.disjoint_path.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.disjoint_path.type, null)
            constraints_disjoint_path_sub_id             = try(pref.constraints.disjoint_path.sub_id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.disjoint_path.sub_id, null)
            constraints_disjoint_path_shortest_path      = try(pref.constraints.disjoint_path.shortest_path, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.disjoint_path.shortest_path, null)
            constraints_disjoint_path_fallback_disable   = try(pref.constraints.disjoint_path.fallback_disable, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.disjoint_path.fallback_disable, null)
            per_flow_forward_classes = try(length(pref.per_flow.forward_classes) == 0, true) ? null : [
              for fc in pref.per_flow.forward_classes : {
                forward_class = try(fc.id, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.per_flow.forward_classes.id, null)
                color         = try(fc.color, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.per_flow.forward_classes.color, null)
              }
            ]
            constraints_affinity_rules = try(length(pref.constraints.affinities) == 0, true) ? null : [
              for aff in pref.constraints.affinities : {
                affinity_type = format("affinity-%s", try(aff.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.affinities.type, null))
                affinities = try(length(aff.entries) == 0, true) ? null : [
                  for entry in aff.entries : {
                    affinity_name = try(entry.name, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.affinities.entries.name, null)
                  }
                ]
              }
            ]
            constraints_bounds = try(length(pref.constraints.bounds) == 0, true) ? null : [
              for bound in pref.constraints.bounds : {
                type        = format("bound-scope-%s", try(bound.scope, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.bounds.scope, null))
                metric_type = try(bound.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.bounds.type, null)
                value       = try(bound.metric, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.constraints.bounds.metric, null)
              }
            ]
            paths = try(length(pref.paths) == 0, true) ? null : [
              for path in pref.paths : {
                type                      = try(path.type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.type, null)
                hop_type                  = try(path.hop_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.hop_type, "mpls")
                segment_list_name         = try(path.type, null) == "dynamic" ? try(path.segment_list, "dynamic") : try(path.segment_list, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.segment_list, null)
                weight                    = try(path.weight, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.weight, null)
                metric_type               = try(path.metric_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_type, null)
                metric_sid_limit          = try(path.metric_sid_limit, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_sid_limit, null)
                metric_margin_type        = try(path.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_margin_type, null)
                metric_margin_absolute    = try(path.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_margin_type, null) == "absolute" ? try(path.metric_margin, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_margin, null) : null
                metric_margin_relative    = try(path.metric_margin_type, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_margin_type, null) == "relative" ? try(path.metric_margin, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.metric_margin, null) : null
                anycast                   = try(path.anycast_sid_inclusion, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.anycast_sid_inclusion, null)
                pcep                      = try(path.pcep, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.pcep, null)
                reverse_path_segment_list = try(path.reverse_path_segment_list, local.defaults.iosxr.devices.configuration.segment_routing.traffic_engineering.policies.candidate_paths.paths.reverse_path_segment_list, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].segment_routing.traffic_engineering.policies, null) != null
  ])
}

resource "iosxr_segment_routing_te_policy" "segment_routing_te_policy" {
  for_each                                                      = { for policy in local.segment_routing_te_policies : policy.key => policy }
  device                                                        = each.value.device_name
  policy_name                                                   = each.value.policy_name
  auto_route_force_sr_include                                   = each.value.auto_route_force_sr_include
  auto_route_forward_class                                      = each.value.auto_route_forward_class
  auto_route_include_all_ipv4                                   = each.value.auto_route_include_all_ipv4
  auto_route_include_all_ipv6                                   = each.value.auto_route_include_all_ipv6
  auto_route_include_prefixes                                   = each.value.auto_route_include_prefixes
  auto_route_metric_constant_value                              = each.value.auto_route_metric_constant_value
  auto_route_metric_relative_value                              = each.value.auto_route_metric_relative_value
  auto_route_metric_type                                        = each.value.auto_route_metric_type
  bandwidth                                                     = each.value.bandwidth
  bfd_disable                                                   = each.value.bfd_disable
  bfd_enable                                                    = each.value.bfd_enable
  bfd_invalidation_action                                       = each.value.bfd_invalidation_action
  bfd_logging_session_state_change                              = each.value.bfd_logging_session_state_change
  bfd_minimum_interval                                          = each.value.bfd_minimum_interval
  bfd_multiplier                                                = each.value.bfd_multiplier
  bfd_reverse_path_binding_label                                = each.value.bfd_reverse_path_binding_label
  binding_sid_mpls_label                                        = each.value.binding_sid_mpls_label
  binding_sid_type                                              = each.value.binding_sid_type
  candidate_paths_preferences                                   = each.value.candidate_paths_preferences
  effective_metric_type                                         = each.value.effective_metric_type
  effective_metric_value                                        = each.value.effective_metric_value
  ipv6_disable                                                  = each.value.ipv6_disable
  max_install_standby_paths                                     = each.value.max_install_standby_paths
  path_protection                                               = each.value.path_protection
  pce_group                                                     = each.value.pce_group
  performance_measurement_delay_logging_delay_exceeded          = each.value.performance_measurement_delay_logging_delay_exceeded
  performance_measurement_delay_profile                         = each.value.performance_measurement_delay_profile
  performance_measurement_liveness_backup_profile               = each.value.performance_measurement_liveness_backup_profile
  performance_measurement_liveness_invalidation_action          = each.value.performance_measurement_liveness_invalidation_action
  performance_measurement_liveness_logging_session_state_change = each.value.performance_measurement_liveness_logging_session_state_change
  performance_measurement_liveness_profile                      = each.value.performance_measurement_liveness_profile
  performance_measurement_reverse_path_label                    = each.value.performance_measurement_reverse_path_label
  performance_measurement_reverse_path_segment_list             = each.value.performance_measurement_reverse_path_segment_list
  policy_color                                                  = each.value.policy_color
  policy_color_endpoint_address                                 = each.value.policy_color_endpoint_address
  policy_color_endpoint_type                                    = each.value.policy_color_endpoint_type
  shutdown                                                      = each.value.shutdown
  source_address                                                = each.value.source_address
  source_address_type                                           = each.value.source_address_type
  srv6_locator_behavior                                         = each.value.srv6_locator_behavior
  srv6_locator_binding_sid_type                                 = each.value.srv6_locator_binding_sid_type
  srv6_locator_name                                             = each.value.srv6_locator_name
  steering_invalidation_drop                                    = each.value.steering_invalidation_drop
  steering_labeled_services_disable                             = each.value.steering_labeled_services_disable
  transit_eligible                                              = each.value.transit_eligible

  depends_on = [
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6,
    iosxr_segment_routing_te.segment_routing_te
  ]
}
