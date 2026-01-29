locals {
  l2vpn = flatten([
    for device in local.devices : [
      {
        key                             = device.name
        device_name                     = device.name
        description                     = try(local.device_config[device.name].l2vpn.description, local.defaults.iosxr.devices.configuration.l2vpn_description, null)
        router_id                       = try(local.device_config[device.name].l2vpn.router_id, local.defaults.iosxr.devices.configuration.l2vpn_router_id, null)
        load_balancing_flow_src_dst_ip  = try(local.device_config[device.name].l2vpn.load_balancing_flow_src_dst_ip, local.defaults.iosxr.devices.configuration.l2vpn_load_balancing_flow_src_dst_ip, null)
        load_balancing_flow_src_dst_mac = try(local.device_config[device.name].l2vpn.load_balancing_flow_src_dst_mac, local.defaults.iosxr.devices.configuration.l2vpn_load_balancing_flow_src_dst_mac, null)
      }
    ]
    if try(local.device_config[device.name].l2vpn, null) != null || try(local.defaults.iosxr.devices.configuration.l2vpn, null) != null
  ])
}

resource "iosxr_l2vpn" "l2vpn" {
  for_each                        = { for l2vpn in local.l2vpn : l2vpn.key => l2vpn }
  device                          = each.value.device_name
  description                     = each.value.description
  router_id                       = each.value.router_id
  load_balancing_flow_src_dst_ip  = each.value.load_balancing_flow_src_dst_ip
  load_balancing_flow_src_dst_mac = each.value.load_balancing_flow_src_dst_mac

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}
