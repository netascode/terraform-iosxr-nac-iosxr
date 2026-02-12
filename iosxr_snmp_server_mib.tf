locals {
  snmp_server_mibs = flatten([
    for device in local.devices : [
      {
        key                                    = device.name
        device_name                            = device.name
        cbqosmib_cache                         = try(local.device_config[device.name].snmp_server_mibs.cbqosmib_cache, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cbqosmib_cache, null)
        cbqosmib_cache_refresh_time            = try(local.device_config[device.name].snmp_server_mibs.cbqosmib_cache_refresh_time, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cbqosmib_cache_refresh_time, null)
        cbqosmib_cache_service_policy_count    = try(local.device_config[device.name].snmp_server_mibs.cbqosmib_cache_service_policy_count, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cbqosmib_cache_service_policy_count, null)
        cbqosmib_persist                       = try(local.device_config[device.name].snmp_server_mibs.cbqosmib_persist, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cbqosmib_persist, null)
        cbqosmib_member_stats                  = try(local.device_config[device.name].snmp_server_mibs.cbqosmib_member_stats, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cbqosmib_member_stats, null)
        ifindex_persist                        = try(local.device_config[device.name].snmp_server_mibs.ifindex_persist, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifindex_persist, null)
        trap_link_ietf                         = try(local.device_config[device.name].snmp_server_mibs.trap_link_ietf, local.defaults.iosxr.devices.configuration.snmp_server_mibs.trap_link_ietf, null)
        ifmib_ifalias_long                     = try(local.device_config[device.name].snmp_server_mibs.ifmib_ifalias_long, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifmib_ifalias_long, null)
        ifmib_stats_cache                      = try(local.device_config[device.name].snmp_server_mibs.ifmib_stats_cache, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifmib_stats_cache, null)
        ifmib_ipsubscriber                     = try(local.device_config[device.name].snmp_server_mibs.ifmib_ipsubscriber, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifmib_ipsubscriber, null)
        ifmib_internal_cache_max_duration      = try(local.device_config[device.name].snmp_server_mibs.ifmib_internal_cache_max_duration, local.defaults.iosxr.devices.configuration.snmp_server_mibs.ifmib_internal_cache_max_duration, null)
        rfmib_entphyindex                      = try(local.device_config[device.name].snmp_server_mibs.rfmib_entphyindex, local.defaults.iosxr.devices.configuration.snmp_server_mibs.rfmib_entphyindex, null)
        sensormib_cache                        = try(local.device_config[device.name].snmp_server_mibs.sensormib_cache, local.defaults.iosxr.devices.configuration.snmp_server_mibs.sensormib_cache, null)
        mplstemib_cache_timers_garbage_collect = try(local.device_config[device.name].snmp_server_mibs.mplstemib_cache_timers_garbage_collect, local.defaults.iosxr.devices.configuration.snmp_server_mibs.mplstemib_cache_timers_garbage_collect, null)
        mplstemib_cache_timers_refresh         = try(local.device_config[device.name].snmp_server_mibs.mplstemib_cache_timers_refresh, local.defaults.iosxr.devices.configuration.snmp_server_mibs.mplstemib_cache_timers_refresh, null)
        mplsp2mpmib_cache_timer                = try(local.device_config[device.name].snmp_server_mibs.mplsp2mpmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server_mibs.mplsp2mpmib_cache_timer, null)
        frrmib_cache_timer                     = try(local.device_config[device.name].snmp_server_mibs.frrmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server_mibs.frrmib_cache_timer, null)
        cmplsteextmib_cache_timer              = try(local.device_config[device.name].snmp_server_mibs.cmplsteextmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cmplsteextmib_cache_timer, null)
        cmplsteextstdmib_cache_timer           = try(local.device_config[device.name].snmp_server_mibs.cmplsteextstdmib_cache_timer, local.defaults.iosxr.devices.configuration.snmp_server_mibs.cmplsteextstdmib_cache_timer, null)
        mroutemib_send_all_vrf                 = try(local.device_config[device.name].snmp_server_mibs.mroutemib_send_all_vrf, local.defaults.iosxr.devices.configuration.snmp_server_mibs.mroutemib_send_all_vrf, null)
        notification_log_mib_default           = try(local.device_config[device.name].snmp_server_mibs.notification_log_mib_default, local.defaults.iosxr.devices.configuration.snmp_server_mibs.notification_log_mib_default, null)
        notification_log_mib_global_age_out    = try(local.device_config[device.name].snmp_server_mibs.notification_log_mib_global_age_out, local.defaults.iosxr.devices.configuration.snmp_server_mibs.notification_log_mib_global_age_out, null)
        notification_log_mib_global_size       = try(local.device_config[device.name].snmp_server_mibs.notification_log_mib_global_size, local.defaults.iosxr.devices.configuration.snmp_server_mibs.notification_log_mib_global_size, null)
        notification_log_mib_disable           = try(local.device_config[device.name].snmp_server_mibs.notification_log_mib_disable, local.defaults.iosxr.devices.configuration.snmp_server_mibs.notification_log_mib_disable, null)
        notification_log_mib_size              = try(local.device_config[device.name].snmp_server_mibs.notification_log_mib_size, local.defaults.iosxr.devices.configuration.snmp_server_mibs.notification_log_mib_size, null)
        entityindex_persist                    = try(local.device_config[device.name].snmp_server_mibs.entityindex_persist, local.defaults.iosxr.devices.configuration.snmp_server_mibs.entityindex_persist, null)
        interfaces = try(length(local.device_config[device.name].snmp_server_mibs.interfaces) == 0, true) ? null : [
          for intf in local.device_config[device.name].snmp_server_mibs.interfaces : {
            interface_name                  = try(intf.interface_name, local.defaults.iosxr.devices.configuration.snmp_server_mibs.interfaces_defaults.interface_name, null)
            notification_linkupdown_disable = try(intf.notification_linkupdown_disable, local.defaults.iosxr.devices.configuration.snmp_server_mibs.interfaces_defaults.notification_linkupdown_disable, null)
            notification_linkupdown_enable  = try(intf.notification_linkupdown_enable, local.defaults.iosxr.devices.configuration.snmp_server_mibs.interfaces_defaults.notification_linkupdown_enable, null)
            index_persistence               = try(intf.index_persistence, local.defaults.iosxr.devices.configuration.snmp_server_mibs.interfaces_defaults.index_persistence, null)
          }
        ]
      }
    ] if try(local.device_config[device.name].snmp_server_mibs, null) != null || try(local.defaults.iosxr.devices.configuration.snmp_server_mibs, null) != null
  ])
}

resource "iosxr_snmp_server_mib" "snmp_server_mib" {
  for_each                               = { for mib in local.snmp_server_mibs : mib.key => mib }
  device                                 = each.value.device_name
  cbqosmib_cache                         = each.value.cbqosmib_cache
  cbqosmib_cache_refresh_time            = each.value.cbqosmib_cache_refresh_time
  cbqosmib_cache_service_policy_count    = each.value.cbqosmib_cache_service_policy_count
  cbqosmib_persist                       = each.value.cbqosmib_persist
  cbqosmib_member_stats                  = each.value.cbqosmib_member_stats
  ifindex_persist                        = each.value.ifindex_persist
  trap_link_ietf                         = each.value.trap_link_ietf
  ifmib_ifalias_long                     = each.value.ifmib_ifalias_long
  ifmib_stats_cache                      = each.value.ifmib_stats_cache
  ifmib_ipsubscriber                     = each.value.ifmib_ipsubscriber
  ifmib_internal_cache_max_duration      = each.value.ifmib_internal_cache_max_duration
  rfmib_entphyindex                      = each.value.rfmib_entphyindex
  sensormib_cache                        = each.value.sensormib_cache
  mplstemib_cache_timers_garbage_collect = each.value.mplstemib_cache_timers_garbage_collect
  mplstemib_cache_timers_refresh         = each.value.mplstemib_cache_timers_refresh
  mplsp2mpmib_cache_timer                = each.value.mplsp2mpmib_cache_timer
  frrmib_cache_timer                     = each.value.frrmib_cache_timer
  cmplsteextmib_cache_timer              = each.value.cmplsteextmib_cache_timer
  cmplsteextstdmib_cache_timer           = each.value.cmplsteextstdmib_cache_timer
  mroutemib_send_all_vrf                 = each.value.mroutemib_send_all_vrf
  notification_log_mib_default           = each.value.notification_log_mib_default
  notification_log_mib_global_age_out    = each.value.notification_log_mib_global_age_out
  notification_log_mib_global_size       = each.value.notification_log_mib_global_size
  notification_log_mib_disable           = each.value.notification_log_mib_disable
  notification_log_mib_size              = each.value.notification_log_mib_size
  entityindex_persist                    = each.value.entityindex_persist
  interfaces                             = each.value.interfaces
}
