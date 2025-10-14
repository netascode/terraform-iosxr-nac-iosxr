locals {
  device_router_ospf = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].router_ospf, []) : {
        device_name = device.name
        key         = "${device.name}-${ospf_process.process_name}"

        process_name                              = try(ospf_process.process_name, local.defaults.iosxr.configuration.router_ospf.process_name, null)
        mpls_ldp_sync                             = try(ospf_process.mpls_ldp_sync, local.defaults.iosxr.configuration.router_ospf.mpls_ldp_sync, null)
        hello_interval                            = try(ospf_process.hello_interval, local.defaults.iosxr.configuration.router_ospf.hello_interval, null)
        dead_interval                             = try(ospf_process.dead_interval, local.defaults.iosxr.configuration.router_ospf.dead_interval, null)
        priority                                  = try(ospf_process.priority, local.defaults.iosxr.configuration.router_ospf.priority, null)
        mtu_ignore_enable                         = try(ospf_process.mtu_ignore_enable, local.defaults.iosxr.configuration.router_ospf.mtu_ignore_enable, null)
        mtu_ignore_disable                        = try(ospf_process.mtu_ignore_disable, local.defaults.iosxr.configuration.router_ospf.mtu_ignore_disable, null)
        passive_enable                            = try(ospf_process.passive_enable, local.defaults.iosxr.configuration.router_ospf.passive_enable, null)
        passive_disable                           = try(ospf_process.passive_disable, local.defaults.iosxr.configuration.router_ospf.passive_disable, null)
        router_id                                 = try(ospf_process.router_id, local.defaults.iosxr.configuration.router_ospf.router_id, null)
        redistribute_connected                    = try(ospf_process.redistribute_connected, local.defaults.iosxr.configuration.router_ospf.redistribute_connected, null)
        redistribute_connected_tag                = try(ospf_process.redistribute_connected_tag, local.defaults.iosxr.configuration.router_ospf.redistribute_connected_tag, null)
        redistribute_connected_metric_type        = try(ospf_process.redistribute_connected_metric_type, local.defaults.iosxr.configuration.router_ospf.redistribute_connected_metric_type, null)
        redistribute_static                       = try(ospf_process.redistribute_static, local.defaults.iosxr.configuration.router_ospf.redistribute_static, null)
        redistribute_static_tag                   = try(ospf_process.redistribute_static_tag, local.defaults.iosxr.configuration.router_ospf.redistribute_static_tag, null)
        redistribute_static_metric_type           = try(ospf_process.redistribute_static_metric_type, local.defaults.iosxr.configuration.router_ospf.redistribute_static_metric_type, null)
        bfd_fast_detect                           = try(ospf_process.bfd_fast_detect, local.defaults.iosxr.configuration.router_ospf.bfd_fast_detect, null)
        bfd_minimum_interval                      = try(ospf_process.bfd_minimum_interval, local.defaults.iosxr.configuration.router_ospf.bfd_minimum_interval, null)
        bfd_multiplier                            = try(ospf_process.bfd_multiplier, local.defaults.iosxr.configuration.router_ospf.bfd_multiplier, null)
        default_information_originate             = try(ospf_process.default_information_originate, local.defaults.iosxr.configuration.router_ospf.default_information_originate, null)
        default_information_originate_always      = try(ospf_process.default_information_originate_always, local.defaults.iosxr.configuration.router_ospf.default_information_originate_always, null)
        default_information_originate_metric_type = try(ospf_process.default_information_originate_metric_type, local.defaults.iosxr.configuration.router_ospf.default_information_originate_metric_type, null)
        auto_cost_reference_bandwidth             = try(ospf_process.auto_cost_reference_bandwidth, local.defaults.iosxr.configuration.router_ospf.auto_cost_reference_bandwidth, null)
        auto_cost_disable                         = try(ospf_process.auto_cost_disable, local.defaults.iosxr.configuration.router_ospf.auto_cost_disable, null)
        segment_routing_mpls                      = try(ospf_process.segment_routing_mpls, local.defaults.iosxr.configuration.router_ospf.segment_routing_mpls, null)
        segment_routing_sr_prefer                 = try(ospf_process.segment_routing_sr_prefer, local.defaults.iosxr.configuration.router_ospf.segment_routing_sr_prefer, null)

        areas = [
          for area in try(ospf_process.areas, local.defaults.iosxr.configuration.router_ospf.areas, []) : {
            area_id = try(area.area_id, local.defaults.iosxr.configuration.router_ospf.area_id, null)
          }
        ]

        redistribute_bgp = [
          for bgp in try(ospf_process.redistribute_bgp, local.defaults.iosxr.configuration.router_ospf.redistribute_bgp, []) : {
            as_number   = try(bgp.as_number, local.defaults.iosxr.configuration.router_ospf.redistribute_bgp_as_number, null)
            tag         = try(bgp.tag, local.defaults.iosxr.configuration.router_ospf.redistribute_bgp_tag, null)
            metric_type = try(bgp.metric_type, local.defaults.iosxr.configuration.router_ospf.redistribute_bgp_metric_type, null)
          }
        ]

        redistribute_isis = [
          for isis in try(ospf_process.redistribute_isis, local.defaults.iosxr.configuration.router_ospf.redistribute_isis, []) : {
            instance_name = try(isis.instance_name, local.defaults.iosxr.configuration.router_ospf.redistribute_isis_instance_name, null)
            level_1       = try(isis.level_1, local.defaults.iosxr.configuration.router_ospf.redistribute_isis_level_1, null)
            level_2       = try(isis.level_2, local.defaults.iosxr.configuration.router_ospf.redistribute_isis_level_2, null)
            level_1_2     = try(isis.level_1_2, local.defaults.iosxr.configuration.router_ospf.redistribute_isis_level_1_2, null)
            tag           = try(isis.tag, local.defaults.iosxr.configuration.router_ospf.redistribute_isis_tag, null)
            metric_type   = try(isis.metric_type, local.defaults.iosxr.configuration.router_ospf.redistribute_isis_metric_type, null)
          }
        ]

        redistribute_ospf = [
          for ospf in try(ospf_process.redistribute_ospf, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf, []) : {
            instance_name       = try(ospf.instance_name, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf_instance_name, null)
            match_internal      = try(ospf.match_internal, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf_match_internal, null)
            match_external      = try(ospf.match_external, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf_match_external, null)
            match_nssa_external = try(ospf.match_nssa_external, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf_match_nssa_external, null)
            tag                 = try(ospf.tag, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf_tag, null)
            metric_type         = try(ospf.metric_type, local.defaults.iosxr.configuration.router_ospf.redistribute_ospf_metric_type, null)
          }
        ]
      }
    ]
    if try(local.device_config[device.name].router_ospf, null) != null
  ])
}

resource "iosxr_router_ospf" "router_ospf" {
  for_each = { for ospf in local.device_router_ospf : ospf.key => ospf }

  device = each.value.device_name

  process_name                              = each.value.process_name
  mpls_ldp_sync                             = each.value.mpls_ldp_sync
  hello_interval                            = each.value.hello_interval
  dead_interval                             = each.value.dead_interval
  priority                                  = each.value.priority
  mtu_ignore_enable                         = each.value.mtu_ignore_enable
  mtu_ignore_disable                        = each.value.mtu_ignore_disable
  passive_enable                            = each.value.passive_enable
  passive_disable                           = each.value.passive_disable
  router_id                                 = each.value.router_id
  redistribute_connected                    = each.value.redistribute_connected
  redistribute_connected_tag                = each.value.redistribute_connected_tag
  redistribute_connected_metric_type        = each.value.redistribute_connected_metric_type
  redistribute_static                       = each.value.redistribute_static
  redistribute_static_tag                   = each.value.redistribute_static_tag
  redistribute_static_metric_type           = each.value.redistribute_static_metric_type
  bfd_fast_detect                           = each.value.bfd_fast_detect
  bfd_minimum_interval                      = each.value.bfd_minimum_interval
  bfd_multiplier                            = each.value.bfd_multiplier
  default_information_originate             = each.value.default_information_originate
  default_information_originate_always      = each.value.default_information_originate_always
  default_information_originate_metric_type = each.value.default_information_originate_metric_type
  auto_cost_reference_bandwidth             = each.value.auto_cost_reference_bandwidth
  auto_cost_disable                         = each.value.auto_cost_disable
  segment_routing_mpls                      = each.value.segment_routing_mpls
  segment_routing_sr_prefer                 = each.value.segment_routing_sr_prefer
  areas                                     = each.value.areas
  redistribute_bgp                          = each.value.redistribute_bgp
  redistribute_isis                         = each.value.redistribute_isis
  redistribute_ospf                         = each.value.redistribute_ospf
}