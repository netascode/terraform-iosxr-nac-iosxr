locals {
  l2vpn_bridge_group_bridge_domain = flatten([
    for device in local.devices : [
      for bridge_domain in try(local.device_config[device.name].l2vpn_bridge_group_bridge_domain, []) : {
        key                                = format("%s/%s/%s", device.name, bridge_domain.bridge_group_name, bridge_domain.bridge_domain_name)
        device_name                        = device.name
        bridge_group_name                  = bridge_domain.bridge_group_name
        bridge_domain_name                 = bridge_domain.bridge_domain_name
        mtu                                = try(bridge_domain.mtu, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.mtu, null)
        storm_control_broadcast_kbps       = try(bridge_domain.storm_control_broadcast_kbps, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.storm_control_broadcast_kbps, null)
        storm_control_broadcast_pps        = try(bridge_domain.storm_control_broadcast_pps, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.storm_control_broadcast_pps, null)
        storm_control_multicast_kbps       = try(bridge_domain.storm_control_multicast_kbps, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.storm_control_multicast_kbps, null)
        storm_control_multicast_pps        = try(bridge_domain.storm_control_multicast_pps, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.storm_control_multicast_pps, null)
        storm_control_unknown_unicast_kbps = try(bridge_domain.storm_control_unknown_unicast_kbps, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.storm_control_unknown_unicast_kbps, null)
        storm_control_unknown_unicast_pps  = try(bridge_domain.storm_control_unknown_unicast_pps, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.storm_control_unknown_unicast_pps, null)
        evis = try(length(bridge_domain.evis) == 0, true) ? null : [for evi in bridge_domain.evis : {
          vpn_id = try(evi.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.evis.vpn_id, null)
          }
        ]
        interfaces = try(length(bridge_domain.interfaces) == 0, true) ? null : [for interface in bridge_domain.interfaces : {
          interface_name      = try(interface.interface_name, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.interfaces.interface_name, null)
          split_horizon_group = try(interface.split_horizon_group, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.interfaces.split_horizon_group, null)
          }
        ]
        srv6_evis = try(length(bridge_domain.srv6_evis) == 0, true) ? null : [for srv6_evi in bridge_domain.srv6_evis : {
          vpn_id = try(srv6_evi.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.srv6_evis.vpn_id, null)
          }
        ]
        vnis = try(length(bridge_domain.vnis) == 0, true) ? null : [for vni in bridge_domain.vnis : {
          vni_id = try(vni.vni_id, local.defaults.iosxr.devices.configuration.l2vpn_bridge_group_bridge_domain.vnis.vni_id, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_l2vpn_bridge_group_bridge_domain" "l2vpn_bridge_group_bridge_domain" {
  for_each                           = { for item in local.l2vpn_bridge_group_bridge_domain : item.key => item }
  device                             = each.value.device_name
  bridge_group_name                  = each.value.bridge_group_name
  bridge_domain_name                 = each.value.bridge_domain_name
  mtu                                = each.value.mtu
  storm_control_broadcast_kbps       = each.value.storm_control_broadcast_kbps
  storm_control_broadcast_pps        = each.value.storm_control_broadcast_pps
  storm_control_multicast_kbps       = each.value.storm_control_multicast_kbps
  storm_control_multicast_pps        = each.value.storm_control_multicast_pps
  storm_control_unknown_unicast_kbps = each.value.storm_control_unknown_unicast_kbps
  storm_control_unknown_unicast_pps  = each.value.storm_control_unknown_unicast_pps
  evis                               = each.value.evis
  interfaces                         = each.value.interfaces
  srv6_evis                          = each.value.srv6_evis
  vnis                               = each.value.vnis

  depends_on = [
    iosxr_l2vpn.l2vpn
  ]
}
