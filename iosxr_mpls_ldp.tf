locals {
  mpls_ldp = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        router_id   = try(local.device_config[device.name].mpls_ldp.router_id, local.defaults.iosxr.devices.configuration.mpls_ldp_router_id, null)
        address_families = try(length(local.device_config[device.name].mpls_ldp.address_families) == 0, true) ? null : [
          for af in local.device_config[device.name].mpls_ldp.address_families : {
            af_name                              = try(af.af_name, local.defaults.iosxr.devices.configuration.mpls_ldp_address_families_af_name, null)
            label_local_allocate_for_access_list = try(af.label_local_allocate_for_access_list, local.defaults.iosxr.devices.configuration.mpls_ldp_address_families_label_local_allocate_for_access_list, null)
          }
        ]
        interfaces = try(length(local.device_config[device.name].mpls_ldp.interfaces) == 0, true) ? null : [
          for intf in local.device_config[device.name].mpls_ldp.interfaces : {
            interface_name = try(intf.interface_name, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces_interface_name, null)
          }
        ]
        capabilities_sac                = try(local.device_config[device.name].mpls_ldp.capabilities_sac, local.defaults.iosxr.devices.configuration.mpls_ldp_capabilities_sac, null)
        capabilities_sac_ipv4_disable   = try(local.device_config[device.name].mpls_ldp.capabilities_sac_ipv4_disable, local.defaults.iosxr.devices.configuration.mpls_ldp_capabilities_sac_ipv4_disable, null)
        capabilities_sac_ipv6_disable   = try(local.device_config[device.name].mpls_ldp.capabilities_sac_ipv6_disable, local.defaults.iosxr.devices.configuration.mpls_ldp_capabilities_sac_ipv6_disable, null)
        capabilities_sac_fec128_disable = try(local.device_config[device.name].mpls_ldp.capabilities_sac_fec128_disable, local.defaults.iosxr.devices.configuration.mpls_ldp_capabilities_sac_fec128_disable, null)
        capabilities_sac_fec129_disable = try(local.device_config[device.name].mpls_ldp.capabilities_sac_fec129_disable, local.defaults.iosxr.devices.configuration.mpls_ldp_capabilities_sac_fec129_disable, null)
        igp_sync_delay_on_session_up    = try(local.device_config[device.name].mpls_ldp.igp_sync_delay_on_session_up, local.defaults.iosxr.devices.configuration.mpls_ldp_igp_sync_delay_on_session_up, null)
        igp_sync_delay_on_proc_restart  = try(local.device_config[device.name].mpls_ldp.igp_sync_delay_on_proc_restart, local.defaults.iosxr.devices.configuration.mpls_ldp_igp_sync_delay_on_proc_restart, null)
        mldp                            = try(local.device_config[device.name].mpls_ldp.mldp, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp, null)
        mldp_logging_notifications      = try(local.device_config[device.name].mpls_ldp.mldp_logging_notifications, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp_logging_notifications, null)
        mldp_address_families = try(length(local.device_config[device.name].mpls_ldp.mldp_address_families) == 0, true) ? null : [
          for maf in local.device_config[device.name].mpls_ldp.mldp_address_families : {
            name                              = try(maf.name, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp_address_families_name, null)
            make_before_break_delay           = try(maf.make_before_break_delay, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp_address_families_make_before_break_delay, null)
            forwarding_recursive              = try(maf.forwarding_recursive, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp_address_families_forwarding_recursive, null)
            forwarding_recursive_route_policy = try(maf.forwarding_recursive_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp_address_families_forwarding_recursive_route_policy, null)
            recursive_fec                     = try(maf.recursive_fec, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp_address_families_recursive_fec, null)
          }
        ]
        session_protection = try(local.device_config[device.name].mpls_ldp.session_protection, local.defaults.iosxr.devices.configuration.mpls_ldp_session_protection, null)
      }
    ]
    if try(local.device_config[device.name].mpls_ldp, null) != null || try(local.defaults.iosxr.devices.configuration.mpls_ldp, null) != null
  ])
}

resource "iosxr_mpls_ldp" "mpls_ldp" {
  for_each                        = { for ldp in local.mpls_ldp : ldp.key => ldp }
  device                          = each.value.device_name
  router_id                       = each.value.router_id
  address_families                = each.value.address_families
  interfaces                      = each.value.interfaces
  capabilities_sac                = each.value.capabilities_sac
  capabilities_sac_ipv4_disable   = each.value.capabilities_sac_ipv4_disable
  capabilities_sac_ipv6_disable   = each.value.capabilities_sac_ipv6_disable
  capabilities_sac_fec128_disable = each.value.capabilities_sac_fec128_disable
  capabilities_sac_fec129_disable = each.value.capabilities_sac_fec129_disable
  igp_sync_delay_on_session_up    = each.value.igp_sync_delay_on_session_up
  igp_sync_delay_on_proc_restart  = each.value.igp_sync_delay_on_proc_restart
  mldp                            = each.value.mldp
  mldp_logging_notifications      = each.value.mldp_logging_notifications
  mldp_address_families           = each.value.mldp_address_families
  session_protection              = each.value.session_protection
}