resource "iosxr_router_ospf_vrf_area_interface" "router_ospf_vrf_area_interface" {
  for_each = {
    for item in flatten([
      for device_name, device in { for d in local.devices : d.name => d } : [
        for process_name, process in try(local.device_config[device.name].router_ospf_processes, {}) : [
          for vrf_name, vrf in try(process.vrfs, {}) : [
            for area_id, area in try(vrf.areas, {}) : [
              for interface_name, interface in try(area.interfaces, {}) : {
                device_key     = device.name
                process_name   = process_name
                vrf_name       = vrf_name
                area_id        = area_id
                interface_name = interface_name
                config         = interface
              }
            ]
          ]
        ]
      ]
    ]) : "${item.device_key}:${item.process_name}:${item.vrf_name}:${item.area_id}:${item.interface_name}" => item
  }

  device         = each.value.device_key
  process_name   = each.value.process_name
  vrf_name       = each.value.vrf_name
  area_id        = each.value.area_id
  interface_name = each.value.interface_name

  # Optional attributes
  network_broadcast           = try(each.value.config.network_broadcast, null)
  network_non_broadcast       = try(each.value.config.network_non_broadcast, null)
  network_point_to_point      = try(each.value.config.network_point_to_point, null)
  network_point_to_multipoint = try(each.value.config.network_point_to_multipoint, null)
  cost                        = try(each.value.config.cost, null)
  priority                    = try(each.value.config.priority, null)
  passive_enable              = try(each.value.config.passive_enable, null)
  passive_disable             = try(each.value.config.passive_disable, null)
  delete_mode                 = try(each.value.config.delete_mode, null)
}