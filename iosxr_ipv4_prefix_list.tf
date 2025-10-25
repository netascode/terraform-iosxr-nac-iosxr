locals {
  ipv4_prefix_lists = flatten([
    for device in local.devices : [
      for prefix_list in try(local.device_config[device.name].ipv4_prefix_lists, []) : {
        key              = "${device.name}-${prefix_list.prefix_list_name}"
        device_name      = device.name
        prefix_list_name = try(prefix_list.prefix_list_name, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.prefix_list_name, null)
        sequences = try(length(prefix_list.sequences) == 0, true) ? null : [for sequence in prefix_list.sequences : {
          sequence_number        = try(sequence.sequence_number, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.sequence_number, null)
          remark                 = try(sequence.remark, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.remark, null)
          permission             = try(sequence.permission, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.permission, null)
          prefix                 = try(sequence.prefix, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.prefix, null)
          mask                   = try(sequence.mask, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.mask, null)
          match_prefix_length_eq = try(sequence.match_prefix_length_eq, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.match_prefix_length_eq, null)
          match_prefix_length_ge = try(sequence.match_prefix_length_ge, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.match_prefix_length_ge, null)
          match_prefix_length_le = try(sequence.match_prefix_length_le, local.defaults.iosxr.devices.configuration.ipv4_prefix_lists.sequences.match_prefix_length_le, null)
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
