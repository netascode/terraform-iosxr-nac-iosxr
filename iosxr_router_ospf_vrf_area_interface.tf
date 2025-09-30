locals {
  device_router_ospf_vrf_area_interface = flatten([
    for device in local.devices : [
      for process_name, process in try(local.device_config[device.name].router_ospf_processes, {}) : [
        for vrf_name, vrf in try(process.vrfs, {}) : [
          for area_id, area in try(vrf.areas, {}) : [
            for interface_name, interface in try(area.interfaces, {}) : {
              device_name    = device.name
              process_name   = process_name
              vrf_name       = vrf_name
              area_id        = area_id
              interface_name = interface_name
              key            = "${device.name}-${process_name}-${vrf_name}-${area_id}-${replace(interface_name, "/", "_")}"
              config         = interface
            }
          ]
        ]
      ]
    ]
    if try(local.device_config[device.name].router_ospf_processes, null) != null
  ])
}

resource "iosxr_router_ospf_vrf_area_interface" "router_ospf_vrf_area_interface" {
  for_each = { for item in local.device_router_ospf_vrf_area_interface : item.key => item }

  device         = each.value.device_name
  process_name   = each.value.process_name
  vrf_name       = each.value.vrf_name
  area_id        = each.value.area_id
  interface_name = each.value.interface_name

  # Optional attributes with defaults fallback
  network_broadcast           = try(each.value.config.network_broadcast, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_network_broadcast, null)
  network_non_broadcast       = try(each.value.config.network_non_broadcast, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_network_non_broadcast, null)
  network_point_to_point      = try(each.value.config.network_point_to_point, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_network_point_to_point, null)
  network_point_to_multipoint = try(each.value.config.network_point_to_multipoint, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_network_point_to_multipoint, null)
  cost                        = try(each.value.config.cost, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_cost, null)
  priority                    = try(each.value.config.priority, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_priority, null)
  passive_enable              = try(each.value.config.passive_enable, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_passive_enable, null)
  passive_disable             = try(each.value.config.passive_disable, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_passive_disable, null)
  delete_mode                 = try(each.value.config.delete_mode, local.defaults.iosxr.configuration.router_ospf_vrf_area_interface_delete_mode, null)
}