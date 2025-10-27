locals {
  snmp_server_views = flatten([
    for device in local.devices : [
      for view in try(local.device_config[device.name].snmp_server_views, []) : {
        key         = format("%s/%s", device.name, view.view_name)
        device_name = device.name
        view_name   = try(view.view_name, local.defaults.iosxr.devices.configuration.snmp_server_views.view_name, null)
        mib_view_families = try(length(view.mib_view_families) == 0, true) ? null : [for family in view.mib_view_families : {
          name     = try(family.name, local.defaults.iosxr.devices.configuration.snmp_server_views.mib_view_families.name, null)
          excluded = try(family.excluded, local.defaults.iosxr.devices.configuration.snmp_server_views.mib_view_families.excluded, null)
          included = try(family.included, local.defaults.iosxr.devices.configuration.snmp_server_views.mib_view_families.included, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_snmp_server_view" "snmp_server_view" {
  for_each          = { for view_config in local.snmp_server_views : view_config.key => view_config }
  device            = each.value.device_name
  view_name         = each.value.view_name
  mib_view_families = each.value.mib_view_families
}
