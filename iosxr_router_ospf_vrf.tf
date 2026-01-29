locals {
  router_ospf_vrf = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for vrf in try(ospf_process.vrfs, []) : {
          key             = format("%s/%s/%s", device.name, ospf_process.id, vrf.vrf_name)
          device_name     = device.name
          process_name    = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
          vrf_name        = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.vrf_name, null)
          domain_id_type  = try(vrf.domain_id_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.domain_id_type, null)
          domain_id_value = try(vrf.domain_id_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.domain_id_value, null)
          domain_id_secondaries = try(length(vrf.domain_id_secondaries) == 0, true) ? null : [for sec in vrf.domain_id_secondaries : {
            type  = try(sec.type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.domain_id_secondaries.type, null)
            value = try(sec.value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.domain_id_secondaries.value, null)
            }
          ]
          domain_tag                                   = try(vrf.domain_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.domain_tag, null)
          disable_dn_bit_check                         = try(vrf.disable_dn_bit_check, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.disable_dn_bit_check, null)
          log_adjacency_changes_detail                 = try(vrf.log_adjacency_changes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.log_adjacency_changes, null) == "detail" ? true : null
          log_adjacency_changes_disable                = try(vrf.log_adjacency_changes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.log_adjacency_changes, null) == "disable" ? true : null
          router_id                                    = try(vrf.router_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.router_id, null)
          redistribute_connected                       = try(vrf.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected, null)
          redistribute_connected_tag                   = try(vrf.redistribute_connected_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_tag, null)
          redistribute_connected_metric_type           = try(vrf.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_metric_type, null)
          redistribute_connected_route_policy          = try(vrf.redistribute_connected_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_route_policy, null)
          redistribute_connected_metric                = try(vrf.redistribute_connected_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_metric, null)
          redistribute_connected_metric_use_rib_metric = try(vrf.redistribute_connected_metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_metric_use_rib_metric, null)
          redistribute_connected_lsa_type_summary      = try(vrf.redistribute_connected_lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_lsa_type_summary, null)
          redistribute_connected_nssa_only             = try(vrf.redistribute_connected_nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_nssa_only, null)
          redistribute_static                          = try(vrf.redistribute_static, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static, null)
          redistribute_static_tag                      = try(vrf.redistribute_static_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_tag, null)
          redistribute_static_metric_type              = try(vrf.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_metric_type, null)
          redistribute_static_route_policy             = try(vrf.redistribute_static_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_route_policy, null)
          redistribute_static_metric                   = try(vrf.redistribute_static_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_metric, null)
          redistribute_static_metric_use_rib_metric    = try(vrf.redistribute_static_metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_metric_use_rib_metric, null)
          redistribute_static_lsa_type_summary         = try(vrf.redistribute_static_lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_lsa_type_summary, null)
          redistribute_static_nssa_only                = try(vrf.redistribute_static_nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_nssa_only, null)
          redistribute_bgp = try(length(vrf.redistribute_bgp) == 0, true) ? null : [for bgp in vrf.redistribute_bgp : {
            as_number             = try(bgp.as_number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.as_number, null)
            tag                   = try(bgp.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.tag, null)
            metric_type           = try(bgp.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.metric_type, null)
            route_policy          = try(bgp.route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.route_policy, null)
            preserve_med          = try(bgp.preserve_med, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.preserve_med, null)
            metric                = try(bgp.metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.metric, null)
            metric_use_rib_metric = try(bgp.metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.metric_use_rib_metric, null)
            lsa_type_summary      = try(bgp.lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.lsa_type_summary, null)
            nssa_only             = try(bgp.nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.nssa_only, null)
            }
          ]
          redistribute_isis = try(length(vrf.redistribute_isis) == 0, true) ? null : [for isis in vrf.redistribute_isis : {
            instance_name         = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.instance_id, null)
            level_1               = try(isis.level_1, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.level_1, null)
            level_2               = try(isis.level_2, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.level_2, null)
            level_1_2             = try(isis.level_1_2, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.level_1_2, null)
            tag                   = try(isis.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.tag, null)
            metric_type           = try(isis.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.metric_type, null)
            route_policy          = try(isis.route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.route_policy, null)
            metric                = try(isis.metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.metric, null)
            metric_use_rib_metric = try(isis.metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.metric_use_rib_metric, null)
            lsa_type_summary      = try(isis.lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.lsa_type_summary, null)
            nssa_only             = try(isis.nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.nssa_only, null)
            }
          ]
          redistribute_ospf = try(length(vrf.redistribute_ospf) == 0, true) ? null : [for ospf in vrf.redistribute_ospf : {
            instance_name           = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.instance_id, null)
            tag                     = try(ospf.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.tag, null)
            metric_type             = try(ospf.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.metric_type, null)
            route_policy            = try(ospf.route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.route_policy, null)
            match_internal          = try(ospf.match_internal, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_internal, null)
            match_external          = try(ospf.match_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_external, null)
            match_external_one      = try(ospf.match_external_one, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_external_one, null)
            match_external_two      = try(ospf.match_external_two, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_external_two, null)
            match_nssa_external     = try(ospf.match_nssa_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_nssa_external, null)
            match_nssa_external_one = try(ospf.match_nssa_external_one, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_nssa_external_one, null)
            match_nssa_external_two = try(ospf.match_nssa_external_two, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_nssa_external_two, null)
            metric                  = try(ospf.metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.metric, null)
            metric_use_rib_metric   = try(ospf.metric_use_rib_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.metric_use_rib_metric, null)
            lsa_type_summary        = try(ospf.lsa_type_summary, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.lsa_type_summary, null)
            nssa_only               = try(ospf.nssa_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.nssa_only, null)
            }
          ]
          distribute_list_in_acl                     = try(vrf.distribute_list_in_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_in_acl, null)
          distribute_list_in_route_policy            = try(vrf.distribute_list_in_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_in_route_policy, null)
          distribute_list_out_acl                    = try(vrf.distribute_list_out_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_acl, null)
          distribute_list_out_connected_acl          = try(vrf.distribute_list_out_connected_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_connected_acl, null)
          distribute_list_out_static_acl             = try(vrf.distribute_list_out_static_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_static_acl, null)
          distribute_list_out_bgp_as                 = try(vrf.distribute_list_out_bgp_as, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_bgp_as, null)
          distribute_list_out_bgp_acl                = try(vrf.distribute_list_out_bgp_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_bgp_acl, null)
          distribute_list_out_ospf_instance_name     = try(vrf.distribute_list_out_ospf_instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_ospf_instance_id, null)
          distribute_list_out_ospf_acl               = try(vrf.distribute_list_out_ospf_acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distribute_list_out_ospf_acl, null)
          packet_size                                = try(vrf.packet_size, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.packet_size, null)
          bfd_fast_detect                            = try(vrf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_fast_detect, null) == "enable" ? true : null
          bfd_fast_detect_strict_mode                = try(vrf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_fast_detect, null) == "strict_mode" ? true : null
          bfd_minimum_interval                       = try(vrf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_minimum_interval, null)
          bfd_multiplier                             = try(vrf.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_multiplier, null)
          security_ttl                               = try(vrf.security_ttl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.security_ttl, null)
          security_ttl_hops                          = try(vrf.security_ttl_hops, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.security_ttl_hops, null)
          prefix_suppression                         = try(vrf.prefix_suppression, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.prefix_suppression, null)
          default_information_originate              = try(vrf.default_information_originate, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate, null)
          default_information_originate_always       = try(vrf.default_information_originate_always, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate_always, null)
          default_information_originate_metric       = try(vrf.default_information_originate_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate_metric, null)
          default_information_originate_metric_type  = try(vrf.default_information_originate_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate_metric_type, null)
          default_information_originate_route_policy = try(vrf.default_information_originate_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate_route_policy, null)
          default_metric                             = try(vrf.default_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_metric, null)
          distance_sources = try(length(vrf.distance_sources) == 0, true) ? null : [for ds in vrf.distance_sources : {
            address  = try(ds.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_sources.address, null)
            wildcard = try(ds.wildcard, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_sources.wildcard, null)
            distance = try(ds.distance, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_sources.distance, null)
            acl      = try(ds.acl, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_sources.acl, null)
            }
          ]
          distance_ospf_intra_area                                  = try(vrf.distance_ospf_intra_area, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_ospf_intra_area, null)
          distance_ospf_inter_area                                  = try(vrf.distance_ospf_inter_area, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_ospf_inter_area, null)
          distance_ospf_external                                    = try(vrf.distance_ospf_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.distance_ospf_external, null)
          auto_cost_reference_bandwidth                             = try(vrf.auto_cost_reference_bandwidth, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.auto_cost_reference_bandwidth, null)
          auto_cost_disable                                         = try(vrf.auto_cost_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.auto_cost_disable, null)
          ignore_lsa_mospf                                          = try(vrf.ignore_lsa_mospf, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.ignore_lsa_mospf, null)
          capability_opaque_disable                                 = try(vrf.capability_opaque_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.capability_opaque_disable, null)
          capability_lls_disable                                    = try(vrf.capability_lls_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.capability_lls_disable, null)
          capability_type7_prefer                                   = try(vrf.capability_type7_prefer, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.capability_type7_prefer, null)
          max_metric_router_lsa                                     = try(vrf.max_metric.router_lsa.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.enable, null)
          max_metric_router_lsa_include_stub                        = try(vrf.max_metric.router_lsa.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.include_stub, null)
          max_metric_router_lsa_summary_lsa                         = try(vrf.max_metric.router_lsa.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.summary_lsa, null)
          max_metric_router_lsa_summary_lsa_metric                  = try(vrf.max_metric.router_lsa.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.summary_lsa_metric, null)
          max_metric_router_lsa_external_lsa                        = try(vrf.max_metric.router_lsa.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.external_lsa, null)
          max_metric_router_lsa_external_lsa_metric                 = try(vrf.max_metric.router_lsa.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.external_lsa_metric, null)
          max_metric_router_lsa_on_startup_time                     = try(vrf.max_metric.router_lsa.on_startup.time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.time, null)
          max_metric_router_lsa_on_startup_wait_for_bgp             = try(vrf.max_metric.router_lsa.on_startup.wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.wait_for_bgp, null)
          max_metric_router_lsa_on_startup_include_stub             = try(vrf.max_metric.router_lsa.on_startup.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.include_stub, null)
          max_metric_router_lsa_on_startup_summary_lsa              = try(vrf.max_metric.router_lsa.on_startup.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.summary_lsa, null)
          max_metric_router_lsa_on_startup_summary_lsa_metric       = try(vrf.max_metric.router_lsa.on_startup.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.summary_lsa_metric, null)
          max_metric_router_lsa_on_startup_external_lsa             = try(vrf.max_metric.router_lsa.on_startup.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.external_lsa, null)
          max_metric_router_lsa_on_startup_external_lsa_metric      = try(vrf.max_metric.router_lsa.on_startup.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_startup.external_lsa_metric, null)
          max_metric_router_lsa_on_switchover_time                  = try(vrf.max_metric.router_lsa.on_switchover.time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.time, null)
          max_metric_router_lsa_on_switchover_wait_for_bgp          = try(vrf.max_metric.router_lsa.on_switchover.wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.wait_for_bgp, null)
          max_metric_router_lsa_on_switchover_include_stub          = try(vrf.max_metric.router_lsa.on_switchover.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.include_stub, null)
          max_metric_router_lsa_on_switchover_summary_lsa           = try(vrf.max_metric.router_lsa.on_switchover.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.summary_lsa, null)
          max_metric_router_lsa_on_switchover_summary_lsa_metric    = try(vrf.max_metric.router_lsa.on_switchover.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.summary_lsa_metric, null)
          max_metric_router_lsa_on_switchover_external_lsa          = try(vrf.max_metric.router_lsa.on_switchover.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.external_lsa, null)
          max_metric_router_lsa_on_switchover_external_lsa_metric   = try(vrf.max_metric.router_lsa.on_switchover.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_switchover.external_lsa_metric, null)
          max_metric_router_lsa_on_proc_restart_time                = try(vrf.max_metric.router_lsa.on_proc_restart.time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.time, null)
          max_metric_router_lsa_on_proc_restart_wait_for_bgp        = try(vrf.max_metric.router_lsa.on_proc_restart.wait_for_bgp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.wait_for_bgp, null)
          max_metric_router_lsa_on_proc_restart_include_stub        = try(vrf.max_metric.router_lsa.on_proc_restart.include_stub, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.include_stub, null)
          max_metric_router_lsa_on_proc_restart_summary_lsa         = try(vrf.max_metric.router_lsa.on_proc_restart.summary_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.summary_lsa, null)
          max_metric_router_lsa_on_proc_restart_summary_lsa_metric  = try(vrf.max_metric.router_lsa.on_proc_restart.summary_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.summary_lsa_metric, null)
          max_metric_router_lsa_on_proc_restart_external_lsa        = try(vrf.max_metric.router_lsa.on_proc_restart.external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.external_lsa, null)
          max_metric_router_lsa_on_proc_restart_external_lsa_metric = try(vrf.max_metric.router_lsa.on_proc_restart.external_lsa_metric, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_metric.router_lsa.on_proc_restart.external_lsa_metric, null)
          max_lsa                                                   = try(vrf.max_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_lsa, null)
          max_lsa_threshold                                         = try(vrf.max_lsa_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_lsa_threshold, null)
          max_lsa_warning_only                                      = try(vrf.max_lsa_warning_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_lsa_warning_only, null)
          max_lsa_ignore_time                                       = try(vrf.max_lsa_ignore_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_lsa_ignore_time, null)
          max_lsa_ignore_count                                      = try(vrf.max_lsa_ignore_count, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_lsa_ignore_count, null)
          max_lsa_reset_time                                        = try(vrf.max_lsa_reset_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_lsa_reset_time, null)
          timers_throttle_spf_initial_delay                         = try(vrf.timers_throttle_spf_initial_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_spf_initial_delay, null)
          timers_throttle_spf_second_delay                          = try(vrf.timers_throttle_spf_second_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_spf_second_delay, null)
          timers_throttle_spf_maximum_delay                         = try(vrf.timers_throttle_spf_maximum_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_spf_maximum_delay, null)
          timers_throttle_lsa_all_initial_delay                     = try(vrf.timers_throttle_lsa_all_initial_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_lsa_all_initial_delay, null)
          timers_throttle_lsa_all_minimum_delay                     = try(vrf.timers_throttle_lsa_all_minimum_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_lsa_all_minimum_delay, null)
          timers_throttle_lsa_all_maximum_delay                     = try(vrf.timers_throttle_lsa_all_maximum_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_lsa_all_maximum_delay, null)
          timers_throttle_fast_reroute                              = try(vrf.timers_throttle_fast_reroute, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_throttle_fast_reroute, null)
          timers_lsa_group_pacing                                   = try(vrf.timers_lsa_group_pacing, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_lsa_group_pacing, null)
          timers_lsa_min_arrival                                    = try(vrf.timers_lsa_min_arrival, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_lsa_min_arrival, null)
          timers_lsa_refresh                                        = try(vrf.timers_lsa_refresh, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_lsa_refresh, null)
          timers_pacing_flood                                       = try(vrf.timers_pacing_flood, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.timers_pacing_flood, null)
          nsf_interval                                              = try(vrf.nsf_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_interval, null)
          nsf_lifetime                                              = try(vrf.nsf_lifetime, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_lifetime, null)
          nsf_flush_delay_time                                      = try(vrf.nsf_flush_delay_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_flush_delay_time, null)
          nsf_cisco                                                 = try(vrf.nsf_cisco, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_cisco, null)
          nsf_cisco_enforce_global                                  = try(vrf.nsf_cisco_enforce_global, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_cisco_enforce_global, null)
          nsf_ietf                                                  = try(vrf.nsf_ietf, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_ietf, null)
          nsf_ietf_strict_lsa_checking                              = try(vrf.nsf_ietf_strict_lsa_checking, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_ietf_strict_lsa_checking, null)
          nsf_ietf_helper_disable                                   = try(vrf.nsf_ietf_helper_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.nsf_ietf_helper_disable, null)
          address_family_ipv4_unicast                               = try(vrf.address_family_ipv4_unicast, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.address_family_ipv4_unicast, null)
          maximum_interfaces                                        = try(vrf.maximum_interfaces, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.maximum_interfaces, null)
          maximum_paths                                             = try(vrf.maximum_paths, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.maximum_paths, null)
          maximum_redistributed_prefixes                            = try(vrf.maximum_redistributed_prefixes, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.maximum_redistributed_prefixes, null)
          maximum_redistributed_prefixes_threshold                  = try(vrf.maximum_redistributed_prefixes_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.maximum_redistributed_prefixes_threshold, null)
          maximum_redistributed_prefixes_warning_only               = try(vrf.maximum_redistributed_prefixes_warning_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.maximum_redistributed_prefixes_warning_only, null)
          queue_limit_high                                          = try(vrf.queue_limit_high, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_limit_high, null)
          queue_limit_medium                                        = try(vrf.queue_limit_medium, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_limit_medium, null)
          queue_limit_low                                           = try(vrf.queue_limit_low, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_limit_low, null)
          queue_dispatch_incoming                                   = try(vrf.queue_dispatch_incoming, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_dispatch_incoming, null)
          queue_dispatch_rate_limited_lsa                           = try(vrf.queue_dispatch_rate_limited_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_dispatch_rate_limited_lsa, null)
          queue_dispatch_flush_lsa                                  = try(vrf.queue_dispatch_flush_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_dispatch_flush_lsa, null)
          queue_dispatch_spf_lsa_limit                              = try(vrf.queue_dispatch_spf_lsa_limit, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.queue_dispatch_spf_lsa_limit, null)
          summary_prefixes = try(length(vrf.summary_prefixes) == 0, true) ? null : [for sp in vrf.summary_prefixes : {
            address       = try(sp.address, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.summary_prefixes.address, null)
            mask          = try(sp.mask, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.summary_prefixes.mask, null)
            not_advertise = try(sp.not_advertise, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.summary_prefixes.not_advertise, null)
            tag           = try(sp.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.summary_prefixes.tag, null)
            }
          ]
          spf_prefix_priority_route_policy                                = try(vrf.spf_prefix_priority_route_policy, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.spf_prefix_priority_route_policy, null)
          fast_reroute_per_prefix                                         = try(vrf.fast_reroute_per_prefix.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.enable, null)
          fast_reroute_per_prefix_priority_limit_critical                 = try(vrf.fast_reroute_per_prefix.priority_limit_critical, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.priority_limit_critical, null)
          fast_reroute_per_prefix_priority_limit_high                     = try(vrf.fast_reroute_per_prefix.priority_limit_high, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.priority_limit_high, null)
          fast_reroute_per_prefix_priority_limit_medium                   = try(vrf.fast_reroute_per_prefix.priority_limit_medium, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.priority_limit_medium, null)
          fast_reroute_per_prefix_tiebreaker_downstream_index             = try(vrf.fast_reroute_per_prefix.tiebreaker.downstream_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.downstream_index, null)
          fast_reroute_per_prefix_tiebreaker_downstream_disable           = try(vrf.fast_reroute_per_prefix.tiebreaker.downstream_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.downstream_disable, null)
          fast_reroute_per_prefix_tiebreaker_lc_disjoint_index            = try(vrf.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.lc_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_lc_disjoint_disable          = try(vrf.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.lc_disjoint_disable, null)
          fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_index   = try(vrf.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_index, null)
          fast_reroute_per_prefix_tiebreaker_lowest_backup_metric_disable = try(vrf.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.lowest_backup_metric_disable, null)
          fast_reroute_per_prefix_tiebreaker_node_protecting_index        = try(vrf.fast_reroute_per_prefix.tiebreaker.node_protecting_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.node_protecting_index, null)
          fast_reroute_per_prefix_tiebreaker_node_protecting_disable      = try(vrf.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.node_protecting_disable, null)
          fast_reroute_per_prefix_tiebreaker_primary_path_index           = try(vrf.fast_reroute_per_prefix.tiebreaker.primary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.primary_path_index, null)
          fast_reroute_per_prefix_tiebreaker_primary_path_disable         = try(vrf.fast_reroute_per_prefix.tiebreaker.primary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.primary_path_disable, null)
          fast_reroute_per_prefix_tiebreaker_secondary_path_index         = try(vrf.fast_reroute_per_prefix.tiebreaker.secondary_path_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.secondary_path_index, null)
          fast_reroute_per_prefix_tiebreaker_secondary_path_disable       = try(vrf.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.secondary_path_disable, null)
          fast_reroute_per_prefix_tiebreaker_interface_disjoint_index     = try(vrf.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.interface_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_interface_disjoint_disable   = try(vrf.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.interface_disjoint_disable, null)
          fast_reroute_per_prefix_tiebreaker_srlg_disjoint_index          = try(vrf.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_index, null)
          fast_reroute_per_prefix_tiebreaker_srlg_disjoint_disable        = try(vrf.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.tiebreaker.srlg_disjoint_disable, null)
          fast_reroute_per_prefix_load_sharing_disable                    = try(vrf.fast_reroute_per_prefix.load_sharing_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.load_sharing_disable, null)
          fast_reroute_per_prefix_exclude_interfaces = try(length(vrf.fast_reroute_per_prefix.exclude_interfaces) == 0, true) ? null : [for iface in vrf.fast_reroute_per_prefix.exclude_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.exclude_interfaces.interface_name, null)
            }
          ]
          fast_reroute_per_prefix_lfa_candidate_interfaces = try(length(vrf.fast_reroute_per_prefix.lfa_candidate_interfaces) == 0, true) ? null : [for iface in vrf.fast_reroute_per_prefix.lfa_candidate_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.lfa_candidate_interfaces.interface_name, null)
            }
          ]
          fast_reroute_per_prefix_use_candidate_only_enable  = try(vrf.fast_reroute_per_prefix.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.use_candidate_only_enable, null)
          fast_reroute_per_prefix_use_candidate_only_disable = try(vrf.fast_reroute_per_prefix.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_prefix.use_candidate_only_disable, null)
          fast_reroute_per_link                              = try(vrf.fast_reroute_per_link.enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.enable, null)
          fast_reroute_per_link_priority_limit_critical      = try(vrf.fast_reroute_per_link.priority_limit_critical, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.priority_limit_critical, null)
          fast_reroute_per_link_priority_limit_high          = try(vrf.fast_reroute_per_link.priority_limit_high, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.priority_limit_high, null)
          fast_reroute_per_link_priority_limit_medium        = try(vrf.fast_reroute_per_link.priority_limit_medium, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.priority_limit_medium, null)
          fast_reroute_per_link_exclude_interfaces = try(length(vrf.fast_reroute_per_link.exclude_interfaces) == 0, true) ? null : [for iface in vrf.fast_reroute_per_link.exclude_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.exclude_interfaces.interface_name, null)
            }
          ]
          fast_reroute_per_link_lfa_candidate_interfaces = try(length(vrf.fast_reroute_per_link.lfa_candidate_interfaces) == 0, true) ? null : [for iface in vrf.fast_reroute_per_link.lfa_candidate_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.lfa_candidate_interfaces.interface_name, null)
            }
          ]
          fast_reroute_per_link_use_candidate_only_enable  = try(vrf.fast_reroute_per_link.use_candidate_only_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.use_candidate_only_enable, null)
          fast_reroute_per_link_use_candidate_only_disable = try(vrf.fast_reroute_per_link.use_candidate_only_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_per_link.use_candidate_only_disable, null)
          fast_reroute_disable                             = try(vrf.fast_reroute_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.fast_reroute_disable, null)
          loopback_stub_network_enable                     = try(vrf.loopback_stub_network_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.loopback_stub_network_enable, null)
          loopback_stub_network_disable                    = try(vrf.loopback_stub_network_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.loopback_stub_network_disable, null)
          link_down_fast_detect                            = try(vrf.link_down_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.link_down_fast_detect, null)
          weight                                           = try(vrf.weight, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.weight, null)
          delay_normalize_interval                         = try(vrf.delay_normalize_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.delay_normalize_interval, null)
          delay_normalize_offset                           = try(vrf.delay_normalize_offset, vrf.delay_normalize_interval != null ? 0 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.delay_normalize_offset, null)
          microloop_avoidance                              = try(vrf.microloop_avoidance, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.microloop_avoidance, null)
          microloop_avoidance_protected                    = try(vrf.microloop_avoidance_protected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.microloop_avoidance_protected, null)
          microloop_avoidance_segment_routing              = try(vrf.microloop_avoidance_segment_routing, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.microloop_avoidance_segment_routing, null)
          microloop_avoidance_rib_update_delay             = try(vrf.microloop_avoidance_rib_update_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.microloop_avoidance_rib_update_delay, null)
          authentication_key_encrypted                     = try(vrf.authentication_key_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.authentication_key_encrypted, null)
          message_digest_keys = try(length(vrf.message_digest_keys) == 0, true) ? null : [for mdk in vrf.message_digest_keys : {
            key_id        = try(mdk.key_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.message_digest_keys.key_id, null)
            md5_encrypted = try(mdk.md5_encrypted, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.message_digest_keys.md5_encrypted, null)
            }
          ]
          authentication_message_digest                     = try(vrf.authentication_message_digest, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.authentication_message_digest, null)
          authentication_keychain                           = try(vrf.authentication_keychain, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.authentication_keychain, null)
          authentication_keychain_name                      = try(vrf.authentication_keychain_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.authentication_keychain_name, null)
          authentication_null                               = try(vrf.authentication_null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.authentication_null, null)
          network_broadcast                                 = try(vrf.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.network, null) == "broadcast" ? true : null
          network_non_broadcast                             = try(vrf.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.network, null) == "non_broadcast" ? true : null
          network_point_to_point                            = try(vrf.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.network, null) == "point_to_point" ? true : null
          network_point_to_multipoint                       = try(vrf.network, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.network, null) == "point_to_multipoint" ? true : null
          mpls_ldp_sync                                     = try(vrf.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.mpls_ldp_sync, null)
          cost                                              = try(vrf.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost, null)
          cost_fallback_anomaly_delay_igp_metric_increment  = try(vrf.cost_fallback_anomaly_delay_igp_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost_fallback_anomaly_delay_igp_metric_increment, null)
          cost_fallback_anomaly_delay_igp_metric_multiplier = try(vrf.cost_fallback_anomaly_delay_igp_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost_fallback_anomaly_delay_igp_metric_multiplier, null)
          cost_fallback_anomaly_delay_igp_metric_value      = try(vrf.cost_fallback_anomaly_delay_igp_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost_fallback_anomaly_delay_igp_metric_value, null)
          cost_fallback_anomaly_delay_te_metric_increment   = try(vrf.cost_fallback_anomaly_delay_te_metric_increment, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost_fallback_anomaly_delay_te_metric_increment, null)
          cost_fallback_anomaly_delay_te_metric_multiplier  = try(vrf.cost_fallback_anomaly_delay_te_metric_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost_fallback_anomaly_delay_te_metric_multiplier, null)
          cost_fallback_anomaly_delay_te_metric_value       = try(vrf.cost_fallback_anomaly_delay_te_metric_value, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.cost_fallback_anomaly_delay_te_metric_value, null)
          hello_interval                                    = try(vrf.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.hello_interval, null)
          dead_interval                                     = try(vrf.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.dead_interval, null)
          priority                                          = try(vrf.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.priority, null)
          retransmit_interval                               = try(vrf.retransmit_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.retransmit_interval, null)
          transmit_delay                                    = try(vrf.transmit_delay, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.transmit_delay, null)
          flood_reduction_enable                            = try(vrf.flood_reduction_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.flood_reduction_enable, null)
          flood_reduction_disable                           = try(vrf.flood_reduction_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.flood_reduction_disable, null)
          demand_circuit_enable                             = try(vrf.demand_circuit_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.demand_circuit_enable, null)
          demand_circuit_disable                            = try(vrf.demand_circuit_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.demand_circuit_disable, null)
          mtu_ignore_enable                                 = try(vrf.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.mtu_ignore_enable, null)
          mtu_ignore_disable                                = try(vrf.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.mtu_ignore_disable, null)
          database_filter_all_out_enable                    = try(vrf.database_filter_all_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.database_filter_all_out_enable, null)
          database_filter_all_out_disable                   = try(vrf.database_filter_all_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.database_filter_all_out_disable, null)
          passive_enable                                    = try(vrf.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.passive_enable, null)
          passive_disable                                   = try(vrf.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.passive_disable, null)
          external_out_enable                               = try(vrf.external_out_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.external_out_enable, null)
          external_out_disable                              = try(vrf.external_out_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.external_out_disable, null)
          summary_in_enable                                 = try(vrf.summary_in_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.summary_in_enable, null)
          summary_in_disable                                = try(vrf.summary_in_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.summary_in_disable, null)
          adjacency_stagger_disable                         = try(vrf.adjacency_stagger_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.adjacency_stagger_disable, null)
          adjacency_stagger_initial_neighbors               = try(vrf.adjacency_stagger_initial_neighbors, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.adjacency_stagger_initial_neighbors, null)
          adjacency_stagger_simultaneous_neighbors          = try(vrf.adjacency_stagger_simultaneous_neighbors, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.adjacency_stagger_simultaneous_neighbors, null)
          snmp_context                                      = try(vrf.snmp_context, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.snmp_context, null)
          snmp_trap                                         = try(vrf.snmp_trap, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.snmp_trap, null)
          ucmp                                              = try(vrf.ucmp, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.ucmp, null)
          ucmp_variance                                     = try(vrf.ucmp_variance, vrf.ucmp != null ? 200 : null, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.ucmp_variance, null)
          ucmp_prefix_list                                  = try(vrf.ucmp_prefix_list, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.ucmp_prefix_list, null)
          ucmp_exclude_interfaces = try(length(vrf.ucmp_exclude_interfaces) == 0, true) ? null : [for iface in vrf.ucmp_exclude_interfaces : {
            interface_name = try(iface.interface_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.ucmp_exclude_interfaces.interface_name, null)
            }
          ]
          ucmp_delay_interval                = try(vrf.ucmp_delay_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.ucmp_delay_interval, null)
          max_external_lsa                   = try(vrf.max_external_lsa, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_external_lsa, null)
          max_external_lsa_threshold         = try(vrf.max_external_lsa_threshold, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_external_lsa_threshold, null)
          max_external_lsa_suppress_neighbor = try(vrf.max_external_lsa_suppress_neighbor, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_external_lsa_suppress_neighbor, null)
          max_external_lsa_warning_only      = try(vrf.max_external_lsa_warning_only, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.max_external_lsa_warning_only, null)
          exchange_timer                     = try(vrf.exchange_timer, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.exchange_timer, null)
          exchange_timer_hold_time           = try(vrf.exchange_timer_hold_time, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.exchange_timer_hold_time, null)
          exchange_timer_recovery_count      = try(vrf.exchange_timer_recovery_count, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.exchange_timer_recovery_count, null)
        }
      ]
    ]
  ])
}

resource "iosxr_router_ospf_vrf" "router_ospf_vrf" {
  for_each                                                        = { for vrf in local.router_ospf_vrf : vrf.key => vrf }
  device                                                          = each.value.device_name
  process_name                                                    = each.value.process_name
  vrf_name                                                        = each.value.vrf_name
  domain_id_type                                                  = each.value.domain_id_type
  domain_id_value                                                 = each.value.domain_id_value
  domain_id_secondaries                                           = each.value.domain_id_secondaries
  domain_tag                                                      = each.value.domain_tag
  disable_dn_bit_check                                            = each.value.disable_dn_bit_check
  log_adjacency_changes_detail                                    = each.value.log_adjacency_changes_detail
  log_adjacency_changes_disable                                   = each.value.log_adjacency_changes_disable
  router_id                                                       = each.value.router_id
  redistribute_connected                                          = each.value.redistribute_connected
  redistribute_connected_tag                                      = each.value.redistribute_connected_tag
  redistribute_connected_metric_type                              = each.value.redistribute_connected_metric_type
  redistribute_connected_route_policy                             = each.value.redistribute_connected_route_policy
  redistribute_connected_metric                                   = each.value.redistribute_connected_metric
  redistribute_connected_metric_use_rib_metric                    = each.value.redistribute_connected_metric_use_rib_metric
  redistribute_connected_lsa_type_summary                         = each.value.redistribute_connected_lsa_type_summary
  redistribute_connected_nssa_only                                = each.value.redistribute_connected_nssa_only
  redistribute_static                                             = each.value.redistribute_static
  redistribute_static_tag                                         = each.value.redistribute_static_tag
  redistribute_static_metric_type                                 = each.value.redistribute_static_metric_type
  redistribute_static_route_policy                                = each.value.redistribute_static_route_policy
  redistribute_static_metric                                      = each.value.redistribute_static_metric
  redistribute_static_metric_use_rib_metric                       = each.value.redistribute_static_metric_use_rib_metric
  redistribute_static_lsa_type_summary                            = each.value.redistribute_static_lsa_type_summary
  redistribute_static_nssa_only                                   = each.value.redistribute_static_nssa_only
  redistribute_bgp                                                = each.value.redistribute_bgp
  redistribute_isis                                               = each.value.redistribute_isis
  redistribute_ospf                                               = each.value.redistribute_ospf
  distribute_list_in_acl                                          = each.value.distribute_list_in_acl
  distribute_list_in_route_policy                                 = each.value.distribute_list_in_route_policy
  distribute_list_out_acl                                         = each.value.distribute_list_out_acl
  distribute_list_out_connected_acl                               = each.value.distribute_list_out_connected_acl
  distribute_list_out_static_acl                                  = each.value.distribute_list_out_static_acl
  distribute_list_out_bgp_as                                      = each.value.distribute_list_out_bgp_as
  distribute_list_out_bgp_acl                                     = each.value.distribute_list_out_bgp_acl
  distribute_list_out_ospf_instance_name                          = each.value.distribute_list_out_ospf_instance_name
  distribute_list_out_ospf_acl                                    = each.value.distribute_list_out_ospf_acl
  packet_size                                                     = each.value.packet_size
  bfd_fast_detect                                                 = each.value.bfd_fast_detect
  bfd_fast_detect_strict_mode                                     = each.value.bfd_fast_detect_strict_mode
  bfd_minimum_interval                                            = each.value.bfd_minimum_interval
  bfd_multiplier                                                  = each.value.bfd_multiplier
  security_ttl                                                    = each.value.security_ttl
  security_ttl_hops                                               = each.value.security_ttl_hops
  prefix_suppression                                              = each.value.prefix_suppression
  default_information_originate                                   = each.value.default_information_originate
  default_information_originate_always                            = each.value.default_information_originate_always
  default_information_originate_metric                            = each.value.default_information_originate_metric
  default_information_originate_metric_type                       = each.value.default_information_originate_metric_type
  default_information_originate_route_policy                      = each.value.default_information_originate_route_policy
  default_metric                                                  = each.value.default_metric
  distance_sources                                                = each.value.distance_sources
  distance_ospf_intra_area                                        = each.value.distance_ospf_intra_area
  distance_ospf_inter_area                                        = each.value.distance_ospf_inter_area
  distance_ospf_external                                          = each.value.distance_ospf_external
  auto_cost_reference_bandwidth                                   = each.value.auto_cost_reference_bandwidth
  auto_cost_disable                                               = each.value.auto_cost_disable
  ignore_lsa_mospf                                                = each.value.ignore_lsa_mospf
  capability_opaque_disable                                       = each.value.capability_opaque_disable
  capability_lls_disable                                          = each.value.capability_lls_disable
  capability_type7_prefer                                         = each.value.capability_type7_prefer
  max_metric_router_lsa                                           = each.value.max_metric_router_lsa
  max_metric_router_lsa_include_stub                              = each.value.max_metric_router_lsa_include_stub
  max_metric_router_lsa_summary_lsa                               = each.value.max_metric_router_lsa_summary_lsa
  max_metric_router_lsa_summary_lsa_metric                        = each.value.max_metric_router_lsa_summary_lsa_metric
  max_metric_router_lsa_external_lsa                              = each.value.max_metric_router_lsa_external_lsa
  max_metric_router_lsa_external_lsa_metric                       = each.value.max_metric_router_lsa_external_lsa_metric
  max_metric_router_lsa_on_startup_time                           = each.value.max_metric_router_lsa_on_startup_time
  max_metric_router_lsa_on_startup_wait_for_bgp                   = each.value.max_metric_router_lsa_on_startup_wait_for_bgp
  max_metric_router_lsa_on_startup_include_stub                   = each.value.max_metric_router_lsa_on_startup_include_stub
  max_metric_router_lsa_on_startup_summary_lsa                    = each.value.max_metric_router_lsa_on_startup_summary_lsa
  max_metric_router_lsa_on_startup_summary_lsa_metric             = each.value.max_metric_router_lsa_on_startup_summary_lsa_metric
  max_metric_router_lsa_on_startup_external_lsa                   = each.value.max_metric_router_lsa_on_startup_external_lsa
  max_metric_router_lsa_on_startup_external_lsa_metric            = each.value.max_metric_router_lsa_on_startup_external_lsa_metric
  max_metric_router_lsa_on_switchover_time                        = each.value.max_metric_router_lsa_on_switchover_time
  max_metric_router_lsa_on_switchover_wait_for_bgp                = each.value.max_metric_router_lsa_on_switchover_wait_for_bgp
  max_metric_router_lsa_on_switchover_include_stub                = each.value.max_metric_router_lsa_on_switchover_include_stub
  max_metric_router_lsa_on_switchover_summary_lsa                 = each.value.max_metric_router_lsa_on_switchover_summary_lsa
  max_metric_router_lsa_on_switchover_summary_lsa_metric          = each.value.max_metric_router_lsa_on_switchover_summary_lsa_metric
  max_metric_router_lsa_on_switchover_external_lsa                = each.value.max_metric_router_lsa_on_switchover_external_lsa
  max_metric_router_lsa_on_switchover_external_lsa_metric         = each.value.max_metric_router_lsa_on_switchover_external_lsa_metric
  max_metric_router_lsa_on_proc_restart_time                      = each.value.max_metric_router_lsa_on_proc_restart_time
  max_metric_router_lsa_on_proc_restart_wait_for_bgp              = each.value.max_metric_router_lsa_on_proc_restart_wait_for_bgp
  max_metric_router_lsa_on_proc_restart_include_stub              = each.value.max_metric_router_lsa_on_proc_restart_include_stub
  max_metric_router_lsa_on_proc_restart_summary_lsa               = each.value.max_metric_router_lsa_on_proc_restart_summary_lsa
  max_metric_router_lsa_on_proc_restart_summary_lsa_metric        = each.value.max_metric_router_lsa_on_proc_restart_summary_lsa_metric
  max_metric_router_lsa_on_proc_restart_external_lsa              = each.value.max_metric_router_lsa_on_proc_restart_external_lsa
  max_metric_router_lsa_on_proc_restart_external_lsa_metric       = each.value.max_metric_router_lsa_on_proc_restart_external_lsa_metric
  max_lsa                                                         = each.value.max_lsa
  max_lsa_threshold                                               = each.value.max_lsa_threshold
  max_lsa_warning_only                                            = each.value.max_lsa_warning_only
  max_lsa_ignore_time                                             = each.value.max_lsa_ignore_time
  max_lsa_ignore_count                                            = each.value.max_lsa_ignore_count
  max_lsa_reset_time                                              = each.value.max_lsa_reset_time
  timers_throttle_spf_initial_delay                               = each.value.timers_throttle_spf_initial_delay
  timers_throttle_spf_second_delay                                = each.value.timers_throttle_spf_second_delay
  timers_throttle_spf_maximum_delay                               = each.value.timers_throttle_spf_maximum_delay
  timers_throttle_lsa_all_initial_delay                           = each.value.timers_throttle_lsa_all_initial_delay
  timers_throttle_lsa_all_minimum_delay                           = each.value.timers_throttle_lsa_all_minimum_delay
  timers_throttle_lsa_all_maximum_delay                           = each.value.timers_throttle_lsa_all_maximum_delay
  timers_throttle_fast_reroute                                    = each.value.timers_throttle_fast_reroute
  timers_lsa_group_pacing                                         = each.value.timers_lsa_group_pacing
  timers_lsa_min_arrival                                          = each.value.timers_lsa_min_arrival
  timers_lsa_refresh                                              = each.value.timers_lsa_refresh
  timers_pacing_flood                                             = each.value.timers_pacing_flood
  nsf_interval                                                    = each.value.nsf_interval
  nsf_lifetime                                                    = each.value.nsf_lifetime
  nsf_flush_delay_time                                            = each.value.nsf_flush_delay_time
  nsf_cisco                                                       = each.value.nsf_cisco
  nsf_cisco_enforce_global                                        = each.value.nsf_cisco_enforce_global
  nsf_ietf                                                        = each.value.nsf_ietf
  nsf_ietf_strict_lsa_checking                                    = each.value.nsf_ietf_strict_lsa_checking
  nsf_ietf_helper_disable                                         = each.value.nsf_ietf_helper_disable
  address_family_ipv4_unicast                                     = each.value.address_family_ipv4_unicast
  maximum_interfaces                                              = each.value.maximum_interfaces
  maximum_paths                                                   = each.value.maximum_paths
  maximum_redistributed_prefixes                                  = each.value.maximum_redistributed_prefixes
  maximum_redistributed_prefixes_threshold                        = each.value.maximum_redistributed_prefixes_threshold
  maximum_redistributed_prefixes_warning_only                     = each.value.maximum_redistributed_prefixes_warning_only
  queue_limit_high                                                = each.value.queue_limit_high
  queue_limit_medium                                              = each.value.queue_limit_medium
  queue_limit_low                                                 = each.value.queue_limit_low
  queue_dispatch_incoming                                         = each.value.queue_dispatch_incoming
  queue_dispatch_rate_limited_lsa                                 = each.value.queue_dispatch_rate_limited_lsa
  queue_dispatch_flush_lsa                                        = each.value.queue_dispatch_flush_lsa
  queue_dispatch_spf_lsa_limit                                    = each.value.queue_dispatch_spf_lsa_limit
  summary_prefixes                                                = each.value.summary_prefixes
  spf_prefix_priority_route_policy                                = each.value.spf_prefix_priority_route_policy
  fast_reroute_per_prefix                                         = each.value.fast_reroute_per_prefix
  fast_reroute_per_prefix_priority_limit_critical                 = each.value.fast_reroute_per_prefix_priority_limit_critical
  fast_reroute_per_prefix_priority_limit_high                     = each.value.fast_reroute_per_prefix_priority_limit_high
  fast_reroute_per_prefix_priority_limit_medium                   = each.value.fast_reroute_per_prefix_priority_limit_medium
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
  fast_reroute_per_prefix_load_sharing_disable                    = each.value.fast_reroute_per_prefix_load_sharing_disable
  fast_reroute_per_prefix_exclude_interfaces                      = each.value.fast_reroute_per_prefix_exclude_interfaces
  fast_reroute_per_prefix_lfa_candidate_interfaces                = each.value.fast_reroute_per_prefix_lfa_candidate_interfaces
  fast_reroute_per_prefix_use_candidate_only_enable               = each.value.fast_reroute_per_prefix_use_candidate_only_enable
  fast_reroute_per_prefix_use_candidate_only_disable              = each.value.fast_reroute_per_prefix_use_candidate_only_disable
  fast_reroute_per_link                                           = each.value.fast_reroute_per_link
  fast_reroute_per_link_priority_limit_critical                   = each.value.fast_reroute_per_link_priority_limit_critical
  fast_reroute_per_link_priority_limit_high                       = each.value.fast_reroute_per_link_priority_limit_high
  fast_reroute_per_link_priority_limit_medium                     = each.value.fast_reroute_per_link_priority_limit_medium
  fast_reroute_per_link_exclude_interfaces                        = each.value.fast_reroute_per_link_exclude_interfaces
  fast_reroute_per_link_lfa_candidate_interfaces                  = each.value.fast_reroute_per_link_lfa_candidate_interfaces
  fast_reroute_per_link_use_candidate_only_enable                 = each.value.fast_reroute_per_link_use_candidate_only_enable
  fast_reroute_per_link_use_candidate_only_disable                = each.value.fast_reroute_per_link_use_candidate_only_disable
  fast_reroute_disable                                            = each.value.fast_reroute_disable
  loopback_stub_network_enable                                    = each.value.loopback_stub_network_enable
  loopback_stub_network_disable                                   = each.value.loopback_stub_network_disable
  link_down_fast_detect                                           = each.value.link_down_fast_detect
  weight                                                          = each.value.weight
  delay_normalize_interval                                        = each.value.delay_normalize_interval
  delay_normalize_offset                                          = each.value.delay_normalize_offset
  microloop_avoidance                                             = each.value.microloop_avoidance
  microloop_avoidance_protected                                   = each.value.microloop_avoidance_protected
  microloop_avoidance_segment_routing                             = each.value.microloop_avoidance_segment_routing
  microloop_avoidance_rib_update_delay                            = each.value.microloop_avoidance_rib_update_delay
  authentication_key_encrypted                                    = each.value.authentication_key_encrypted
  message_digest_keys                                             = each.value.message_digest_keys
  authentication_message_digest                                   = each.value.authentication_message_digest
  authentication_keychain                                         = each.value.authentication_keychain
  authentication_keychain_name                                    = each.value.authentication_keychain_name
  authentication_null                                             = each.value.authentication_null
  network_broadcast                                               = each.value.network_broadcast
  network_non_broadcast                                           = each.value.network_non_broadcast
  network_point_to_point                                          = each.value.network_point_to_point
  network_point_to_multipoint                                     = each.value.network_point_to_multipoint
  mpls_ldp_sync                                                   = each.value.mpls_ldp_sync
  cost                                                            = each.value.cost
  cost_fallback_anomaly_delay_igp_metric_increment                = each.value.cost_fallback_anomaly_delay_igp_metric_increment
  cost_fallback_anomaly_delay_igp_metric_multiplier               = each.value.cost_fallback_anomaly_delay_igp_metric_multiplier
  cost_fallback_anomaly_delay_igp_metric_value                    = each.value.cost_fallback_anomaly_delay_igp_metric_value
  cost_fallback_anomaly_delay_te_metric_increment                 = each.value.cost_fallback_anomaly_delay_te_metric_increment
  cost_fallback_anomaly_delay_te_metric_multiplier                = each.value.cost_fallback_anomaly_delay_te_metric_multiplier
  cost_fallback_anomaly_delay_te_metric_value                     = each.value.cost_fallback_anomaly_delay_te_metric_value
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
  external_out_enable                                             = each.value.external_out_enable
  external_out_disable                                            = each.value.external_out_disable
  summary_in_enable                                               = each.value.summary_in_enable
  summary_in_disable                                              = each.value.summary_in_disable
  adjacency_stagger_disable                                       = each.value.adjacency_stagger_disable
  adjacency_stagger_initial_neighbors                             = each.value.adjacency_stagger_initial_neighbors
  adjacency_stagger_simultaneous_neighbors                        = each.value.adjacency_stagger_simultaneous_neighbors
  snmp_context                                                    = each.value.snmp_context
  snmp_trap                                                       = each.value.snmp_trap
  ucmp                                                            = each.value.ucmp
  ucmp_variance                                                   = each.value.ucmp_variance
  ucmp_prefix_list                                                = each.value.ucmp_prefix_list
  ucmp_exclude_interfaces                                         = each.value.ucmp_exclude_interfaces
  ucmp_delay_interval                                             = each.value.ucmp_delay_interval
  max_external_lsa                                                = each.value.max_external_lsa
  max_external_lsa_threshold                                      = each.value.max_external_lsa_threshold
  max_external_lsa_suppress_neighbor                              = each.value.max_external_lsa_suppress_neighbor
  max_external_lsa_warning_only                                   = each.value.max_external_lsa_warning_only
  exchange_timer                                                  = each.value.exchange_timer
  exchange_timer_hold_time                                        = each.value.exchange_timer_hold_time
  exchange_timer_recovery_count                                   = each.value.exchange_timer_recovery_count

  depends_on = [
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain,
    iosxr_vrf.vrf,
    iosxr_router_ospf_area.router_ospf_area
  ]
}
