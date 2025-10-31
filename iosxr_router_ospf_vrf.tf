locals {
  router_ospf_vrf = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for vrf in try(ospf_process.vrfs, []) : {
          key                                       = format("%s/%s/%s", device.name, ospf_process.id, vrf.vrf_name)
          device_name                               = device.name
          process_name                              = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
          vrf_name                                  = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.vrf_name, null)
          auto_cost_disable                         = try(vrf.auto_cost_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.auto_cost_disable, null)
          auto_cost_reference_bandwidth             = try(vrf.auto_cost_reference_bandwidth, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.auto_cost_reference_bandwidth, null)
          bfd_fast_detect                           = try(vrf.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_fast_detect, null)
          bfd_minimum_interval                      = try(vrf.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_minimum_interval, null)
          bfd_multiplier                            = try(vrf.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.bfd_multiplier, null)
          dead_interval                             = try(vrf.dead_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.dead_interval, null)
          default_information_originate             = try(vrf.default_information_originate, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate, null)
          default_information_originate_always      = try(vrf.default_information_originate_always, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate_always, null)
          default_information_originate_metric_type = try(vrf.default_information_originate_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.default_information_originate_metric_type, null)
          hello_interval                            = try(vrf.hello_interval, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.hello_interval, null)
          mpls_ldp_sync                             = try(vrf.mpls_ldp_sync, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.mpls_ldp_sync, null)
          mtu_ignore_disable                        = try(vrf.mtu_ignore_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.mtu_ignore_disable, null)
          mtu_ignore_enable                         = try(vrf.mtu_ignore_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.mtu_ignore_enable, null)
          passive_disable                           = try(vrf.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.passive_disable, null)
          passive_enable                            = try(vrf.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.passive_enable, null)
          priority                                  = try(vrf.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.priority, null)
          redistribute_connected                    = try(vrf.redistribute_connected, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected, null)
          redistribute_connected_metric_type        = try(vrf.redistribute_connected_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_metric_type, null)
          redistribute_connected_tag                = try(vrf.redistribute_connected_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_connected_tag, null)
          redistribute_static                       = try(vrf.redistribute_static, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static, null)
          redistribute_static_metric_type           = try(vrf.redistribute_static_metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_metric_type, null)
          redistribute_static_tag                   = try(vrf.redistribute_static_tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_static_tag, null)
          router_id                                 = try(vrf.router_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.router_id, null)
          areas = try(length(vrf.areas) == 0, true) ? null : [for area in vrf.areas : {
            area_id = try(area.area_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.area_id, null)
            }
          ]
          redistribute_bgp = try(length(vrf.redistribute_bgp) == 0, true) ? null : [for bgp in vrf.redistribute_bgp : {
            as_number   = try(bgp.as_number, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.as_number, null)
            metric_type = try(bgp.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.metric_type, null)
            tag         = try(bgp.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_bgp.tag, null)
            }
          ]
          redistribute_isis = try(length(vrf.redistribute_isis) == 0, true) ? null : [for isis in vrf.redistribute_isis : {
            instance_name = try(isis.instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.instance_id, null)
            level_1       = try(isis.level_1, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.level_1, null)
            level_1_2     = try(isis.level_1_2, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.level_1_2, null)
            level_2       = try(isis.level_2, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.level_2, null)
            metric_type   = try(isis.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.metric_type, null)
            tag           = try(isis.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_isis.tag, null)
            }
          ]
          redistribute_ospf = try(length(vrf.redistribute_ospf) == 0, true) ? null : [for ospf in vrf.redistribute_ospf : {
            instance_name       = try(ospf.instance_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.instance_id, null)
            match_external      = try(ospf.match_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_external, null)
            match_internal      = try(ospf.match_internal, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_internal, null)
            match_nssa_external = try(ospf.match_nssa_external, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.match_nssa_external, null)
            metric_type         = try(ospf.metric_type, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.metric_type, null)
            tag                 = try(ospf.tag, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.redistribute_ospf.tag, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_ospf_vrf" "router_ospf_vrf" {
  for_each                                  = { for vrf in local.router_ospf_vrf : vrf.key => vrf }
  device                                    = each.value.device_name
  process_name                              = each.value.process_name
  vrf_name                                  = each.value.vrf_name
  auto_cost_disable                         = each.value.auto_cost_disable
  auto_cost_reference_bandwidth             = each.value.auto_cost_reference_bandwidth
  bfd_fast_detect                           = each.value.bfd_fast_detect
  bfd_minimum_interval                      = each.value.bfd_minimum_interval
  bfd_multiplier                            = each.value.bfd_multiplier
  dead_interval                             = each.value.dead_interval
  default_information_originate             = each.value.default_information_originate
  default_information_originate_always      = each.value.default_information_originate_always
  default_information_originate_metric_type = each.value.default_information_originate_metric_type
  hello_interval                            = each.value.hello_interval
  mpls_ldp_sync                             = each.value.mpls_ldp_sync
  mtu_ignore_disable                        = each.value.mtu_ignore_disable
  mtu_ignore_enable                         = each.value.mtu_ignore_enable
  passive_disable                           = each.value.passive_disable
  passive_enable                            = each.value.passive_enable
  priority                                  = each.value.priority
  redistribute_connected                    = each.value.redistribute_connected
  redistribute_connected_metric_type        = each.value.redistribute_connected_metric_type
  redistribute_connected_tag                = each.value.redistribute_connected_tag
  redistribute_static                       = each.value.redistribute_static
  redistribute_static_metric_type           = each.value.redistribute_static_metric_type
  redistribute_static_tag                   = each.value.redistribute_static_tag
  router_id                                 = each.value.router_id
  areas                                     = each.value.areas
  redistribute_bgp                          = each.value.redistribute_bgp
  redistribute_isis                         = each.value.redistribute_isis
  redistribute_ospf                         = each.value.redistribute_ospf

  depends_on = [
    iosxr_router_ospf.router_ospf
  ]
}
