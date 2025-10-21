resource "iosxr_lldp" "lldp" {
  for_each                               = { for device in local.devices : device.name => device if try(local.device_config[device.name].lldp, null) != null || try(local.defaults.iosxr.configuration.lldp, null) != null }
  device                                 = each.value.name
  holdtime                               = try(local.device_config[each.value.name].lldp.holdtime, local.defaults.iosxr.configuration.lldp.holdtime, null)
  timer                                  = try(local.device_config[each.value.name].lldp.timer, local.defaults.iosxr.configuration.lldp.timer, null)
  reinit                                 = try(local.device_config[each.value.name].lldp.reinit, local.defaults.iosxr.configuration.lldp.reinit, null)
  subinterfaces_enable                   = try(local.device_config[each.value.name].lldp.subinterfaces_enable, local.defaults.iosxr.configuration.lldp.subinterfaces_enable, null)
  priorityaddr_enable                    = try(local.device_config[each.value.name].lldp.priorityaddr_enable, local.defaults.iosxr.configuration.lldp.priorityaddr_enable, null)
  extended_show_width_enable             = try(local.device_config[each.value.name].lldp.extended_show_width_enable, local.defaults.iosxr.configuration.lldp.extended_show_width_enable, null)
  management_enable                      = try(local.device_config[each.value.name].lldp.management_enable, local.defaults.iosxr.configuration.lldp.management_enable, null)
  tlv_select_management_address_disable  = try(local.device_config[each.value.name].lldp.tlv_select_management_address_disable, local.defaults.iosxr.configuration.lldp.tlv_select_management_address_disable, null)
  tlv_select_port_description_disable    = try(local.device_config[each.value.name].lldp.tlv_select_port_description_disable, local.defaults.iosxr.configuration.lldp.tlv_select_port_description_disable, null)
  tlv_select_system_capabilities_disable = try(local.device_config[each.value.name].lldp.tlv_select_system_capabilities_disable, local.defaults.iosxr.configuration.lldp.tlv_select_system_capabilities_disable, null)
  tlv_select_system_description_disable  = try(local.device_config[each.value.name].lldp.tlv_select_system_description_disable, local.defaults.iosxr.configuration.lldp.tlv_select_system_description_disable, null)
  tlv_select_system_name_disable         = try(local.device_config[each.value.name].lldp.tlv_select_system_name_disable, local.defaults.iosxr.configuration.lldp.tlv_select_system_name_disable, null)
}
