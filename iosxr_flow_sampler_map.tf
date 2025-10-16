locals {
  device_flow_sampler_maps = flatten([
    for device in local.devices : [
      for sampler_map in try(local.device_config[device.name].flow_sampler_map, []) : {
        device_name = device.name
        key         = "${device.name}-flow-sampler-map-${sampler_map.name}"
        name        = try(sampler_map.name, local.defaults.iosxr.configuration.flow_sampler_map.name, null)
        random      = try(sampler_map.random, local.defaults.iosxr.configuration.flow_sampler_map.random, null)
        out_of      = try(sampler_map.out_of, local.defaults.iosxr.configuration.flow_sampler_map.out_of, null)
      }
    ]
  ])
}

resource "iosxr_flow_sampler_map" "flow_sampler_map" {
  for_each = { for sampler_map in local.device_flow_sampler_maps : sampler_map.key => sampler_map }
  device   = each.value.device_name

  name   = each.value.name
  random = each.value.random
  out_of = each.value.out_of
}