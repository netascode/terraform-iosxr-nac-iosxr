##### FLOW #####

locals {
  flow_exporter_maps = flatten([
    for device in local.devices : [
      for exporter in try(local.device_config[device.name].flow.exporters, []) : {
        key                                     = format("%s/%s", device.name, exporter.name)
        device_name                             = device.name
        name                                    = try(exporter.name, local.defaults.iosxr.devices.configuration.flow.exporters.name, null)
        destination_ipv4_address                = try(can(regex(":", exporter.destination_address)) == false ? exporter.destination_address : null, local.defaults.iosxr.devices.configuration.flow.exporters.destination_ipv4_address, null)
        destination_ipv6_address                = try(can(regex(":", exporter.destination_address)) == true ? exporter.destination_address : null, local.defaults.iosxr.devices.configuration.flow.exporters.destination_ipv6_address, null)
        destination_vrf                         = try(exporter.destination_vrf, local.defaults.iosxr.devices.configuration.flow.exporters.destination_vrf, null)
        source                                  = try(exporter.source_interface, local.defaults.iosxr.devices.configuration.flow.exporters.source_interface, null)
        source_address_ipv4_address             = try(can(regex(":", exporter.source_address)) == false ? exporter.source_address : null, local.defaults.iosxr.devices.configuration.flow.exporters.source_address_ipv4_address, null)
        source_address_ipv6_address             = try(can(regex(":", exporter.source_address)) == true ? exporter.source_address : null, local.defaults.iosxr.devices.configuration.flow.exporters.source_address_ipv6_address, null)
        router_id_ipv4_address                  = try(can(regex(":", exporter.router_id)) == false ? exporter.router_id : null, local.defaults.iosxr.devices.configuration.flow.exporters.router_id_ipv4_address, null)
        router_id_ipv6_address                  = try(can(regex(":", exporter.router_id)) == true ? exporter.router_id : null, local.defaults.iosxr.devices.configuration.flow.exporters.router_id_ipv6_address, null)
        dscp                                    = try(exporter.dscp, local.defaults.iosxr.devices.configuration.flow.exporters.dscp, null)
        transport_udp                           = try(exporter.transport.udp_destination, local.defaults.iosxr.devices.configuration.flow.exporters.transport.udp_destination, null)
        packet_length                           = try(exporter.packet_length, local.defaults.iosxr.devices.configuration.flow.exporters.packet_length, null)
        dfbit_set                               = try(exporter.dfbit_set, local.defaults.iosxr.devices.configuration.flow.exporters.dfbit_set, null)
        version_export_format                   = try(exporter.version.format, local.defaults.iosxr.devices.configuration.flow.exporters.version.format, null)
        version_template_data_timeout           = try(exporter.version.template.data_timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.template.data_timeout, null)
        version_template_options_timeout        = try(exporter.version.template.options_timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.template.options_timeout, null)
        version_template_timeout                = try(exporter.version.template.timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.template.timeout, null)
        version_options_interface_table_timeout = try(exporter.version.options.interface_table_timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.options.interface_table_timeout, null)
        version_options_sampler_table_timeout   = try(exporter.version.options.sampler_table_timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.options.sampler_table_timeout, null)
        version_options_class_table_timeout     = try(exporter.version.options.class_table_timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.options.class_table_timeout, null)
        version_options_vrf_table_timeout       = try(exporter.version.options.vrf_table_timeout, local.defaults.iosxr.devices.configuration.flow.exporters.version.options.vrf_table_timeout, null)
      }
    ]
  ])
}

resource "iosxr_flow_exporter_map" "flow_exporter_map" {
  for_each                                = { for exporter in local.flow_exporter_maps : exporter.key => exporter }
  device                                  = each.value.device_name
  name                                    = each.value.name
  destination_ipv4_address                = each.value.destination_ipv4_address
  destination_ipv6_address                = each.value.destination_ipv6_address
  destination_vrf                         = each.value.destination_vrf
  source                                  = each.value.source
  source_address_ipv4_address             = each.value.source_address_ipv4_address
  source_address_ipv6_address             = each.value.source_address_ipv6_address
  router_id_ipv4_address                  = each.value.router_id_ipv4_address
  router_id_ipv6_address                  = each.value.router_id_ipv6_address
  dscp                                    = each.value.dscp
  transport_udp                           = each.value.transport_udp
  packet_length                           = each.value.packet_length
  dfbit_set                               = each.value.dfbit_set
  version_export_format                   = each.value.version_export_format
  version_template_data_timeout           = each.value.version_template_data_timeout
  version_template_options_timeout        = each.value.version_template_options_timeout
  version_template_timeout                = each.value.version_template_timeout
  version_options_interface_table_timeout = each.value.version_options_interface_table_timeout
  version_options_sampler_table_timeout   = each.value.version_options_sampler_table_timeout
  version_options_class_table_timeout     = each.value.version_options_class_table_timeout
  version_options_vrf_table_timeout       = each.value.version_options_vrf_table_timeout

  depends_on = [
    iosxr_vrf.vrf
  ]
}

locals {
  flow_sampler_maps = flatten([
    for device in local.devices : [
      for sampler_map in try(local.device_config[device.name].flow.samplers, []) : {
        key         = format("%s/%s", device.name, sampler_map.name)
        device_name = device.name
        name        = try(sampler_map.name, local.defaults.iosxr.devices.configuration.flow.samplers.name, null)
        random      = try(sampler_map.random, local.defaults.iosxr.devices.configuration.flow.samplers.random, null)
        out_of      = try(sampler_map.out_of, local.defaults.iosxr.devices.configuration.flow.samplers.out_of, null)
      }
    ]
  ])
}

resource "iosxr_flow_sampler_map" "flow_sampler_map" {
  for_each = { for sampler_map in local.flow_sampler_maps : sampler_map.key => sampler_map }
  device   = each.value.device_name
  name     = each.value.name
  random   = each.value.random
  out_of   = each.value.out_of
}

locals {
  flow_monitor_maps = flatten([
    for device in local.devices : [
      for flow_monitor_map in try(local.device_config[device.name].flow.monitors, []) : {
        key         = format("%s/%s", device.name, flow_monitor_map.name)
        device_name = device.name
        name        = try(flow_monitor_map.name, local.defaults.iosxr.devices.configuration.flow.monitors.name, null)
        exporters = try(length(flow_monitor_map.exporters) == 0, true) ? null : [for exporter in flow_monitor_map.exporters : {
          name = try(exporter.name, local.defaults.iosxr.devices.configuration.flow.monitors.exporters.name, null)
        }]
        option_outphysint                          = try(flow_monitor_map.options.outphysint, local.defaults.iosxr.devices.configuration.flow.monitors.options.outphysint, null)
        option_filtered                            = try(flow_monitor_map.options.filtered, local.defaults.iosxr.devices.configuration.flow.monitors.options.filtered, null)
        option_bgpattr                             = try(flow_monitor_map.options.bgpattr, local.defaults.iosxr.devices.configuration.flow.monitors.options.bgpattr, null)
        option_outbundlemember                     = try(flow_monitor_map.options.outbundlemember, local.defaults.iosxr.devices.configuration.flow.monitors.options.outbundlemember, null)
        record_ipv4                                = try(flow_monitor_map.record.ipv4, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4, null)
        record_ipv4_destination                    = try(flow_monitor_map.record.ipv4_destination, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_destination, null)
        record_ipv4_destination_tos                = try(flow_monitor_map.record.ipv4_destination_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_destination_tos, null)
        record_ipv4_as                             = try(flow_monitor_map.record.ipv4_as, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_as, null)
        record_ipv4_protocol_port                  = try(flow_monitor_map.record.ipv4_protocol_port, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_protocol_port, null)
        record_ipv4_prefix                         = try(flow_monitor_map.record.ipv4_prefix, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_prefix, null)
        record_ipv4_source_prefix                  = try(flow_monitor_map.record.ipv4_source_prefix, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_source_prefix, null)
        record_ipv4_destination_prefix             = try(flow_monitor_map.record.ipv4_destination_prefix, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_destination_prefix, null)
        record_ipv4_as_tos                         = try(flow_monitor_map.record.ipv4_as_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_as_tos, null)
        record_ipv4_protocol_port_tos              = try(flow_monitor_map.record.ipv4_protocol_port_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_protocol_port_tos, null)
        record_ipv4_prefix_tos                     = try(flow_monitor_map.record.ipv4_prefix_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_prefix_tos, null)
        record_ipv4_source_prefix_tos              = try(flow_monitor_map.record.ipv4_source_prefix_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_source_prefix_tos, null)
        record_ipv4_destination_prefix_tos         = try(flow_monitor_map.record.ipv4_destination_prefix_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_destination_prefix_tos, null)
        record_ipv4_prefix_port                    = try(flow_monitor_map.record.ipv4_prefix_port, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_prefix_port, null)
        record_ipv4_bgp_nexthop_tos                = try(flow_monitor_map.record.ipv4_bgp_nexthop_tos, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_bgp_nexthop_tos, null)
        record_ipv4_peer_as                        = try(flow_monitor_map.record.ipv4_peer_as, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_peer_as, null)
        record_ipv4_gtp                            = try(flow_monitor_map.record.ipv4_gtp, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_gtp, null)
        record_ipv4_l2_l3                          = try(flow_monitor_map.record.ipv4_l2_l3, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_l2_l3, null)
        record_ipv4_extended                       = try(flow_monitor_map.record.ipv4_extended, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv4_extended, null)
        record_ipv6                                = try(flow_monitor_map.record.ipv6, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6, null)
        record_ipv6_destination                    = try(flow_monitor_map.record.ipv6_destination, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6_destination, null)
        record_ipv6_srv6                           = try(flow_monitor_map.record.ipv6_srv6, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6_srv6, null)
        record_ipv6_l2_l3                          = try(flow_monitor_map.record.ipv6_l2_l3, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6_l2_l3, null)
        record_ipv6_extended                       = try(flow_monitor_map.record.ipv6_extended, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6_extended, null)
        record_ipv6_peer_as                        = try(flow_monitor_map.record.ipv6_peer_as, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6_peer_as, null)
        record_ipv6_gtp                            = try(flow_monitor_map.record.ipv6_gtp, local.defaults.iosxr.devices.configuration.flow.monitors.record.ipv6_gtp, null)
        record_mpls                                = try(flow_monitor_map.record.mpls, local.defaults.iosxr.devices.configuration.flow.monitors.record.mpls, null)
        record_mpls_ipv4_fields                    = try(flow_monitor_map.record.mpls_ipv4_fields, local.defaults.iosxr.devices.configuration.flow.monitors.record.mpls_ipv4_fields, null)
        record_mpls_ipv6_fields                    = try(flow_monitor_map.record.mpls_ipv6_fields, local.defaults.iosxr.devices.configuration.flow.monitors.record.mpls_ipv6_fields, null)
        record_mpls_ipv4_ipv6_fields               = try(flow_monitor_map.record.mpls_ipv4_ipv6_fields, local.defaults.iosxr.devices.configuration.flow.monitors.record.mpls_ipv4_ipv6_fields, null)
        record_mpls_labels                         = try(flow_monitor_map.record.mpls_labels, local.defaults.iosxr.devices.configuration.flow.monitors.record.mpls_labels, null)
        record_map_t                               = try(flow_monitor_map.record.map_t, local.defaults.iosxr.devices.configuration.flow.monitors.record.map_t, null)
        record_sflow                               = try(flow_monitor_map.record.sflow, local.defaults.iosxr.devices.configuration.flow.monitors.record.sflow, null)
        record_datalink_record                     = try(flow_monitor_map.record.datalink_record, local.defaults.iosxr.devices.configuration.flow.monitors.record.datalink_record, null)
        record_default_rtp                         = try(flow_monitor_map.record.default_rtp, local.defaults.iosxr.devices.configuration.flow.monitors.record.default_rtp, null)
        record_default_mdi                         = try(flow_monitor_map.record.default_mdi, local.defaults.iosxr.devices.configuration.flow.monitors.record.default_mdi, null)
        cache_entries                              = try(flow_monitor_map.cache.entries, local.defaults.iosxr.devices.configuration.flow.monitors.cache.entries, null)
        cache_timeout_active                       = try(flow_monitor_map.cache.timeout_active, local.defaults.iosxr.devices.configuration.flow.monitors.cache.timeout_active, null)
        cache_timeout_inactive                     = try(flow_monitor_map.cache.timeout_inactive, local.defaults.iosxr.devices.configuration.flow.monitors.cache.timeout_inactive, null)
        cache_timeout_update                       = try(flow_monitor_map.cache.timeout_update, local.defaults.iosxr.devices.configuration.flow.monitors.cache.timeout_update, null)
        cache_timeout_rate_limit                   = try(flow_monitor_map.cache.timeout_rate_limit, local.defaults.iosxr.devices.configuration.flow.monitors.cache.timeout_rate_limit, null)
        cache_permanent                            = try(flow_monitor_map.cache.type, local.defaults.iosxr.devices.configuration.flow.monitors.cache.type, null) == "permanent" ? true : null
        cache_immediate                            = try(flow_monitor_map.cache.type, local.defaults.iosxr.devices.configuration.flow.monitors.cache.type, null) == "immediate" ? true : null
        hw_cache_timeout_inactive                  = try(flow_monitor_map.cache.hw_timeout_inactive, local.defaults.iosxr.devices.configuration.flow.monitors.cache.hw_timeout_inactive, null)
        sflow_options                              = try(flow_monitor_map.options.sflow, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow, null)
        sflow_options_extended_router              = try(flow_monitor_map.options.sflow_extended_router, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_extended_router, null)
        sflow_options_extended_gateway             = try(flow_monitor_map.options.sflow_extended_gateway, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_extended_gateway, null)
        sflow_options_extended_ipv4_tunnel_egress  = try(flow_monitor_map.options.sflow_extended_ipv4_tunnel_egress, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_extended_ipv4_tunnel_egress, null)
        sflow_options_extended_ipv6_tunnel_egress  = try(flow_monitor_map.options.sflow_extended_ipv6_tunnel_egress, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_extended_ipv6_tunnel_egress, null)
        sflow_options_if_counters_polling_interval = try(flow_monitor_map.options.sflow_if_counters_polling_interval, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_if_counters_polling_interval, null)
        sflow_options_sample_header_size           = try(flow_monitor_map.options.sflow_sample_header_size, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_sample_header_size, null)
        sflow_options_input_ifindex                = try(flow_monitor_map.options.sflow_input_ifindex, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_input_ifindex, null)
        sflow_options_output_ifindex               = try(flow_monitor_map.options.sflow_output_ifindex, local.defaults.iosxr.devices.configuration.flow.monitors.options.sflow_output_ifindex, null)
      }
    ]
  ])
}

resource "iosxr_flow_monitor_map" "flow_monitor_map" {
  for_each                                   = { for flow_monitor_map in local.flow_monitor_maps : flow_monitor_map.key => flow_monitor_map }
  device                                     = each.value.device_name
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
  record_ipv4_l2_l3                          = each.value.record_ipv4_l2_l3
  record_ipv4_extended                       = each.value.record_ipv4_extended
  record_ipv6                                = each.value.record_ipv6
  record_ipv6_destination                    = each.value.record_ipv6_destination
  record_ipv6_srv6                           = each.value.record_ipv6_srv6
  record_ipv6_l2_l3                          = each.value.record_ipv6_l2_l3
  record_ipv6_extended                       = each.value.record_ipv6_extended
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

  depends_on = [
    iosxr_flow_exporter_map.flow_exporter_map,
    iosxr_flow_sampler_map.flow_sampler_map
  ]
}
