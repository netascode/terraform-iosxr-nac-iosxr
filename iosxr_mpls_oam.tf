resource "iosxr_mpls_oam" "mpls_oam" {
  for_each                                              = { for device in local.devices : device.name => device if try(local.device_config[device.name].mpls_oam, null) != null || try(local.defaults.iosxr.devices.configuration.mpls_oam, null) != null }
  device                                                = each.value.name
  oam                                                   = try(local.device_config[each.value.name].mpls_oam.enable, local.defaults.iosxr.devices.configuration.mpls_oam.enable, null)
  oam_echo_disable_vendor_extension                     = try(local.device_config[each.value.name].mpls_oam.echo.disable_vendor_extension, local.defaults.iosxr.devices.configuration.mpls_oam.echo.disable_vendor_extension, null)
  oam_echo_reply_mode_control_channel_allow_reverse_lsp = try(local.device_config[each.value.name].mpls_oam.echo.reply_mode_control_channel_allow_reverse_lsp, local.defaults.iosxr.devices.configuration.mpls_oam.echo.reply_mode_control_channel_allow_reverse_lsp, null)
  oam_echo_revision_one                                 = try(local.device_config[each.value.name].mpls_oam.echo.revision, local.defaults.iosxr.devices.configuration.mpls_oam.echo.revision, null) == 1 ? true : null
  oam_echo_revision_two                                 = try(local.device_config[each.value.name].mpls_oam.echo.revision, local.defaults.iosxr.devices.configuration.mpls_oam.echo.revision, null) == 2 ? true : null
  oam_echo_revision_three                               = try(local.device_config[each.value.name].mpls_oam.echo.revision, local.defaults.iosxr.devices.configuration.mpls_oam.echo.revision, null) == 3 ? true : null
  oam_echo_revision_four                                = try(local.device_config[each.value.name].mpls_oam.echo.revision, local.defaults.iosxr.devices.configuration.mpls_oam.echo.revision, null) == 4 ? true : null
  oam_dpm_pps                                           = try(local.device_config[each.value.name].mpls_oam.dpm.pps, local.defaults.iosxr.devices.configuration.mpls_oam.dpm.pps, null)
  oam_dpm_interval                                      = try(local.device_config[each.value.name].mpls_oam.dpm.interval, local.defaults.iosxr.devices.configuration.mpls_oam.dpm.interval, null)
  oam_dpm_downstream_ecmp_faults                        = try(local.device_config[each.value.name].mpls_oam.dpm.downstream_ecmp_faults, local.defaults.iosxr.devices.configuration.mpls_oam.dpm.downstream_ecmp_faults, null)
}
