resource "iosxr_mpls_traffic_eng" "mpls_traffic_eng" {
  for_each    = { for device in local.devices : device.name => device if try(local.device_config[device.name].mpls_traffic_eng, null) != null || try(local.defaults.iosxr.configuration.mpls_traffic_eng, null) != null }
  device      = each.value.name
  traffic_eng = try(local.device_config[each.value.name].mpls_traffic_eng.traffic_eng, local.defaults.iosxr.configuration.mpls_traffic_eng.traffic_eng, null)
}
