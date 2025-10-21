locals {
  device_ipv4_prefix_lists = flatten([
    for device in local.devices : [
      for prefix_list in try(local.device_config[device.name].ipv4_prefix_list, []) : {
        key              = "${device.name}-${prefix_list.prefix_list_name}"
        device_name      = device.name
        prefix_list_name = try(prefix_list.prefix_list_name, local.defaults.iosxr.configuration.ipv4_prefix_list.prefix_list_name, null)
        sequences = try(length(prefix_list.sequences) == 0, true) ? null : [for sequence in prefix_list.sequences : {
          sequence_number        = try(sequence.sequence_number, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.sequence_number, null)
          remark                 = try(sequence.remark, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.remark, null)
          permission             = try(sequence.permission, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.permission, null)
          prefix                 = try(sequence.prefix, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.prefix, null)
          mask                   = try(sequence.mask, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.mask, null)
          match_prefix_length_eq = try(sequence.match_prefix_length_eq, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.match_prefix_length_eq, null)
          match_prefix_length_ge = try(sequence.match_prefix_length_ge, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.match_prefix_length_ge, null)
          match_prefix_length_le = try(sequence.match_prefix_length_le, local.defaults.iosxr.configuration.ipv4_prefix_list.sequences.match_prefix_length_le, null)
        }]
      }
    ]
    if try(local.device_config[device.name].ipv4_prefix_list, null) != null || try(local.defaults.iosxr.configuration.ipv4_prefix_list, null) != null
  ])
}

resource "iosxr_ipv4_prefix_list" "ipv4_prefix_list" {
  for_each         = { for prefix_list in local.device_ipv4_prefix_lists : prefix_list.key => prefix_list }
  device           = each.value.device_name
  prefix_list_name = each.value.prefix_list_name
  sequences        = each.value.sequences
}
