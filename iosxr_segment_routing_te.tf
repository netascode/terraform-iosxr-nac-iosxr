locals {
  segment_routing_te = flatten([
    for device in local.devices : [
      {
        key                      = device.name
        device_name              = device.name
        logging_pcep_peer_status = try(local.device_config[device.name].segment_routing_te.logging_pcep_peer_status, local.defaults.iosxr.devices.configuration.segment_routing_te.logging_pcep_peer_status, null)
        logging_policy_status    = try(local.device_config[device.name].segment_routing_te.logging_policy_status, local.defaults.iosxr.devices.configuration.segment_routing_te.logging_policy_status, null)
        pcc_report_all           = try(local.device_config[device.name].segment_routing_te.pcc_report_all, local.defaults.iosxr.devices.configuration.segment_routing_te.pcc_report_all, null)
        pcc_source_address_ipv4  = try(local.device_config[device.name].segment_routing_te.pcc_source_address_ipv4, local.defaults.iosxr.devices.configuration.segment_routing_te.pcc_source_address_ipv4, null)
        pcc_delegation_timeout   = try(local.device_config[device.name].segment_routing_te.pcc_delegation_timeout, local.defaults.iosxr.devices.configuration.segment_routing_te.pcc_delegation_timeout, null)
        pcc_dead_timer           = try(local.device_config[device.name].segment_routing_te.pcc_dead_timer, local.defaults.iosxr.devices.configuration.segment_routing_te.pcc_dead_timer, null)
        pcc_initiated_state      = try(local.device_config[device.name].segment_routing_te.pcc_initiated_state, local.defaults.iosxr.devices.configuration.segment_routing_te.pcc_initiated_state, null)
        pcc_initiated_orphan     = try(local.device_config[device.name].segment_routing_te.pcc_initiated_orphan, local.defaults.iosxr.devices.configuration.segment_routing_te.pcc_initiated_orphan, null)
        pce_peers_ipv4 = try(length(local.device_config[device.name].segment_routing_te.pce_peers_ipv4) == 0, true) ? null : [
          for peer in local.device_config[device.name].segment_routing_te.pce_peers_ipv4 : {
            pce_address = try(peer.pce_address, local.defaults.iosxr.devices.configuration.segment_routing_te.pce_peers_ipv4_defaults.pce_address, null)
            precedence  = try(peer.precedence, local.defaults.iosxr.devices.configuration.segment_routing_te.pce_peers_ipv4_defaults.precedence, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].segment_routing_te, null) != null || try(local.defaults.iosxr.devices.configuration.segment_routing_te, null) != null
  ])
}

resource "iosxr_segment_routing_te" "segment_routing_te" {
  for_each                 = { for sr_te in local.segment_routing_te : sr_te.key => sr_te }
  device                   = each.value.device_name
  logging_pcep_peer_status = each.value.logging_pcep_peer_status
  logging_policy_status    = each.value.logging_policy_status
  pcc_report_all           = each.value.pcc_report_all
  pcc_source_address_ipv4  = each.value.pcc_source_address_ipv4
  pcc_delegation_timeout   = each.value.pcc_delegation_timeout
  pcc_dead_timer           = each.value.pcc_dead_timer
  pcc_initiated_state      = each.value.pcc_initiated_state
  pcc_initiated_orphan     = each.value.pcc_initiated_orphan
  pce_peers_ipv4           = each.value.pce_peers_ipv4

  depends_on = [
    iosxr_segment_routing.segment_routing,
    iosxr_segment_routing_v6.segment_routing_v6
  ]
}
