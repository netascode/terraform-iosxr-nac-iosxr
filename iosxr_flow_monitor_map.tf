locals {
  device_flow_monitor_map = flatten([
    for device in local.devices : [
      for flow_monitor_map in try(local.device_config[device.name].flow_monitor_map, []) : {
        key  = "${device.name}-${flow_monitor_map.name}"
        name = try(flow_monitor_map.name, local.defaults.iosxr.configuration.flow_monitor_map.name, null)
        exporters = try(length(flow_monitor_map.exporters) == 0, true) ? null : [for exporter in flow_monitor_map.exporters : {
          name = try(exporter.name, local.defaults.iosxr.configuration.flow_monitor_map.exporters.name, null)
        }]
        option_outphysint                          = try(flow_monitor_map.option_outphysint, local.defaults.iosxr.configuration.flow_monitor_map.option_outphysint, null)
        option_filtered                            = try(flow_monitor_map.option_filtered, local.defaults.iosxr.configuration.flow_monitor_map.option_filtered, null)
        option_bgpattr                             = try(flow_monitor_map.option_bgpattr, local.defaults.iosxr.configuration.flow_monitor_map.option_bgpattr, null)
        option_outbundlemember                     = try(flow_monitor_map.option_outbundlemember, local.defaults.iosxr.configuration.flow_monitor_map.option_outbundlemember, null)
        record_ipv4                                = try(flow_monitor_map.record_ipv4, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4, null)
        record_ipv4_destination                    = try(flow_monitor_map.record_ipv4_destination, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_destination, null)
        record_ipv4_destination_tos                = try(flow_monitor_map.record_ipv4_destination_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_destination_tos, null)
        record_ipv4_as                             = try(flow_monitor_map.record_ipv4_as, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_as, null)
        record_ipv4_protocol_port                  = try(flow_monitor_map.record_ipv4_protocol_port, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_protocol_port, null)
        record_ipv4_prefix                         = try(flow_monitor_map.record_ipv4_prefix, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_prefix, null)
        record_ipv4_source_prefix                  = try(flow_monitor_map.record_ipv4_source_prefix, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_source_prefix, null)
        record_ipv4_destination_prefix             = try(flow_monitor_map.record_ipv4_destination_prefix, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_destination_prefix, null)
        record_ipv4_as_tos                         = try(flow_monitor_map.record_ipv4_as_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_as_tos, null)
        record_ipv4_protocol_port_tos              = try(flow_monitor_map.record_ipv4_protocol_port_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_protocol_port_tos, null)
        record_ipv4_prefix_tos                     = try(flow_monitor_map.record_ipv4_prefix_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_prefix_tos, null)
        record_ipv4_source_prefix_tos              = try(flow_monitor_map.record_ipv4_source_prefix_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_source_prefix_tos, null)
        record_ipv4_destination_prefix_tos         = try(flow_monitor_map.record_ipv4_destination_prefix_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_destination_prefix_tos, null)
        record_ipv4_prefix_port                    = try(flow_monitor_map.record_ipv4_prefix_port, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_prefix_port, null)
        record_ipv4_bgp_nexthop_tos                = try(flow_monitor_map.record_ipv4_bgp_nexthop_tos, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_bgp_nexthop_tos, null)
        record_ipv4_peer_as                        = try(flow_monitor_map.record_ipv4_peer_as, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_peer_as, null)
        record_ipv4_gtp                            = try(flow_monitor_map.record_ipv4_gtp, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv4_gtp, null)
        record_ipv6                                = try(flow_monitor_map.record_ipv6, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv6, null)
        record_ipv6_destination                    = try(flow_monitor_map.record_ipv6_destination, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv6_destination, null)
        record_ipv6_peer_as                        = try(flow_monitor_map.record_ipv6_peer_as, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv6_peer_as, null)
        record_ipv6_gtp                            = try(flow_monitor_map.record_ipv6_gtp, local.defaults.iosxr.configuration.flow_monitor_map.record_ipv6_gtp, null)
        record_mpls                                = try(flow_monitor_map.record_mpls, local.defaults.iosxr.configuration.flow_monitor_map.record_mpls, null)
        record_mpls_ipv4_fields                    = try(flow_monitor_map.record_mpls_ipv4_fields, local.defaults.iosxr.configuration.flow_monitor_map.record_mpls_ipv4_fields, null)
        record_mpls_ipv6_fields                    = try(flow_monitor_map.record_mpls_ipv6_fields, local.defaults.iosxr.configuration.flow_monitor_map.record_mpls_ipv6_fields, null)
        record_mpls_ipv4_ipv6_fields               = try(flow_monitor_map.record_mpls_ipv4_ipv6_fields, local.defaults.iosxr.configuration.flow_monitor_map.record_mpls_ipv4_ipv6_fields, null)
        record_mpls_labels                         = try(flow_monitor_map.record_mpls_labels, local.defaults.iosxr.configuration.flow_monitor_map.record_mpls_labels, null)
        record_map_t                               = try(flow_monitor_map.record_map_t, local.defaults.iosxr.configuration.flow_monitor_map.record_map_t, null)
        record_sflow                               = try(flow_monitor_map.record_sflow, local.defaults.iosxr.configuration.flow_monitor_map.record_sflow, null)
        record_datalink_record                     = try(flow_monitor_map.record_datalink_record, local.defaults.iosxr.configuration.flow_monitor_map.record_datalink_record, null)
        record_default_rtp                         = try(flow_monitor_map.record_default_rtp, local.defaults.iosxr.configuration.flow_monitor_map.record_default_rtp, null)
        record_default_mdi                         = try(flow_monitor_map.record_default_mdi, local.defaults.iosxr.configuration.flow_monitor_map.record_default_mdi, null)
        cache_entries                              = try(flow_monitor_map.cache_entries, local.defaults.iosxr.configuration.flow_monitor_map.cache_entries, null)
        cache_timeout_active                       = try(flow_monitor_map.cache_timeout_active, local.defaults.iosxr.configuration.flow_monitor_map.cache_timeout_active, null)
        cache_timeout_inactive                     = try(flow_monitor_map.cache_timeout_inactive, local.defaults.iosxr.configuration.flow_monitor_map.cache_timeout_inactive, null)
        cache_timeout_update                       = try(flow_monitor_map.cache_timeout_update, local.defaults.iosxr.configuration.flow_monitor_map.cache_timeout_update, null)
        cache_timeout_rate_limit                   = try(flow_monitor_map.cache_timeout_rate_limit, local.defaults.iosxr.configuration.flow_monitor_map.cache_timeout_rate_limit, null)
        cache_permanent                            = try(flow_monitor_map.cache_permanent, local.defaults.iosxr.configuration.flow_monitor_map.cache_permanent, null)
        cache_immediate                            = try(flow_monitor_map.cache_immediate, local.defaults.iosxr.configuration.flow_monitor_map.cache_immediate, null)
        hw_cache_timeout_inactive                  = try(flow_monitor_map.hw_cache_timeout_inactive, local.defaults.iosxr.configuration.flow_monitor_map.hw_cache_timeout_inactive, null)
        sflow_options                              = try(flow_monitor_map.sflow_options, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options, null)
        sflow_options_extended_router              = try(flow_monitor_map.sflow_options_extended_router, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_extended_router, null)
        sflow_options_extended_gateway             = try(flow_monitor_map.sflow_options_extended_gateway, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_extended_gateway, null)
        sflow_options_extended_ipv4_tunnel_egress  = try(flow_monitor_map.sflow_options_extended_ipv4_tunnel_egress, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_extended_ipv4_tunnel_egress, null)
        sflow_options_extended_ipv6_tunnel_egress  = try(flow_monitor_map.sflow_options_extended_ipv6_tunnel_egress, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_extended_ipv6_tunnel_egress, null)
        sflow_options_if_counters_polling_interval = try(flow_monitor_map.sflow_options_if_counters_polling_interval, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_if_counters_polling_interval, null)
        sflow_options_sample_header_size           = try(flow_monitor_map.sflow_options_sample_header_size, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_sample_header_size, null)
        sflow_options_input_ifindex                = try(flow_monitor_map.sflow_options_input_ifindex, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_input_ifindex, null)
        sflow_options_output_ifindex               = try(flow_monitor_map.sflow_options_output_ifindex, local.defaults.iosxr.configuration.flow_monitor_map.sflow_options_output_ifindex, null)
      }
    ]
    if try(local.device_config[device.name].flow_monitor_map, null) != null || try(local.defaults.iosxr.configuration.flow_monitor_map, null) != null
  ])
}

resource "iosxr_flow_monitor_map" "flow_monitor_map" {
  for_each                                   = { for flow_monitor_map in local.device_flow_monitor_map : flow_monitor_map.key => flow_monitor_map }
  name                                       = each.value.name
  exporters                                  = each.value.exporters
  option_outphysint                          = each.value.option_outphysint
  option_filtered                            = each.value.option_filtered
  option_bgpattr                             = each.value.option_bgpattr
  option_outbundlemember                     = each.value.option_outbundlemember
  record_ipv4                                = each.value.record_ipv4
  record_ipv4_destination                    = each.value.record_ipv4_destination
  record_ipv4_destination_tos                = each.value.record_ipv4_destination_tos
  record_ipv4_as                             = each.value.record_ipv4_as
  record_ipv4_protocol_port                  = each.value.record_ipv4_protocol_port
  record_ipv4_prefix                         = each.value.record_ipv4_prefix
  record_ipv4_source_prefix                  = each.value.record_ipv4_source_prefix
  record_ipv4_destination_prefix             = each.value.record_ipv4_destination_prefix
  record_ipv4_as_tos                         = each.value.record_ipv4_as_tos
  record_ipv4_protocol_port_tos              = each.value.record_ipv4_protocol_port_tos
  record_ipv4_prefix_tos                     = each.value.record_ipv4_prefix_tos
  record_ipv4_source_prefix_tos              = each.value.record_ipv4_source_prefix_tos
  record_ipv4_destination_prefix_tos         = each.value.record_ipv4_destination_prefix_tos
  record_ipv4_prefix_port                    = each.value.record_ipv4_prefix_port
  record_ipv4_bgp_nexthop_tos                = each.value.record_ipv4_bgp_nexthop_tos
  record_ipv4_peer_as                        = each.value.record_ipv4_peer_as
  record_ipv4_gtp                            = each.value.record_ipv4_gtp
  record_ipv6                                = each.value.record_ipv6
  record_ipv6_destination                    = each.value.record_ipv6_destination
  record_ipv6_peer_as                        = each.value.record_ipv6_peer_as
  record_ipv6_gtp                            = each.value.record_ipv6_gtp
  record_mpls                                = each.value.record_mpls
  record_mpls_ipv4_fields                    = each.value.record_mpls_ipv4_fields
  record_mpls_ipv6_fields                    = each.value.record_mpls_ipv6_fields
  record_mpls_ipv4_ipv6_fields               = each.value.record_mpls_ipv4_ipv6_fields
  record_mpls_labels                         = each.value.record_mpls_labels
  record_map_t                               = each.value.record_map_t
  record_sflow                               = each.value.record_sflow
  record_datalink_record                     = each.value.record_datalink_record
  record_default_rtp                         = each.value.record_default_rtp
  record_default_mdi                         = each.value.record_default_mdi
  cache_entries                              = each.value.cache_entries
  cache_timeout_active                       = each.value.cache_timeout_active
  cache_timeout_inactive                     = each.value.cache_timeout_inactive
  cache_timeout_update                       = each.value.cache_timeout_update
  cache_timeout_rate_limit                   = each.value.cache_timeout_rate_limit
  cache_permanent                            = each.value.cache_permanent
  cache_immediate                            = each.value.cache_immediate
  hw_cache_timeout_inactive                  = each.value.hw_cache_timeout_inactive
  sflow_options                              = each.value.sflow_options
  sflow_options_extended_router              = each.value.sflow_options_extended_router
  sflow_options_extended_gateway             = each.value.sflow_options_extended_gateway
  sflow_options_extended_ipv4_tunnel_egress  = each.value.sflow_options_extended_ipv4_tunnel_egress
  sflow_options_extended_ipv6_tunnel_egress  = each.value.sflow_options_extended_ipv6_tunnel_egress
  sflow_options_if_counters_polling_interval = each.value.sflow_options_if_counters_polling_interval
  sflow_options_sample_header_size           = each.value.sflow_options_sample_header_size
  sflow_options_input_ifindex                = each.value.sflow_options_input_ifindex
  sflow_options_output_ifindex               = each.value.sflow_options_output_ifindex
}
