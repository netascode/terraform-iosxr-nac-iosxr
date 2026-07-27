locals {
  policy_map_qos = flatten([
    for device in local.devices : [
      for policy_map in try(local.device_config[device.name].policy_maps, []) : {
        key             = format("%s/%s", device.name, policy_map.name)
        device_name     = device.name
        policy_map_name = try(policy_map.name, local.defaults.iosxr.devices.configuration.policy_maps.name, null)
        description     = try(policy_map.description, local.defaults.iosxr.devices.configuration.policy_maps.description, null)
        classes = try(length(policy_map.classes) == 0, true) ? null : [for class in policy_map.classes : {
          name                                                   = try(class.name, local.defaults.iosxr.devices.configuration.policy_maps.classes.name, null)
          type                                                   = try(class.type, local.defaults.iosxr.devices.configuration.policy_maps.classes.type, null)
          bandwidth_remaining_unit                               = try(class.bandwidth_remaining_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.bandwidth_remaining_unit, null)
          bandwidth_remaining_value                              = try(class.bandwidth_remaining_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.bandwidth_remaining_value, null)
          bandwidth_unit                                         = try(class.bandwidth_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.bandwidth_unit, null)
          bandwidth_value                                        = try(class.bandwidth_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.bandwidth_value, null)
          police_burst_unit                                      = try(class.police_burst_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_burst_unit, null)
          police_burst_value                                     = try(class.police_burst_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_burst_value, null)
          police_conform_action_drop                             = try(class.police_conform_action_drop, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_drop, null)
          police_conform_action_set_cos                          = try(class.police_conform_action_set_cos, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_cos, null)
          police_conform_action_set_discard_class                = try(class.police_conform_action_set_discard_class, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_discard_class, null)
          police_conform_action_set_dscp                         = try(lookup(local.dscp_map, tostring(try(class.police_conform_action_set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_dscp)), tostring(try(class.police_conform_action_set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_dscp))), null)
          police_conform_action_set_mpls_experimental_imposition = try(class.police_conform_action_set_mpls_experimental_imposition, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_mpls_experimental_imposition, null)
          police_conform_action_set_mpls_experimental_topmost    = try(class.police_conform_action_set_mpls_experimental_topmost, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_mpls_experimental_topmost, null)
          police_conform_action_set_precedence                   = try(lookup(local.precedence_map, tostring(try(class.police_conform_action_set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_precedence)), tostring(try(class.police_conform_action_set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_precedence))), null)
          police_conform_action_set_qos_group                    = try(class.police_conform_action_set_qos_group, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_set_qos_group, null)
          police_conform_action_transmit                         = try(class.police_conform_action_transmit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_conform_action_transmit, null)
          police_exceed_action_drop                              = try(class.police_exceed_action_drop, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_drop, null)
          police_exceed_action_set_cos                           = try(class.police_exceed_action_set_cos, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_cos, null)
          police_exceed_action_set_discard_class                 = try(class.police_exceed_action_set_discard_class, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_discard_class, null)
          police_exceed_action_set_dscp                          = try(lookup(local.dscp_map, tostring(try(class.police_exceed_action_set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_dscp)), tostring(try(class.police_exceed_action_set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_dscp))), null)
          police_exceed_action_set_mpls_experimental_imposition  = try(class.police_exceed_action_set_mpls_experimental_imposition, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_mpls_experimental_imposition, null)
          police_exceed_action_set_mpls_experimental_topmost     = try(class.police_exceed_action_set_mpls_experimental_topmost, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_mpls_experimental_topmost, null)
          police_exceed_action_set_precedence                    = try(lookup(local.precedence_map, tostring(try(class.police_exceed_action_set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_precedence)), tostring(try(class.police_exceed_action_set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_precedence))), null)
          police_exceed_action_set_qos_group                     = try(class.police_exceed_action_set_qos_group, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_set_qos_group, null)
          police_exceed_action_transmit                          = try(class.police_exceed_action_transmit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_exceed_action_transmit, null)
          police_peak_burst_unit                                 = try(class.police_peak_burst_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_peak_burst_unit, null)
          police_peak_burst_value                                = try(class.police_peak_burst_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_peak_burst_value, null)
          police_peak_rate_unit                                  = try(class.police_peak_rate_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_peak_rate_unit, null)
          police_peak_rate_value                                 = try(class.police_peak_rate_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_peak_rate_value, null)
          police_rate_unit                                       = try(class.police_rate_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_rate_unit, null)
          police_rate_value                                      = try(class.police_rate_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_rate_value, null)
          police_violate_action_drop                             = try(class.police_violate_action_drop, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_drop, null)
          police_violate_action_set_cos                          = try(class.police_violate_action_set_cos, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_cos, null)
          police_violate_action_set_discard_class                = try(class.police_violate_action_set_discard_class, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_discard_class, null)
          police_violate_action_set_dscp                         = try(lookup(local.dscp_map, tostring(try(class.police_violate_action_set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_dscp)), tostring(try(class.police_violate_action_set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_dscp))), null)
          police_violate_action_set_mpls_experimental_imposition = try(class.police_violate_action_set_mpls_experimental_imposition, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_mpls_experimental_imposition, null)
          police_violate_action_set_mpls_experimental_topmost    = try(class.police_violate_action_set_mpls_experimental_topmost, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_mpls_experimental_topmost, null)
          police_violate_action_set_precedence                   = try(lookup(local.precedence_map, tostring(try(class.police_violate_action_set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_precedence)), tostring(try(class.police_violate_action_set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_precedence))), null)
          police_violate_action_set_qos_group                    = try(class.police_violate_action_set_qos_group, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_set_qos_group, null)
          police_violate_action_transmit                         = try(class.police_violate_action_transmit, local.defaults.iosxr.devices.configuration.policy_maps.classes.police_violate_action_transmit, null)
          priority_level                                         = try(class.priority_level, local.defaults.iosxr.devices.configuration.policy_maps.classes.priority_level, null)
          random_detect_default                                  = try(class.random_detect_default, local.defaults.iosxr.devices.configuration.policy_maps.classes.random_detect_default, null)
          service_policy_name                                    = try(class.service_policy_name, local.defaults.iosxr.devices.configuration.policy_maps.classes.service_policy_name, null)
          set_cos                                                = try(class.set_cos, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_cos, null)
          set_discard_class                                      = try(class.set_discard_class, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_discard_class, null)
          set_dscp                                               = try(lookup(local.dscp_map, tostring(try(class.set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_dscp)), tostring(try(class.set_dscp, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_dscp))), null)
          set_mpls_experimental_imposition                       = try(class.set_mpls_experimental_imposition, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_mpls_experimental_imposition, null)
          set_mpls_experimental_topmost                          = try(class.set_mpls_experimental_topmost, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_mpls_experimental_topmost, null)
          set_precedence                                         = try(lookup(local.precedence_map, tostring(try(class.set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_precedence)), tostring(try(class.set_precedence, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_precedence))), null)
          set_qos_group                                          = try(class.set_qos_group, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_qos_group, null)
          set_traffic_class                                      = try(class.set_traffic_class, local.defaults.iosxr.devices.configuration.policy_maps.classes.set_traffic_class, null)
          shape_average_excess_burst_size                        = try(class.shape_average_excess_burst_size, local.defaults.iosxr.devices.configuration.policy_maps.classes.shape_average_excess_burst_size, null)
          shape_average_excess_burst_unit                        = try(class.shape_average_excess_burst_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.shape_average_excess_burst_unit, null)
          shape_average_rate_unit                                = try(class.shape_average_rate_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.shape_average_rate_unit, null)
          shape_average_rate_value                               = try(class.shape_average_rate_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.shape_average_rate_value, null)
          queue_limits = try(length(class.queue_limits) == 0, true) ? null : [for limit in class.queue_limits : {
            value = try(limit.value, local.defaults.iosxr.devices.configuration.policy_maps.classes.queue_limits.value, null)
            unit  = try(limit.unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.queue_limits.unit, null)
          }]
          random_detect = try(length(class.random_detect) == 0, true) ? null : [for rd in class.random_detect : {
            minimum_threshold_value = try(rd.minimum_threshold_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.random_detect.minimum_threshold_value, null)
            minimum_threshold_unit  = try(rd.minimum_threshold_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.random_detect.minimum_threshold_unit, null)
            maximum_threshold_value = try(rd.maximum_threshold_value, local.defaults.iosxr.devices.configuration.policy_maps.classes.random_detect.maximum_threshold_value, null)
            maximum_threshold_unit  = try(rd.maximum_threshold_unit, local.defaults.iosxr.devices.configuration.policy_maps.classes.random_detect.maximum_threshold_unit, null)
          }]
        }]
      }
      if try(policy_map.type, local.defaults.iosxr.devices.configuration.policy_maps.type, null) == "qos"
    ]
  ])
}

resource "iosxr_policy_map_qos" "policy_map_qos" {
  for_each        = { for policy_map in local.policy_map_qos : policy_map.key => policy_map }
  device          = each.value.device_name
  policy_map_name = each.value.policy_map_name
  description     = each.value.description
  classes         = each.value.classes

  depends_on = [
    iosxr_class_map_qos.class_map_qos
  ]
}
