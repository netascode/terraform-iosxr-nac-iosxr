resource "iosxr_mpls_oam" "mpls_oam" {
  for_each                                              = { for device in local.devices : device.name => device if try(local.device_config[device.name].mpls_oam, null) != null || try(local.defaults.iosxr.configuration.mpls_oam, null) != null }
  device                                                = each.value.name
  oam                                                   = try(local.device_config[each.value.name].mpls_oam.oam, local.defaults.iosxr.configuration.mpls_oam.oam, null)
  oam_echo_disable_vendor_extension                     = try(local.device_config[each.value.name].mpls_oam.oam_echo_disable_vendor_extension, local.defaults.iosxr.configuration.mpls_oam.oam_echo_disable_vendor_extension, null)
  oam_echo_reply_mode_control_channel_allow_reverse_lsp = try(local.device_config[each.value.name].mpls_oam.oam_echo_reply_mode_control_channel_allow_reverse_lsp, local.defaults.iosxr.configuration.mpls_oam.oam_echo_reply_mode_control_channel_allow_reverse_lsp, null)
  oam_dpm_pps                                           = try(local.device_config[each.value.name].mpls_oam.oam_dpm_pps, local.defaults.iosxr.configuration.mpls_oam.oam_dpm_pps, null)
  oam_dpm_interval                                      = try(local.device_config[each.value.name].mpls_oam.oam_dpm_interval, local.defaults.iosxr.configuration.mpls_oam.oam_dpm_interval, null)
}
