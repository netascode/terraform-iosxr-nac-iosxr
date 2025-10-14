locals {
  device_class_map_qos = flatten([
    for device in local.devices : [
      for class_map_qos in try(local.device_config[device.name].class_map_qos, []) : {
        device_name                     = device.name
        class_map_name                  = try(class_map_qos.class_map_name, null)
        key                             = "${device.name}-${try(class_map_qos.class_map_name, "")}"
        description                     = try(class_map_qos.description, local.defaults.iosxr.configuration.class_map_qos.description, null)
        match_any                       = try(class_map_qos.match_any, local.defaults.iosxr.configuration.class_map_qos.match_any, null)
        match_dscp                      = try(class_map_qos.match_dscp, local.defaults.iosxr.configuration.class_map_qos.match_dscp, null)
        match_mpls_experimental_topmost = try(class_map_qos.match_mpls_experimental_topmost, local.defaults.iosxr.configuration.class_map_qos.match_mpls_experimental_topmost, null)
        match_qos_group                 = try(class_map_qos.match_qos_group, local.defaults.iosxr.configuration.class_map_qos.match_qos_group, null)
        match_traffic_class             = try(class_map_qos.match_traffic_class, local.defaults.iosxr.configuration.class_map_qos.match_traffic_class, null)
      }
    ]
    if try(local.device_config[device.name].class_map_qos, null) != null || try(local.defaults.iosxr.configuration.class_map_qos, null) != null
  ])
}

resource "iosxr_class_map_qos" "class_map_qos" {
  for_each = { for class_map in local.device_class_map_qos : class_map.key => class_map }

  device         = each.value.device_name
  class_map_name = each.value.class_map_name

  description                     = each.value.description
  match_any                       = each.value.match_any
  match_dscp                      = each.value.match_dscp
  match_mpls_experimental_topmost = each.value.match_mpls_experimental_topmost
  match_qos_group                 = each.value.match_qos_group
  match_traffic_class             = each.value.match_traffic_class
}