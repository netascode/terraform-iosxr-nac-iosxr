locals {
  mpls_ldp_interfaces = flatten([
    for device in local.devices : [
      for ldp_interface in try(local.device_config[device.name].mpls_ldp_interfaces, []) : {
        key                                  = format("%s/%s", device.name, ldp_interface.interface_name)
        device_name                          = device.name
        interface_name                       = try(ldp_interface.interface_name, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.interface_name, null)
        discovery_hello_holdtime             = try(ldp_interface.discovery_hello_holdtime, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.discovery_hello_holdtime, null)
        discovery_hello_interval             = try(ldp_interface.discovery_hello_interval, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.discovery_hello_interval, null)
        discovery_hello_dual_stack_tlv       = try(ldp_interface.discovery_hello_dual_stack_tlv, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.discovery_hello_dual_stack_tlv, null)
        discovery_quick_start_disable        = try(ldp_interface.discovery_quick_start_disable, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.discovery_quick_start_disable, null)
        igp_sync_delay_on_session_up         = try(ldp_interface.igp_sync_delay_on_session_up, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.igp_sync_delay_on_session_up, null)
        igp_sync_delay_on_session_up_disable = try(ldp_interface.igp_sync_delay_on_session_up_disable, local.defaults.iosxr.devices.configuration.mpls_ldp_interfaces.igp_sync_delay_on_session_up_disable, null)
        address_family = try(length(ldp_interface.address_family) == 0, true) ? null : [
          for af in ldp_interface.address_family : {
            af_name                               = try(af.af_name, null)
            discovery_transport_address_interface = try(af.discovery_transport_address_interface, null)
            discovery_transport_address_ip        = try(af.discovery_transport_address_ip, null)
            igp_auto_config_disable               = try(af.igp_auto_config_disable, null)
            mldp_disable                          = try(af.mldp_disable, null)
          }
        ]
      }
    ]
    if try(local.device_config[device.name].mpls_ldp_interfaces, null) != null
  ])
}

resource "iosxr_mpls_ldp_interface" "mpls_ldp_interface" {
  for_each                             = { for ldp_interface in local.mpls_ldp_interfaces : ldp_interface.key => ldp_interface }
  device                               = each.value.device_name
  interface_name                       = each.value.interface_name
  discovery_hello_holdtime             = each.value.discovery_hello_holdtime
  discovery_hello_interval             = each.value.discovery_hello_interval
  discovery_hello_dual_stack_tlv       = each.value.discovery_hello_dual_stack_tlv
  discovery_quick_start_disable        = each.value.discovery_quick_start_disable
  igp_sync_delay_on_session_up         = each.value.igp_sync_delay_on_session_up
  igp_sync_delay_on_session_up_disable = each.value.igp_sync_delay_on_session_up_disable
  address_family                       = each.value.address_family
}
