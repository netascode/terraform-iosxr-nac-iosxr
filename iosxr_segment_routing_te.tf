locals {
  device_segment_routing_te_configs = flatten([
    for device in local.devices : [
      {
        device_name = device.name
        key         = device.name

        logging_pcep_peer_status = try(local.device_config[device.name].segment_routing_te.logging_pcep_peer_status, local.defaults.iosxr.configuration.segment_routing_te.logging_pcep_peer_status, null)
        logging_policy_status    = try(local.device_config[device.name].segment_routing_te.logging_policy_status, local.defaults.iosxr.configuration.segment_routing_te.logging_policy_status, null)
        pcc_report_all           = try(local.device_config[device.name].segment_routing_te.pcc_report_all, local.defaults.iosxr.configuration.segment_routing_te.pcc_report_all, null)
        pcc_source_address       = try(local.device_config[device.name].segment_routing_te.pcc_source_address, local.defaults.iosxr.configuration.segment_routing_te.pcc_source_address, null)
        pcc_delegation_timeout   = try(local.device_config[device.name].segment_routing_te.pcc_delegation_timeout, local.defaults.iosxr.configuration.segment_routing_te.pcc_delegation_timeout, null)
        pcc_dead_timer           = try(local.device_config[device.name].segment_routing_te.pcc_dead_timer, local.defaults.iosxr.configuration.segment_routing_te.pcc_dead_timer, null)
        pcc_initiated_state      = try(local.device_config[device.name].segment_routing_te.pcc_initiated_state, local.defaults.iosxr.configuration.segment_routing_te.pcc_initiated_state, null)
        pcc_initiated_orphan     = try(local.device_config[device.name].segment_routing_te.pcc_initiated_orphan, local.defaults.iosxr.configuration.segment_routing_te.pcc_initiated_orphan, null)

        pce_peers = [
          for peer in try(local.device_config[device.name].segment_routing_te.pce_peers, local.defaults.iosxr.configuration.segment_routing_te.pce_peers, []) : {
            pce_address = try(peer.pce_address, local.defaults.iosxr.configuration.segment_routing_te.pce_peers_defaults.pce_address, null)
            precedence  = try(peer.precedence, local.defaults.iosxr.configuration.segment_routing_te.pce_peers_defaults.precedence, null)
          }
        ]

        on_demand_colors = [
          for color in try(local.device_config[device.name].segment_routing_te.on_demand_colors, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors, []) : {
            color                               = try(color.color, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.color, null)
            source_address                      = try(color.source_address, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.source_address, null)
            source_address_type                 = try(color.source_address_type, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.source_address_type, null)
            constraint_segments_protection_type = try(color.constraint_segments_protection_type, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.constraint_segments_protection_type, null)
            constraint_segments_sid_algorithm   = try(color.constraint_segments_sid_algorithm, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.constraint_segments_sid_algorithm, null)
            dynamic_anycast_sid_inclusion       = try(color.dynamic_anycast_sid_inclusion, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.dynamic_anycast_sid_inclusion, null)
            dynamic_metric_type                 = try(color.dynamic_metric_type, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.dynamic_metric_type, null)
            effective_metric_enable             = try(color.effective_metric_enable, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.effective_metric_enable, null)
            effective_metric_type               = try(color.effective_metric_type, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.effective_metric_type, null)
            effective_metric_value              = try(color.effective_metric_value, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.effective_metric_value, null)
            srv6_enable                         = try(color.srv6_enable, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.srv6_enable, null)
            srv6_locator_behavior               = try(color.srv6_locator_behavior, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.srv6_locator_behavior, null)
            srv6_locator_binding_sid_type       = try(color.srv6_locator_binding_sid_type, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.srv6_locator_binding_sid_type, null)
            srv6_locator_name                   = try(color.srv6_locator_name, local.defaults.iosxr.configuration.segment_routing_te.on_demand_colors_defaults.srv6_locator_name, null)
          }
        ]

        policies = [
          for policy in try(local.device_config[device.name].segment_routing_te.policies, local.defaults.iosxr.configuration.segment_routing_te.policies, []) : {
            policy_name                   = try(policy.policy_name, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.policy_name, null)
            source_address                = try(policy.source_address, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.source_address, null)
            source_address_type           = try(policy.source_address_type, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.source_address_type, null)
            policy_color_endpoint_address = try(policy.policy_color_endpoint_address, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.policy_color_endpoint_address, null)
            policy_color_endpoint_color   = try(policy.policy_color_endpoint_color, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.policy_color_endpoint_color, null)
            policy_color_endpoint_type    = try(policy.policy_color_endpoint_type, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.policy_color_endpoint_type, null)
            srv6_enable                   = try(policy.srv6_enable, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.srv6_enable, null)
            srv6_locator_behavior         = try(policy.srv6_locator_behavior, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.srv6_locator_behavior, null)
            srv6_locator_binding_sid_type = try(policy.srv6_locator_binding_sid_type, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.srv6_locator_binding_sid_type, null)
            srv6_locator_name             = try(policy.srv6_locator_name, local.defaults.iosxr.configuration.segment_routing_te.policies_defaults.srv6_locator_name, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].segment_routing_te, null) != null || try(local.defaults.iosxr.configuration.segment_routing_te, null) != null
  ])
}

resource "iosxr_segment_routing_te" "segment_routing_te" {
  for_each = { for sr_te_config in local.device_segment_routing_te_configs : sr_te_config.key => sr_te_config }
  device   = each.value.device_name

  logging_pcep_peer_status = each.value.logging_pcep_peer_status
  logging_policy_status    = each.value.logging_policy_status
  pcc_report_all           = each.value.pcc_report_all
  pcc_source_address       = each.value.pcc_source_address
  pcc_delegation_timeout   = each.value.pcc_delegation_timeout
  pcc_dead_timer           = each.value.pcc_dead_timer
  pcc_initiated_state      = each.value.pcc_initiated_state
  pcc_initiated_orphan     = each.value.pcc_initiated_orphan
  pce_peers                = each.value.pce_peers
  on_demand_colors         = each.value.on_demand_colors
  policies                 = each.value.policies
}