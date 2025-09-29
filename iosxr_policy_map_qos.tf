locals {
  device_policy_map_qos = flatten([
    for device in local.devices : [
      for policy_map_name, policy_map in try(local.device_config[device.name].policy_map_qos, {}) : {
        device_name     = device.name
        policy_map_name = policy_map_name
        key             = "${device.name}-${policy_map_name}"
        description     = try(policy_map.description, local.defaults.iosxr.configuration.policy_map_qos_description, null)
        classes = try(length(policy_map.classes) == 0, true) ? null : [for class in policy_map.classes : {
          name                          = try(class.name, local.defaults.iosxr.configuration.policy_map_qos_classes_name, null)
          type                          = try(class.type, local.defaults.iosxr.configuration.policy_map_qos_classes_type, null)
          set_mpls_experimental_topmost = try(class.set_mpls_experimental_topmost, local.defaults.iosxr.configuration.policy_map_qos_classes_set_mpls_experimental_topmost, null)
          set_dscp                      = try(class.set_dscp, local.defaults.iosxr.configuration.policy_map_qos_classes_set_dscp, null)
          queue_limits = try(length(class.queue_limits) == 0, true) ? null : [for limit in class.queue_limits : {
            value = try(limit.value, local.defaults.iosxr.configuration.policy_map_qos_classes_queue_limits_value, null)
            unit  = try(limit.unit, local.defaults.iosxr.configuration.policy_map_qos_classes_queue_limits_unit, null)
          }]
        }]
      }
    ]
    if try(local.device_config[device.name].policy_map_qos, null) != null || try(local.defaults.iosxr.configuration.policy_map_qos, null) != null
  ])
}

resource "iosxr_policy_map_qos" "policy_map_qos" {
  for_each = { for policy_map in local.device_policy_map_qos : policy_map.key => policy_map }

  device          = each.value.device_name
  policy_map_name = each.value.policy_map_name

  # Optional attributes
  description = each.value.description
  classes     = each.value.classes
}