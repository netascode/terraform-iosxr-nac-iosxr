locals {
  router_isis_address_family = flatten([
    for device in local.devices : [
      for isis_process in try(local.device_config[device.name].routing.isis_processes, []) : [
        for af in try(isis_process.address_family, []) : {
          key                                                           = format("%s/%s/%s/%s", device.name, isis_process.id, af.af_name, af.saf_name)
          device_name                                                   = device.name
          process_id                                                    = try(isis_process.id, local.defaults.iosxr.devices.configuration.routing.isis_processes.id, null)
          af_name                                                       = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.af_name, null)
          saf_name                                                      = try(af.saf_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.saf_name, null)
          advertise_link_attributes                                     = try(af.advertise_link_attributes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.advertise_link_attributes, null)
          advertise_passive_only                                        = try(af.advertise_passive_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.advertise_passive_only, null)
          default_information_originate                                 = try(af.default_information_originate, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.default_information_originate, null)
          fast_reroute_delay_interval                                   = try(af.fast_reroute_delay_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_delay_interval, null)
          fast_reroute_per_link_priority_limit                          = try(af.fast_reroute_per_link_priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_link_priority_limit, null)
          fast_reroute_per_link_use_candidate_only                      = try(af.fast_reroute_per_link_use_candidate_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_link_use_candidate_only, null)
          fast_reroute_per_prefix_load_sharing_disable                  = try(af.fast_reroute_per_prefix_load_sharing_disable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_load_sharing_disable, null)
          fast_reroute_per_prefix_priority_limit                        = try(af.fast_reroute_per_prefix_priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_priority_limit, null)
          fast_reroute_per_prefix_remote_lfa_prefix_list                = try(af.fast_reroute_per_prefix_remote_lfa_prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_remote_lfa_prefix_list, null)
          fast_reroute_per_prefix_srlg_protection_weighted_global       = try(af.fast_reroute_per_prefix_srlg_protection_weighted_global, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_srlg_protection_weighted_global, null)
          fast_reroute_per_prefix_tiebreaker_downstream_index           = try(af.fast_reroute_per_prefix_tiebreaker_downstream_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_downstream_index, null)
          fast_reroute_per_prefix_tiebreaker_lc_disjoint_index          = try(af.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index = try(af.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index, null)
          fast_reroute_per_prefix_tiebreaker_node_protecting_index      = try(af.fast_reroute_per_prefix_tiebreaker_node_protecting_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_node_protecting_index, null)
          fast_reroute_per_prefix_tiebreaker_primary_path_index         = try(af.fast_reroute_per_prefix_tiebreaker_primary_path_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_primary_path_index, null)
          fast_reroute_per_prefix_tiebreaker_secondary_path_index       = try(af.fast_reroute_per_prefix_tiebreaker_secondary_path_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_secondary_path_index, null)
          fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index        = try(af.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index, null)
          fast_reroute_per_prefix_use_candidate_only                    = try(af.fast_reroute_per_prefix_use_candidate_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_use_candidate_only, null)
          maximum_redistributed_prefixes                                = try(af.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.maximum_redistributed_prefixes, null)
          metric_style_narrow                                           = try(af.metric_style_narrow, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_narrow, null)
          metric_style_narrow_transition                                = try(af.metric_style_narrow_transition, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_narrow_transition, null)
          metric_style_transition                                       = try(af.metric_style_transition, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_transition, null)
          metric_style_wide                                             = try(af.metric_style_wide, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_wide, null)
          metric_style_wide_transition                                  = try(af.metric_style_wide_transition, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_wide_transition, null)
          microloop_avoidance                                           = try(af.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.microloop_avoidance, null)
          microloop_avoidance_protected                                 = try(af.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.microloop_avoidance_protected, null)
          microloop_avoidance_rib_update_delay                          = try(af.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.microloop_avoidance_rib_update_delay, null)
          microloop_avoidance_segment_routing_route_policy              = try(af.microloop_avoidance_segment_routing_route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.microloop_avoidance_segment_routing_route_policy, null)
          mpls_ldp_auto_config                                          = try(af.mpls_ldp_auto_config, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.mpls_ldp_auto_config, null)
          mpls_traffic_eng_level_1                                      = try(af.mpls_traffic_eng_level_1, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.mpls_traffic_eng_level_1, null)
          mpls_traffic_eng_level_1_2                                    = try(af.mpls_traffic_eng_level_1_2, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.mpls_traffic_eng_level_1_2, null)
          mpls_traffic_eng_level_2_only                                 = try(af.mpls_traffic_eng_level_2_only, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.mpls_traffic_eng_level_2_only, null)
          mpls_traffic_eng_router_id_interface_name                     = try(af.mpls_traffic_eng_router_id_interface_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.mpls_traffic_eng_router_id_interface_id, null)
          mpls_traffic_eng_router_id_ipv4_address                       = try(af.mpls_traffic_eng_router_id_ipv4_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.mpls_traffic_eng_router_id_ipv4_address, null)
          router_id_interface_name                                      = try(af.router_id_interface_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.router_id_interface_id, null)
          router_id_ip_address                                          = try(af.router_id_ip_address, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.router_id_ip_address, null)
          segment_routing_mpls_enable                                   = try(af.segment_routing_mpls_enable, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_mpls_enable, null)
          segment_routing_mpls_sr_prefer                                = try(af.segment_routing_mpls_sr_prefer, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_mpls_sr_prefer, null)
          spf_interval_ietf                                             = try(af.spf_interval_ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_ietf, null)
          spf_interval_ietf_holddown_interval                           = try(af.spf_interval_ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_ietf_holddown_interval, null)
          spf_interval_ietf_initial_wait                                = try(af.spf_interval_ietf_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_ietf_initial_wait, null)
          spf_interval_ietf_learn_interval                              = try(af.spf_interval_ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_ietf_learn_interval, null)
          spf_interval_ietf_long_wait                                   = try(af.spf_interval_ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_ietf_long_wait, null)
          spf_interval_ietf_short_wait                                  = try(af.spf_interval_ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_ietf_short_wait, null)
          spf_interval_initial_wait                                     = try(af.spf_interval_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_initial_wait, null)
          spf_interval_maximum_wait                                     = try(af.spf_interval_maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_maximum_wait, null)
          spf_interval_secondary_wait                                   = try(af.spf_interval_secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_secondary_wait, null)
          spf_prefix_priority_critical_prefix_list_name                 = try(af.spf_prefix_priority_critical_prefix_list_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_critical_prefix_list_name, null)
          spf_prefix_priority_critical_tag                              = try(af.spf_prefix_priority_critical_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_critical_tag, null)
          spf_prefix_priority_high_prefix_list_name                     = try(af.spf_prefix_priority_high_prefix_list_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_high_prefix_list_name, null)
          spf_prefix_priority_high_tag                                  = try(af.spf_prefix_priority_high_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_high_tag, null)
          spf_prefix_priority_medium_prefix_list_name                   = try(af.spf_prefix_priority_medium_prefix_list_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_medium_prefix_list_name, null)
          spf_prefix_priority_medium_tag                                = try(af.spf_prefix_priority_medium_tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_medium_tag, null)
          fast_reroute_per_link_priority_limit_levels = try(length(af.fast_reroute_per_link_priority_limit_levels) == 0, true) ? null : [for level in af.fast_reroute_per_link_priority_limit_levels : {
            level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_link_priority_limit_levels.level_number, null)
            priority_limit = try(level.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_link_priority_limit_levels.priority_limit, null)
            }
          ]
          fast_reroute_per_prefix_load_sharing_disable_levels = try(length(af.fast_reroute_per_prefix_load_sharing_disable_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix_load_sharing_disable_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_load_sharing_disable_levels.level_number, null)
            }
          ]
          fast_reroute_per_prefix_priority_limit_levels = try(length(af.fast_reroute_per_prefix_priority_limit_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix_priority_limit_levels : {
            level_number   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_priority_limit_levels.level_number, null)
            priority_limit = try(level.priority_limit, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_priority_limit_levels.priority_limit, null)
            }
          ]
          fast_reroute_per_prefix_remote_lfa_prefix_list_levels = try(length(af.fast_reroute_per_prefix_remote_lfa_prefix_list_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix_remote_lfa_prefix_list_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_remote_lfa_prefix_list_levels.level_number, null)
            prefix_list  = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_remote_lfa_prefix_list_levels.prefix_list, null)
            }
          ]
          fast_reroute_per_prefix_srlg_protection_weighted_global_levels = try(length(af.fast_reroute_per_prefix_srlg_protection_weighted_global_levels) == 0, true) ? null : [for level in af.fast_reroute_per_prefix_srlg_protection_weighted_global_levels : {
            level_number = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.fast_reroute_per_prefix_srlg_protection_weighted_global_levels.level_number, null)
            }
          ]
          maximum_redistributed_prefixes_levels = try(length(af.maximum_redistributed_prefixes_levels) == 0, true) ? null : [for level in af.maximum_redistributed_prefixes_levels : {
            level_number                   = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.maximum_redistributed_prefixes_levels.level_number, null)
            maximum_redistributed_prefixes = try(level.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.maximum_redistributed_prefixes_levels.maximum_redistributed_prefixes, null)
            }
          ]
          metric_style_levels = try(length(af.metric_style_levels) == 0, true) ? null : [for level in af.metric_style_levels : {
            level_number      = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_levels.level_number, null)
            narrow            = try(level.narrow, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_levels.narrow, null)
            narrow_transition = try(level.narrow_transition, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_levels.narrow_transition, null)
            transition        = try(level.transition, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_levels.transition, null)
            wide              = try(level.wide, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_levels.wide, null)
            wide_transition   = try(level.wide_transition, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.metric_style_levels.wide_transition, null)
            }
          ]
          redistribute_isis = try(length(af.redistribute_isis) == 0, true) ? null : [for redis in af.redistribute_isis : {
            instance_id     = try(redis.instance_id, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.redistribute_isis.instance_id, null)
            down_flag_clear = try(redis.down_flag_clear, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.redistribute_isis.down_flag_clear, null)
            level           = try(redis.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.redistribute_isis.level, null)
            metric          = try(redis.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.redistribute_isis.metric, null)
            metric_type     = try(redis.metric_type, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.redistribute_isis.metric_type, null)
            route_policy    = try(redis.route_policy, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.redistribute_isis.route_policy, null)
            }
          ]
          segment_routing_srv6_locators = try(length(af.segment_routing_srv6_locators) == 0, true) ? null : [for locator in af.segment_routing_srv6_locators : {
            locator_name = try(locator.locator_name, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.locator_name, null)
            level        = try(locator.level, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.level, null)
            metric       = try(locator.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.metric, null)
            tag          = try(locator.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.tag, null)
            metric_levels = try(length(locator.metric_levels) == 0, true) ? null : [for ml in locator.metric_levels : {
              level_number = try(ml.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.metric_levels.level_number, null)
              metric       = try(ml.metric, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.metric_levels.metric, null)
              }
            ]
            tag_levels = try(length(locator.tag_levels) == 0, true) ? null : [for tl in locator.tag_levels : {
              level_number = try(tl.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.tag_levels.level_number, null)
              tag          = try(tl.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.segment_routing_srv6_locators.tag_levels.tag, null)
              }
            ]
            }
          ]
          spf_interval_levels = try(length(af.spf_interval_levels) == 0, true) ? null : [for level in af.spf_interval_levels : {
            level_number           = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.level_number, null)
            ietf                   = try(level.ietf, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.ietf, null)
            ietf_holddown_interval = try(level.ietf_holddown_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.ietf_holddown_interval, null)
            ietf_initial_wait      = try(level.ietf_initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.ietf_initial_wait, null)
            ietf_learn_interval    = try(level.ietf_learn_interval, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.ietf_learn_interval, null)
            ietf_long_wait         = try(level.ietf_long_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.ietf_long_wait, null)
            ietf_short_wait        = try(level.ietf_short_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.ietf_short_wait, null)
            initial_wait           = try(level.initial_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.initial_wait, null)
            maximum_wait           = try(level.maximum_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.maximum_wait, null)
            secondary_wait         = try(level.secondary_wait, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_interval_levels.secondary_wait, null)
            }
          ]
          spf_prefix_priority_critical_levels = try(length(af.spf_prefix_priority_critical_levels) == 0, true) ? null : [for level in af.spf_prefix_priority_critical_levels : {
            level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_critical_levels.level_number, null)
            prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_critical_levels.prefix_list, null)
            tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_critical_levels.tag, null)
            }
          ]
          spf_prefix_priority_high_levels = try(length(af.spf_prefix_priority_high_levels) == 0, true) ? null : [for level in af.spf_prefix_priority_high_levels : {
            level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_high_levels.level_number, null)
            prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_high_levels.prefix_list, null)
            tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_high_levels.tag, null)
            }
          ]
          spf_prefix_priority_medium_levels = try(length(af.spf_prefix_priority_medium_levels) == 0, true) ? null : [for level in af.spf_prefix_priority_medium_levels : {
            level_number     = try(level.level_number, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_medium_levels.level_number, null)
            prefix_list_name = try(level.prefix_list, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_medium_levels.prefix_list, null)
            tag              = try(level.tag, local.defaults.iosxr.devices.configuration.routing.isis_processes.address_family.spf_prefix_priority_medium_levels.tag, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_isis_address_family" "router_isis_address_family" {
  for_each                                                       = { for af in local.router_isis_address_family : af.key => af }
  device                                                         = each.value.device_name
  process_id                                                     = each.value.process_id
  af_name                                                        = each.value.af_name
  saf_name                                                       = each.value.saf_name
  advertise_link_attributes                                      = each.value.advertise_link_attributes
  advertise_passive_only                                         = each.value.advertise_passive_only
  default_information_originate                                  = each.value.default_information_originate
  fast_reroute_delay_interval                                    = each.value.fast_reroute_delay_interval
  fast_reroute_per_link_priority_limit                           = each.value.fast_reroute_per_link_priority_limit
  fast_reroute_per_link_use_candidate_only                       = each.value.fast_reroute_per_link_use_candidate_only
  fast_reroute_per_prefix_load_sharing_disable                   = each.value.fast_reroute_per_prefix_load_sharing_disable
  fast_reroute_per_prefix_priority_limit                         = each.value.fast_reroute_per_prefix_priority_limit
  fast_reroute_per_prefix_remote_lfa_prefix_list                 = each.value.fast_reroute_per_prefix_remote_lfa_prefix_list
  fast_reroute_per_prefix_srlg_protection_weighted_global        = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global
  fast_reroute_per_prefix_tiebreaker_downstream_index            = each.value.fast_reroute_per_prefix_tiebreaker_downstream_index
  fast_reroute_per_prefix_tiebreaker_lc_disjoint_index           = each.value.fast_reroute_per_prefix_tiebreaker_lc_disjoint_index
  fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index  = each.value.fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index
  fast_reroute_per_prefix_tiebreaker_node_protecting_index       = each.value.fast_reroute_per_prefix_tiebreaker_node_protecting_index
  fast_reroute_per_prefix_tiebreaker_primary_path_index          = each.value.fast_reroute_per_prefix_tiebreaker_primary_path_index
  fast_reroute_per_prefix_tiebreaker_secondary_path_index        = each.value.fast_reroute_per_prefix_tiebreaker_secondary_path_index
  fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index         = each.value.fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index
  fast_reroute_per_prefix_use_candidate_only                     = each.value.fast_reroute_per_prefix_use_candidate_only
  maximum_redistributed_prefixes                                 = each.value.maximum_redistributed_prefixes
  metric_style_narrow                                            = each.value.metric_style_narrow
  metric_style_narrow_transition                                 = each.value.metric_style_narrow_transition
  metric_style_transition                                        = each.value.metric_style_transition
  metric_style_wide                                              = each.value.metric_style_wide
  metric_style_wide_transition                                   = each.value.metric_style_wide_transition
  microloop_avoidance                                            = each.value.microloop_avoidance
  microloop_avoidance_protected                                  = each.value.microloop_avoidance_protected
  microloop_avoidance_rib_update_delay                           = each.value.microloop_avoidance_rib_update_delay
  microloop_avoidance_segment_routing_route_policy               = each.value.microloop_avoidance_segment_routing_route_policy
  mpls_ldp_auto_config                                           = each.value.mpls_ldp_auto_config
  mpls_traffic_eng_level_1                                       = each.value.mpls_traffic_eng_level_1
  mpls_traffic_eng_level_1_2                                     = each.value.mpls_traffic_eng_level_1_2
  mpls_traffic_eng_level_2_only                                  = each.value.mpls_traffic_eng_level_2_only
  mpls_traffic_eng_router_id_interface_name                      = each.value.mpls_traffic_eng_router_id_interface_name
  mpls_traffic_eng_router_id_ipv4_address                        = each.value.mpls_traffic_eng_router_id_ipv4_address
  router_id_interface_name                                       = each.value.router_id_interface_name
  router_id_ip_address                                           = each.value.router_id_ip_address
  segment_routing_mpls_enable                                    = each.value.segment_routing_mpls_enable
  segment_routing_mpls_sr_prefer                                 = each.value.segment_routing_mpls_sr_prefer
  spf_interval_ietf                                              = each.value.spf_interval_ietf
  spf_interval_ietf_holddown_interval                            = each.value.spf_interval_ietf_holddown_interval
  spf_interval_ietf_initial_wait                                 = each.value.spf_interval_ietf_initial_wait
  spf_interval_ietf_learn_interval                               = each.value.spf_interval_ietf_learn_interval
  spf_interval_ietf_long_wait                                    = each.value.spf_interval_ietf_long_wait
  spf_interval_ietf_short_wait                                   = each.value.spf_interval_ietf_short_wait
  spf_interval_initial_wait                                      = each.value.spf_interval_initial_wait
  spf_interval_maximum_wait                                      = each.value.spf_interval_maximum_wait
  spf_interval_secondary_wait                                    = each.value.spf_interval_secondary_wait
  spf_prefix_priority_critical_prefix_list_name                  = each.value.spf_prefix_priority_critical_prefix_list_name
  spf_prefix_priority_critical_tag                               = each.value.spf_prefix_priority_critical_tag
  spf_prefix_priority_high_prefix_list_name                      = each.value.spf_prefix_priority_high_prefix_list_name
  spf_prefix_priority_high_tag                                   = each.value.spf_prefix_priority_high_tag
  spf_prefix_priority_medium_prefix_list_name                    = each.value.spf_prefix_priority_medium_prefix_list_name
  spf_prefix_priority_medium_tag                                 = each.value.spf_prefix_priority_medium_tag
  fast_reroute_per_link_priority_limit_levels                    = each.value.fast_reroute_per_link_priority_limit_levels
  fast_reroute_per_prefix_load_sharing_disable_levels            = each.value.fast_reroute_per_prefix_load_sharing_disable_levels
  fast_reroute_per_prefix_priority_limit_levels                  = each.value.fast_reroute_per_prefix_priority_limit_levels
  fast_reroute_per_prefix_remote_lfa_prefix_list_levels          = each.value.fast_reroute_per_prefix_remote_lfa_prefix_list_levels
  fast_reroute_per_prefix_srlg_protection_weighted_global_levels = each.value.fast_reroute_per_prefix_srlg_protection_weighted_global_levels
  maximum_redistributed_prefixes_levels                          = each.value.maximum_redistributed_prefixes_levels
  metric_style_levels                                            = each.value.metric_style_levels
  redistribute_isis                                              = each.value.redistribute_isis
  segment_routing_srv6_locators                                  = each.value.segment_routing_srv6_locators
  spf_interval_levels                                            = each.value.spf_interval_levels
  spf_prefix_priority_critical_levels                            = each.value.spf_prefix_priority_critical_levels
  spf_prefix_priority_high_levels                                = each.value.spf_prefix_priority_high_levels
  spf_prefix_priority_medium_levels                              = each.value.spf_prefix_priority_medium_levels

  depends_on = [
    iosxr_router_isis.router_isis
  ]
}
