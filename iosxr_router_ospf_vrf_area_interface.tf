locals {
  router_ospf_vrf_area_interface = flatten([
    for device in local.devices : [
      for ospf_process in try(local.device_config[device.name].routing.ospf_processes, []) : [
        for vrf in try(ospf_process.vrfs, []) : [
          for area in try(vrf.areas, []) : [
            for interface in try(area.interfaces, []) : {
              key                         = format("%s/%s/%s/%s/%s", device.name, ospf_process.id, vrf.vrf_name, area.area_id, interface.interface_id)
              device_name                 = device.name
              process_name                = try(ospf_process.id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.id, null)
              vrf_name                    = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.vrf_name, null)
              area_id                     = try(area.area_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.area_id, null)
              interface_name              = try(interface.interface_id, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.interface_id, null)
              cost                        = try(interface.cost, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.cost, null)
              network_broadcast           = try(interface.network_broadcast, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network_broadcast, null)
              network_non_broadcast       = try(interface.network_non_broadcast, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network_non_broadcast, null)
              network_point_to_multipoint = try(interface.network_point_to_multipoint, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network_point_to_multipoint, null)
              network_point_to_point      = try(interface.network_point_to_point, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.network_point_to_point, null)
              passive_disable             = try(interface.passive_disable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.passive_disable, null)
              passive_enable              = try(interface.passive_enable, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.passive_enable, null)
              priority                    = try(interface.priority, local.defaults.iosxr.devices.configuration.routing.ospf_processes.vrfs.areas.interfaces.priority, null)
            }
          ]
        ]
      ]
    ]
  ])
}

resource "iosxr_router_ospf_vrf_area_interface" "router_ospf_vrf_area_interface" {
  for_each                    = { for interface in local.router_ospf_vrf_area_interface : interface.key => interface }
  device                      = each.value.device_name
  process_name                = each.value.process_name
  vrf_name                    = each.value.vrf_name
  area_id                     = each.value.area_id
  interface_name              = each.value.interface_name
  cost                        = each.value.cost
  network_broadcast           = each.value.network_broadcast
  network_non_broadcast       = each.value.network_non_broadcast
  network_point_to_multipoint = each.value.network_point_to_multipoint
  network_point_to_point      = each.value.network_point_to_point
  passive_disable             = each.value.passive_disable
  passive_enable              = each.value.passive_enable
  priority                    = each.value.priority

  depends_on = [
    iosxr_router_ospf_vrf.router_ospf_vrf
  ]
}
