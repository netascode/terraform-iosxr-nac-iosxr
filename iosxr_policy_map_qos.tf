locals {
  device_policy_map_qos = flatten([
    for device in local.devices : [
      for policy_map_qos in try(local.device_config[device.name].policy_map_qos, []) : {
        key             = "${device.name}-${policy_map_qos.policy_map_name}"
        device_name     = device.name
        policy_map_name = try(policy_map_qos.policy_map_name, local.defaults.iosxr.configuration.policy_map_qos.policy_map_name, null)
        description     = try(policy_map_qos.description, local.defaults.iosxr.configuration.policy_map_qos.description, null)
        classes = try(length(policy_map_qos.classes) == 0, true) ? null : [for class in policy_map_qos.classes : {
          name                           = try(class.name, local.defaults.iosxr.configuration.policy_map_qos.classes.name, null)
          type                           = try(class.type, local.defaults.iosxr.configuration.policy_map_qos.classes.type, null)
          bandwidth_remaining_unit       = try(class.bandwidth_remaining_unit, local.defaults.iosxr.configuration.policy_map_qos.classes.bandwidth_remaining_unit, null)
          bandwidth_remaining_value      = try(class.bandwidth_remaining_value, local.defaults.iosxr.configuration.policy_map_qos.classes.bandwidth_remaining_value, null)
          police_conform_action_drop     = try(class.police_conform_action_drop, local.defaults.iosxr.configuration.policy_map_qos.classes.police_conform_action_drop, null)
          police_conform_action_transmit = try(class.police_conform_action_transmit, local.defaults.iosxr.configuration.policy_map_qos.classes.police_conform_action_transmit, null)
          police_exceed_action_drop      = try(class.police_exceed_action_drop, local.defaults.iosxr.configuration.policy_map_qos.classes.police_exceed_action_drop, null)
          police_exceed_action_transmit  = try(class.police_exceed_action_transmit, local.defaults.iosxr.configuration.policy_map_qos.classes.police_exceed_action_transmit, null)
          police_rate_unit               = try(class.police_rate_unit, local.defaults.iosxr.configuration.policy_map_qos.classes.police_rate_unit, null)
          police_rate_value              = try(class.police_rate_value, local.defaults.iosxr.configuration.policy_map_qos.classes.police_rate_value, null)
          police_violate_action_drop     = try(class.police_violate_action_drop, local.defaults.iosxr.configuration.policy_map_qos.classes.police_violate_action_drop, null)
          police_violate_action_transmit = try(class.police_violate_action_transmit, local.defaults.iosxr.configuration.policy_map_qos.classes.police_violate_action_transmit, null)
          priority_level                 = try(class.priority_level, local.defaults.iosxr.configuration.policy_map_qos.classes.priority_level, null)
          service_policy_name            = try(class.service_policy_name, local.defaults.iosxr.configuration.policy_map_qos.classes.service_policy_name, null)
          set_dscp                       = try(class.set_dscp, local.defaults.iosxr.configuration.policy_map_qos.classes.set_dscp, null)
          set_mpls_experimental_topmost  = try(class.set_mpls_experimental_topmost, local.defaults.iosxr.configuration.policy_map_qos.classes.set_mpls_experimental_topmost, null)
          shape_average_rate_unit        = try(class.shape_average_rate_unit, local.defaults.iosxr.configuration.policy_map_qos.classes.shape_average_rate_unit, null)
          shape_average_rate_value       = try(class.shape_average_rate_value, local.defaults.iosxr.configuration.policy_map_qos.classes.shape_average_rate_value, null)
          queue_limits = try(length(class.queue_limits) == 0, true) ? null : [for limit in class.queue_limits : {
            value = try(limit.value, local.defaults.iosxr.configuration.policy_map_qos.classes.queue_limits.value, null)
            unit  = try(limit.unit, local.defaults.iosxr.configuration.policy_map_qos.classes.queue_limits.unit, null)
          }]
        }]
      }
    ]
    if try(local.device_config[device.name].policy_map_qos, null) != null || try(local.defaults.iosxr.configuration.policy_map_qos, null) != null
  ])
}

resource "iosxr_policy_map_qos" "policy_map_qos" {
  for_each        = { for policy_map in local.device_policy_map_qos : policy_map.key => policy_map }
  device          = each.value.device_name
  policy_map_name = each.value.policy_map_name
  description     = each.value.description
  classes         = each.value.classes
}
