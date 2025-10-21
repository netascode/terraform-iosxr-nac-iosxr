locals {
  segment_routing_v6 = [
    for device in local.devices : {
      device_name                  = device.name
      enable                       = try(local.device_config[device.name].segment_routing_v6.enable, local.defaults.iosxr.configuration.segment_routing_v6.enable, null)
      encapsulation_source_address = try(local.device_config[device.name].segment_routing_v6.encapsulation_source_address, local.defaults.iosxr.configuration.segment_routing_v6.encapsulation_source_address, null)
      formats = try(length(local.device_config[device.name].segment_routing_v6.formats) == 0, true) ? null : [
        for format in local.device_config[device.name].segment_routing_v6.formats : {
          name                                         = try(format.name, local.defaults.iosxr.configuration.segment_routing_v6.formats.name, null)
          usid_local_id_block_ranges_explict_lib_start = try(format.usid_local_id_block_ranges_explict_lib_start, local.defaults.iosxr.configuration.segment_routing_v6.formats.usid_local_id_block_ranges_explict_lib_start, null)
          usid_local_id_block_ranges_lib_start         = try(format.usid_local_id_block_ranges_lib_start, local.defaults.iosxr.configuration.segment_routing_v6.formats.usid_local_id_block_ranges_lib_start, null)
          usid_wide_local_id_block_explicit_range      = try(format.usid_wide_local_id_block_explicit_range, local.defaults.iosxr.configuration.segment_routing_v6.formats.usid_wide_local_id_block_explicit_range, null)
        }
      ]
      locators = try(length(local.device_config[device.name].segment_routing_v6.locators) == 0, true) ? null : [
        for locator in local.device_config[device.name].segment_routing_v6.locators : {
          name                   = try(locator.name, local.defaults.iosxr.configuration.segment_routing_v6.locators.name, null)
          locator_enable         = try(locator.locator_enable, local.defaults.iosxr.configuration.segment_routing_v6.locators.locator_enable, null)
          micro_segment_behavior = try(locator.micro_segment_behavior, local.defaults.iosxr.configuration.segment_routing_v6.locators.micro_segment_behavior, null)
          prefix                 = try(locator.prefix, local.defaults.iosxr.configuration.segment_routing_v6.locators.prefix, null)
          prefix_length          = try(locator.prefix_length, local.defaults.iosxr.configuration.segment_routing_v6.locators.prefix_length, null)
        }
      ]
    } if try(local.device_config[device.name].segment_routing_v6, null) != null || try(local.defaults.iosxr.configuration.segment_routing_v6, null) != null
  ]
}

resource "iosxr_segment_routing_v6" "segment_routing_v6" {
  for_each                     = { for srv6 in local.segment_routing_v6 : srv6.device_name => srv6 }
  device                       = each.value.device_name
  enable                       = each.value.enable
  encapsulation_source_address = each.value.encapsulation_source_address
  formats                      = each.value.formats
  locators                     = each.value.locators
}
