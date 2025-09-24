resource "iosxr_class_map_qos" "class_map_qos" {
  for_each = {
    for item in flatten([
      for device_name, device in { for d in local.devices : d.name => d } : [
        for class_map_name, class_map in try(local.device_config[device.name].class_map_qos, {}) : {
          device_key     = device.name
          class_map_name = class_map_name
          config         = class_map
        }
      ]
    ]) : "${item.device_key}:${item.class_map_name}" => item
  }

  device         = each.value.device_key
  class_map_name = each.value.class_map_name

  # Optional attributes
  description                     = try(each.value.config.description, null)
  match_any                       = try(each.value.config.match_any, null)
  match_dscp                      = try(each.value.config.match_dscp, null)
  match_mpls_experimental_topmost = try(each.value.config.match_mpls_experimental_topmost, null)
  match_qos_group                 = try(each.value.config.match_qos_group, null)
  match_traffic_class             = try(each.value.config.match_traffic_class, null)
}