resource "iosxr_snmp_server" "snmp_server" {
  for_each = { for device in local.devices : device.name => device if try(local.device_config[device.name].snmp_server, null) != null || try(local.defaults.iosxr.configuration.snmp_server, null) != null }
  device   = each.value.name

  location                      = try(local.device_config[each.value.name].snmp_server.location, local.defaults.iosxr.configuration.snmp_server.location, null)
  contact                       = try(local.device_config[each.value.name].snmp_server.contact, local.defaults.iosxr.configuration.snmp_server.contact, null)
  trap_source                   = try(local.device_config[each.value.name].snmp_server.trap_source, local.defaults.iosxr.configuration.snmp_server.trap_source, null)
  traps_rf                      = try(local.device_config[each.value.name].snmp_server.traps_rf, local.defaults.iosxr.configuration.snmp_server.traps_rf, null)
  traps_bfd                     = try(local.device_config[each.value.name].snmp_server.traps_bfd, local.defaults.iosxr.configuration.snmp_server.traps_bfd, null)
  traps_ntp                     = try(local.device_config[each.value.name].snmp_server.traps_ntp, local.defaults.iosxr.configuration.snmp_server.traps_ntp, null)
  traps_ethernet_oam_events     = try(local.device_config[each.value.name].snmp_server.traps_ethernet_oam_events, local.defaults.iosxr.configuration.snmp_server.traps_ethernet_oam_events, null)
  traps_copy_complete           = try(local.device_config[each.value.name].snmp_server.traps_copy_complete, local.defaults.iosxr.configuration.snmp_server.traps_copy_complete, null)
  traps_snmp_linkup             = try(local.device_config[each.value.name].snmp_server.traps_snmp_linkup, local.defaults.iosxr.configuration.snmp_server.traps_snmp_linkup, null)
  traps_snmp_linkdown           = try(local.device_config[each.value.name].snmp_server.traps_snmp_linkdown, local.defaults.iosxr.configuration.snmp_server.traps_snmp_linkdown, null)
  traps_power                   = try(local.device_config[each.value.name].snmp_server.traps_power, local.defaults.iosxr.configuration.snmp_server.traps_power, null)
  traps_config                  = try(local.device_config[each.value.name].snmp_server.traps_config, local.defaults.iosxr.configuration.snmp_server.traps_config, null)
  traps_entity                  = try(local.device_config[each.value.name].snmp_server.traps_entity, local.defaults.iosxr.configuration.snmp_server.traps_entity, null)
  traps_system                  = try(local.device_config[each.value.name].snmp_server.traps_system, local.defaults.iosxr.configuration.snmp_server.traps_system, null)
  traps_bridgemib               = try(local.device_config[each.value.name].snmp_server.traps_bridgemib, local.defaults.iosxr.configuration.snmp_server.traps_bridgemib, null)
  traps_entity_state_operstatus = try(local.device_config[each.value.name].snmp_server.traps_entity_state_operstatus, local.defaults.iosxr.configuration.snmp_server.traps_entity_state_operstatus, null)
  traps_entity_redundancy_all   = try(local.device_config[each.value.name].snmp_server.traps_entity_redundancy_all, local.defaults.iosxr.configuration.snmp_server.traps_entity_redundancy_all, null)
  traps_l2vpn_all               = try(local.device_config[each.value.name].snmp_server.traps_l2vpn_all, local.defaults.iosxr.configuration.snmp_server.traps_l2vpn_all, null)
  traps_l2vpn_vc_up             = try(local.device_config[each.value.name].snmp_server.traps_l2vpn_vc_up, local.defaults.iosxr.configuration.snmp_server.traps_l2vpn_vc_up, null)
  traps_l2vpn_vc_down           = try(local.device_config[each.value.name].snmp_server.traps_l2vpn_vc_down, local.defaults.iosxr.configuration.snmp_server.traps_l2vpn_vc_down, null)
  traps_sensor                  = try(local.device_config[each.value.name].snmp_server.traps_sensor, local.defaults.iosxr.configuration.snmp_server.traps_sensor, null)
  traps_fru_ctrl                = try(local.device_config[each.value.name].snmp_server.traps_fru_ctrl, local.defaults.iosxr.configuration.snmp_server.traps_fru_ctrl, null)

  users = try(length(local.device_config[each.value.name].snmp_server.users) == 0, true) ? null : [
    for user in try(local.device_config[each.value.name].snmp_server.users, []) : {
      user_name                              = try(user.user_name, null)
      group_name                             = try(user.group_name, null)
      v3_auth_md5_encryption_aes             = try(user.v3_auth_md5_encryption_aes, null)
      v3_auth_md5_encryption_default         = try(user.v3_auth_md5_encryption_default, null)
      v3_auth_sha_encryption_aes             = try(user.v3_auth_sha_encryption_aes, null)
      v3_auth_sha_encryption_default         = try(user.v3_auth_sha_encryption_default, null)
      v3_ipv4                                = try(user.v3_ipv4, null)
      v3_priv_aes_aes_128_encryption_aes     = try(user.v3_priv_aes_aes_128_encryption_aes, null)
      v3_priv_aes_aes_128_encryption_default = try(user.v3_priv_aes_aes_128_encryption_default, null)
      v3_systemowner                         = try(user.v3_systemowner, null)
    }
  ]

  groups = try(length(local.device_config[each.value.name].snmp_server.groups) == 0, true) ? null : [
    for group in try(local.device_config[each.value.name].snmp_server.groups, []) : {
      group_name = try(group.group_name, null)
      v3_priv    = try(group.v3_priv, null)
      v3_read    = try(group.v3_read, null)
      v3_write   = try(group.v3_write, null)
      v3_context = try(group.v3_context, null)
      v3_notify  = try(group.v3_notify, null)
      v3_ipv4    = try(group.v3_ipv4, null)
      v3_ipv6    = try(group.v3_ipv6, null)
    }
  ]

  communities = try(length(local.device_config[each.value.name].snmp_server.communities) == 0, true) ? null : [
    for community in try(local.device_config[each.value.name].snmp_server.communities, []) : {
      community   = try(community.community, null)
      view        = try(community.view, null)
      ro          = try(community.ro, null)
      rw          = try(community.rw, null)
      sdrowner    = try(community.sdrowner, null)
      systemowner = try(community.systemowner, null)
      ipv4        = try(community.ipv4, null)
      ipv6        = try(community.ipv6, null)
    }
  ]
}
