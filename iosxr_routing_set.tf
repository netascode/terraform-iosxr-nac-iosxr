##### AS Path Set #####

locals {
  as_path_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "as_path"
    ]
  ])
}

resource "iosxr_as_path_set" "as_path_set" {
  for_each = { for e in local.as_path_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Community Set #####

locals {
  community_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "community"
    ]
  ])
}

resource "iosxr_community_set" "community_set" {
  for_each = { for e in local.community_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### ESI Set #####

locals {
  esi_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "esi"
    ]
  ])
}

resource "iosxr_esi_set" "esi_set" {
  for_each = { for e in local.esi_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Etag Set #####

locals {
  etag_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "etag"
    ]
  ])
}

resource "iosxr_etag_set" "etag_set" {
  for_each = { for e in local.etag_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity Bandwidth Set #####

locals {
  extcommunity_bandwidth_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_bandwidth"
    ]
  ])
}

resource "iosxr_extcommunity_bandwidth_set" "extcommunity_bandwidth_set" {
  for_each = { for e in local.extcommunity_bandwidth_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity Cost Set #####

locals {
  extcommunity_cost_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_cost"
    ]
  ])
}

resource "iosxr_extcommunity_cost_set" "extcommunity_cost_set" {
  for_each = { for e in local.extcommunity_cost_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity EVPN Link Bandwidth Set #####

locals {
  extcommunity_evpn_link_bandwidth_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_evpn_link_bandwidth"
    ]
  ])
}

resource "iosxr_extcommunity_evpn_link_bandwidth_set" "extcommunity_evpn_link_bandwidth_set" {
  for_each = { for e in local.extcommunity_evpn_link_bandwidth_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity Opaque Set #####

locals {
  extcommunity_opaque_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_opaque"
    ]
  ])
}

resource "iosxr_extcommunity_opaque_set" "extcommunity_opaque_set" {
  for_each = { for e in local.extcommunity_opaque_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity RT Set #####

locals {
  extcommunity_rt_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_rt"
    ]
  ])
}

resource "iosxr_extcommunity_rt_set" "extcommunity_rt_set" {
  for_each = { for e in local.extcommunity_rt_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity Seg NH Set #####

locals {
  extcommunity_seg_nh_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_seg_nh"
    ]
  ])
}

resource "iosxr_extcommunity_seg_nh_set" "extcommunity_seg_nh_set" {
  for_each = { for e in local.extcommunity_seg_nh_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Extcommunity SOO Set #####

locals {
  extcommunity_soo_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "extcommunity_soo"
    ]
  ])
}

resource "iosxr_extcommunity_soo_set" "extcommunity_soo_set" {
  for_each = { for e in local.extcommunity_soo_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Large Community Set #####

locals {
  large_community_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "large_community"
    ]
  ])
}

resource "iosxr_large_community_set" "large_community_set" {
  for_each = { for e in local.large_community_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Mac Set #####

locals {
  mac_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "mac"
    ]
  ])
}

resource "iosxr_mac_set" "mac_set" {
  for_each = { for e in local.mac_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### OSPF Area Set #####

locals {
  ospf_area_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "ospf_area"
    ]
  ])
}

resource "iosxr_ospf_area_set" "ospf_area_set" {
  for_each = { for e in local.ospf_area_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Policy Global Set #####

locals {
  policy_global_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = device.name
        device_name = device.name
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "policy_global"
    ]
  ])
}

resource "iosxr_policy_global_set" "policy_global_set" {
  for_each = { for e in local.policy_global_sets : e.key => e }
  device   = each.value.device_name
  rpl      = each.value.rpl
}

##### Prefix Set #####

locals {
  prefix_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "prefix"
    ]
  ])
}

resource "iosxr_prefix_set" "prefix_set" {
  for_each = { for e in local.prefix_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### RD Set #####

locals {
  rd_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "rd"
    ]
  ])
}

resource "iosxr_rd_set" "rd_set" {
  for_each = { for e in local.rd_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}

##### Tag Set #####

locals {
  tag_sets = flatten([
    for device in local.devices : [
      for rs in try(local.device_config[device.name].routing_sets, []) : {
        key         = format("%s/%s", device.name, rs.name)
        device_name = device.name
        set_name    = try(rs.name, local.defaults.iosxr.devices.configuration.routing_sets.name, null)
        rpl         = try(rs.rpl, local.defaults.iosxr.devices.configuration.routing_sets.rpl, null)
      } if try(rs.type, local.defaults.iosxr.devices.configuration.routing_sets.type, null) == "tag"
    ]
  ])
}

resource "iosxr_tag_set" "tag_set" {
  for_each = { for e in local.tag_sets : e.key => e }
  device   = each.value.device_name
  set_name = each.value.set_name
  rpl      = each.value.rpl
}
