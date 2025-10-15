locals {
  device_segment_routing_v6 = [
    for device in local.devices : {
      device_name = device.name

      enable                       = try(local.device_config[device.name].segment_routing_v6.enable, local.defaults.iosxr.configuration.segment_routing_v6.enable, null)
      encapsulation_source_address = try(local.device_config[device.name].segment_routing_v6.encapsulation_source_address, local.defaults.iosxr.configuration.segment_routing_v6.encapsulation_source_address, null)

      locators = [
        for locator in try(local.device_config[device.name].segment_routing_v6.locators, local.defaults.iosxr.configuration.segment_routing_v6.locators, []) : {
          name                   = try(locator.name, local.defaults.iosxr.configuration.segment_routing_v6.locator_name, null)
          locator_enable         = try(locator.locator_enable, local.defaults.iosxr.configuration.segment_routing_v6.locator_enable, null)
          micro_segment_behavior = try(locator.micro_segment_behavior, local.defaults.iosxr.configuration.segment_routing_v6.micro_segment_behavior, null)
          prefix                 = try(locator.prefix, local.defaults.iosxr.configuration.segment_routing_v6.prefix, null)
          prefix_length          = try(locator.prefix_length, local.defaults.iosxr.configuration.segment_routing_v6.prefix_length, null)
        }
      ]
    } if try(local.device_config[device.name].segment_routing_v6, null) != null || try(local.defaults.iosxr.configuration.segment_routing_v6, null) != null
  ]
}

resource "iosxr_segment_routing_v6" "segment_routing_v6" {
  for_each = { for seg_routing_v6 in local.device_segment_routing_v6 : seg_routing_v6.device_name => seg_routing_v6 }
  device   = each.value.device_name

  enable                       = each.value.enable
  encapsulation_source_address = each.value.encapsulation_source_address
  locators                     = each.value.locators
}