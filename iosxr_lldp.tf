resource "iosxr_lldp" "lldp" {
  for_each                               = { for device in local.devices : device.name => device if try(local.device_config[device.name].lldp, null) != null || try(local.defaults.iosxr.devices.configuration.lldp, null) != null }
  device                                 = each.value.name
  holdtime                               = try(local.device_config[each.value.name].lldp.holdtime, local.defaults.iosxr.devices.configuration.lldp.holdtime, null)
  timer                                  = try(local.device_config[each.value.name].lldp.timer, local.defaults.iosxr.devices.configuration.lldp.timer, null)
  reinit                                 = try(local.device_config[each.value.name].lldp.reinit, local.defaults.iosxr.devices.configuration.lldp.reinit, null)
  system_name                            = try(local.device_config[each.value.name].lldp.system_name, local.defaults.iosxr.devices.configuration.lldp.system_name, null)
  system_description                     = try(local.device_config[each.value.name].lldp.system_description, local.defaults.iosxr.devices.configuration.lldp.system_description, null)
  chassis_id                             = try(local.device_config[each.value.name].lldp.chassis_id, local.defaults.iosxr.devices.configuration.lldp.chassis_id, null)
  chassis_id_type_chassis_component      = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "chassis_component" ? true : null
  chassis_id_type_interface_alias        = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "interface_alias" ? true : null
  chassis_id_type_port_component         = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "port_component" ? true : null
  chassis_id_type_mac_address            = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "mac_address" ? true : null
  chassis_id_type_network_address        = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "network_address" ? true : null
  chassis_id_type_interface_name         = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "interface_name" ? true : null
  chassis_id_type_local                  = try(local.device_config[each.value.name].lldp.chassis_id_type, local.defaults.iosxr.devices.configuration.lldp.chassis_id_type, null) == "local" ? true : null
  subinterfaces_enable                   = try(local.device_config[each.value.name].lldp.subinterfaces_enable, local.defaults.iosxr.devices.configuration.lldp.subinterfaces_enable, null)
  subinterfaces_tagged                   = try(local.device_config[each.value.name].lldp.subinterfaces_tagged, local.defaults.iosxr.devices.configuration.lldp.subinterfaces_tagged, null)
  priorityaddr_enable                    = try(local.device_config[each.value.name].lldp.priorityaddr_enable, local.defaults.iosxr.devices.configuration.lldp.priorityaddr_enable, null)
  extended_show_width_enable             = try(local.device_config[each.value.name].lldp.extended_show_width_enable, local.defaults.iosxr.devices.configuration.lldp.extended_show_width_enable, null)
  management_enable                      = try(local.device_config[each.value.name].lldp.management_enable, local.defaults.iosxr.devices.configuration.lldp.management_enable, null)
  tlv_select_management_address_disable  = try(local.device_config[each.value.name].lldp.tlv_select.management_address_disable, local.defaults.iosxr.devices.configuration.lldp.tlv_select.management_address_disable, null)
  tlv_select_port_description_disable    = try(local.device_config[each.value.name].lldp.tlv_select.port_description_disable, local.defaults.iosxr.devices.configuration.lldp.tlv_select.port_description_disable, null)
  tlv_select_system_capabilities_disable = try(local.device_config[each.value.name].lldp.tlv_select.system_capabilities_disable, local.defaults.iosxr.devices.configuration.lldp.tlv_select.system_capabilities_disable, null)
  tlv_select_system_description_disable  = try(local.device_config[each.value.name].lldp.tlv_select.system_description_disable, local.defaults.iosxr.devices.configuration.lldp.tlv_select.system_description_disable, null)
  tlv_select_system_name_disable         = try(local.device_config[each.value.name].lldp.tlv_select.system_name_disable, local.defaults.iosxr.devices.configuration.lldp.tlv_select.system_name_disable, null)
}
