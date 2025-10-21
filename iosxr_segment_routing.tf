resource "iosxr_segment_routing" "segment_routing" {
  for_each                 = { for device in local.devices : device.name => device if try(local.device_config[device.name].segment_routing, null) != null || try(local.defaults.iosxr.configuration.segment_routing, null) != null }
  device                   = each.value.name
  global_block_lower_bound = try(local.device_config[each.value.name].segment_routing.global_block_lower_bound, local.defaults.iosxr.configuration.segment_routing.global_block_lower_bound, null)
  global_block_upper_bound = try(local.device_config[each.value.name].segment_routing.global_block_upper_bound, local.defaults.iosxr.configuration.segment_routing.global_block_upper_bound, null)
  local_block_lower_bound  = try(local.device_config[each.value.name].segment_routing.local_block_lower_bound, local.defaults.iosxr.configuration.segment_routing.local_block_lower_bound, null)
  local_block_upper_bound  = try(local.device_config[each.value.name].segment_routing.local_block_upper_bound, local.defaults.iosxr.configuration.segment_routing.local_block_upper_bound, null)
}
