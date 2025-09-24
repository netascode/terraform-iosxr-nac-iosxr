locals {
  device_snmp_server_view_configs = flatten([
    for device in local.devices : [
      for view in try(local.device_config[device.name].snmp_server_view, local.defaults.iosxr.configuration.snmp_server_view, []) : {
        device_name = device.name
        key         = try("${device.name}-snmp-server-view-${view.view_name}", null)
        view_name   = try(view.view_name, local.defaults.iosxr.configuration.snmp_server_view_name, null)
        mib_view_families = [
          for family in try(view.mib_view_families, local.defaults.iosxr.configuration.snmp_server_view_mib_view_families, []) : {
            name     = try(family.name, local.defaults.iosxr.configuration.snmp_server_view_mib_view_family_name, null)
            excluded = try(family.excluded, local.defaults.iosxr.configuration.snmp_server_view_mib_view_family_excluded, null)
            included = try(family.included, local.defaults.iosxr.configuration.snmp_server_view_mib_view_family_included, null)
          }
        ]
      }
    ]
    if try(local.device_config[device.name].snmp_server_view, null) != null || try(local.defaults.iosxr.configuration.snmp_server_view, null) != null
  ])
}

resource "iosxr_snmp_server_view" "snmp_server_view" {
  for_each = { for view_config in local.device_snmp_server_view_configs : view_config.key => view_config }
  device   = each.value.device_name

  view_name         = each.value.view_name
  mib_view_families = each.value.mib_view_families
}
