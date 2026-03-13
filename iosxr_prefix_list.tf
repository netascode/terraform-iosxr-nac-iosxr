locals {
  ipv4_prefix_lists = flatten([
    for device in local.devices : [
      for prefix_list in try(local.device_config[device.name].prefix_lists.ipv4, []) : {
        key              = format("%s/%s", device.name, prefix_list.name)
        device_name      = device.name
        prefix_list_name = try(prefix_list.name, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.name, null)
        sequences = try(length(prefix_list.entries) == 0, true) ? null : [for entry in prefix_list.entries : {
          sequence_number        = try(entry.sequence, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.sequence, null)
          remark                 = try(entry.remark, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.remark, null)
          permission             = try(entry.action, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.action, null)
          prefix                 = try(entry.prefix, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.prefix, null)
          mask                   = try(provider::utils::normalize_mask(entry.mask, "dotted-decimal"), entry.mask, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.mask, null)
          match_prefix_length_eq = try(entry.exact_length, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.exact_length, null)
          match_prefix_length_ge = try(entry.min_length, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.min_length, null)
          match_prefix_length_le = try(entry.max_length, local.defaults.iosxr.devices.configuration.prefix_lists.ipv4.entries.max_length, null)
        }]
      }
    ]
  ])

  ipv6_prefix_lists = flatten([
    for device in local.devices : [
      for prefix_list in try(local.device_config[device.name].prefix_lists.ipv6, []) : {
        key              = format("%s/%s", device.name, prefix_list.name)
        device_name      = device.name
        prefix_list_name = try(prefix_list.name, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.name, null)
        sequences = try(length(prefix_list.entries) == 0, true) ? null : [for entry in prefix_list.entries : {
          sequence_number        = try(entry.sequence, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.sequence, null)
          remark                 = try(entry.remark, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.remark, null)
          permission             = try(entry.action, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.action, null)
          prefix                 = try(entry.prefix, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.prefix, null)
          zone                   = try(entry.zone, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.zone, 0)
          mask                   = try(entry.mask, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.mask, null)
          match_prefix_length_eq = try(entry.exact_length, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.exact_length, null)
          match_prefix_length_ge = try(entry.min_length, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.min_length, null)
          match_prefix_length_le = try(entry.max_length, local.defaults.iosxr.devices.configuration.prefix_lists.ipv6.entries.max_length, null)
        }]
      }
    ]
  ])
}

resource "iosxr_ipv4_prefix_list" "ipv4_prefix_list" {
  for_each         = { for prefix_list in local.ipv4_prefix_lists : prefix_list.key => prefix_list }
  device           = each.value.device_name
  prefix_list_name = each.value.prefix_list_name
  sequences        = each.value.sequences
}

resource "iosxr_ipv6_prefix_list" "ipv6_prefix_list" {
  for_each         = { for prefix_list in local.ipv6_prefix_lists : prefix_list.key => prefix_list }
  device           = each.value.device_name
  prefix_list_name = each.value.prefix_list_name
  sequences        = each.value.sequences
}
