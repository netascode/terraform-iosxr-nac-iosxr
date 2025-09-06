locals {
  iosxr                   = try(local.model.iosxr, {})
  global                  = try(local.iosxr.global, [])
  devices                 = try(local.iosxr.devices, [])
  device_groups           = try(local.iosxr.device_groups, [])
  interface_groups        = try(local.iosxr.interface_groups, [])
  configuration_templates = try(local.iosxr.configuration_templates, [])

  device_variables = { for device in local.devices :
    device.name => merge(concat(
      [try(local.global.variables, {})],
      [for dg in local.device_groups : try(dg.variables, {}) if contains(try(device.device_groups, []), dg.name)],
      [for dg in local.device_groups : try(dg.variables, {}) if contains(try(dg.devices, []), device.name)],
      [try(device.variables, {})]
    )...)
  }

  device_group_config_template_variables = { for dg in local.device_groups :
    dg.name => merge(concat(
      [try(local.global.variables, {})],
      [try(dg.variables, {})],
    )...)
  }

  device_group_config_template_raw_config = { for dg in local.device_groups :
    dg.name => provider::utils::yaml_merge(
      [for t in try(dg.configuration_templates, []) : yamlencode(try([for ct in local.configuration_templates : try(ct.configuration, {}) if ct.name == t][0], {}))]
    )
  }

  device_group_config_template_config = { for dg, config in local.device_group_config_template_raw_config :
    dg => templatestring(config, local.device_group_config_template_variables[dg])
  }

  device_raw_config = { for device in local.devices :
    device.name => try(provider::utils::yaml_merge(concat(
      [yamlencode(try(local.global.configuration, {}))],
      [for dg in local.device_groups : yamlencode(try(dg.configuration, {})) if contains(try(device.device_groups, []), dg.name)],
      [for dg in local.device_groups : yamlencode(try(dg.configuration, {})) if contains(try(dg.devices, []), device.name)],
      [for dg in local.device_groups : local.device_group_config_template_config[dg.name] if contains(try(device.device_groups, []), dg.name)],
      [for dg in local.device_groups : local.device_group_config_template_config[dg.name] if contains(try(dg.devices, []), device.name)],
      [yamlencode(try(device.configuration, {}))]
    )), "")
  }

  device_config = { for device, config in local.device_raw_config :
    device => yamldecode(templatestring(config, local.device_variables[device]))
  }

  interface_groups_raw_config = {
    for device in local.devices : device.name => {
      for ig in local.interface_groups : ig.name => yamlencode(try(ig.configuration, {}))
    }
  }

  interface_groups_config = {
    for device in local.devices : device.name => [
      for ig in local.interface_groups : {
        name          = ig.name
        configuration = yamldecode(templatestring(local.interface_groups_raw_config[device.name][ig.name], local.device_variables[device.name]))
      }
    ]
  }

  provider_devices = [for device in local.devices : {
    name = device.name
    host = device.host
  }]
}

provider "iosxr" {
  devices = local.provider_devices
}