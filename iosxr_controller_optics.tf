locals {
  device_controller_optics = flatten([
    for device in local.devices : [
      for controller in try(local.device_config[device.name].controller_optics, []) : {
        device_name            = device.name
        key                    = format("%s/%s%s", device.name, controller.type, controller.name)
        type                   = try(controller.type, local.defaults.iosxr.devices.configuration.controller_optics.type, null)
        name                   = try(controller.name, local.defaults.iosxr.devices.configuration.controller_optics.name, null)
        active                 = try(controller.active, local.defaults.iosxr.devices.configuration.controller_optics.active, null)
        breakout               = try(controller.breakout, local.defaults.iosxr.devices.configuration.controller_optics.breakout, null)
        description            = try(controller.description, local.defaults.iosxr.devices.configuration.controller_optics.description, null)
        link_status            = try(controller.link_status, local.defaults.iosxr.devices.configuration.controller_optics.link_status, null)
        performance_monitoring = try(controller.performance_monitoring, local.defaults.iosxr.devices.configuration.controller_optics.performance_monitoring, null)
        shutdown               = try(controller.shutdown, local.defaults.iosxr.devices.configuration.controller_optics.shutdown, null)
        speed                  = try(controller.speed, local.defaults.iosxr.devices.configuration.controller_optics.speed, null)
        transceiver_disable    = try(controller.transceiver_disable, local.defaults.iosxr.devices.configuration.controller_optics.transceiver_disable, null)
      }
    ]
    if try(local.device_config[device.name].controller_optics, null) != null
  ])
}

resource "iosxr_controller_optics" "controller_optics" {
  for_each               = { for item in local.device_controller_optics : item.key => item }
  device                 = each.value.device_name
  type                   = each.value.type
  name                   = each.value.name
  active                 = each.value.active
  breakout               = each.value.breakout
  description            = each.value.description
  link_status            = each.value.link_status
  performance_monitoring = each.value.performance_monitoring
  shutdown               = each.value.shutdown
  speed                  = each.value.speed
  transceiver_disable    = each.value.transceiver_disable
}
