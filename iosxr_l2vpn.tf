##### L2VPN #####

locals {
  l2vpn = flatten([
    for device in local.devices : [
      {
        key                             = device.name
        device_name                     = device.name
        description                     = try(local.device_config[device.name].l2vpn.description, local.defaults.iosxr.devices.configuration.l2vpn_description, null)
        router_id                       = try(local.device_config[device.name].l2vpn.router_id, local.defaults.iosxr.devices.configuration.l2vpn_router_id, null)
        load_balancing_flow_src_dst_ip  = try(local.device_config[device.name].l2vpn.load_balancing_flow, local.defaults.iosxr.devices.configuration.l2vpn_load_balancing_flow, null) == "src-dst-ip" ? true : null
        load_balancing_flow_src_dst_mac = try(local.device_config[device.name].l2vpn.load_balancing_flow, local.defaults.iosxr.devices.configuration.l2vpn_load_balancing_flow, null) == "src-dst-mac" ? true : null
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

##### L2VPN Bridge Group Bridge Domain #####

locals {
  l2vpn_bridge_group_bridge_domain = flatten([
    for device in local.devices : [
      for bridge_group in try(local.device_config[device.name].l2vpn.bridge_groups, []) : [
        for bridge_domain in try(bridge_group.bridge_domains, []) : {
          key                                = format("%s/%s/%s", device.name, bridge_group.name, bridge_domain.name)
          device_name                        = device.name
          bridge_group_name                  = try(bridge_group.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.name, null)
          bridge_domain_name                 = try(bridge_domain.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.name, null)
          mtu                                = try(bridge_domain.mtu, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.mtu, null)
          storm_control_broadcast_kbps       = try(bridge_domain.storm_control_broadcast_kbps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_broadcast_kbps, null)
          storm_control_broadcast_pps        = try(bridge_domain.storm_control_broadcast_pps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_broadcast_pps, null)
          storm_control_multicast_kbps       = try(bridge_domain.storm_control_multicast_kbps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_multicast_kbps, null)
          storm_control_multicast_pps        = try(bridge_domain.storm_control_multicast_pps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_multicast_pps, null)
          storm_control_unknown_unicast_kbps = try(bridge_domain.storm_control_unknown_unicast_kbps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_unknown_unicast_kbps, null)
          storm_control_unknown_unicast_pps  = try(bridge_domain.storm_control_unknown_unicast_pps, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.storm_control_unknown_unicast_pps, null)
          evis = try(length(bridge_domain.evis) == 0, true) ? null : [for evi in bridge_domain.evis : {
            vpn_id = try(evi.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.evis.vpn_id, null)
            }
          ]
          interfaces = try(length(bridge_domain.interfaces) == 0, true) ? null : [for interface in bridge_domain.interfaces : {
            interface_name      = try(interface.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.interfaces.name, null)
            split_horizon_group = try(interface.split_horizon_group, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.interfaces.split_horizon_group, null)
            }
          ]
          routed_interface = try(length(bridge_domain.routed_interfaces) == 0, true) ? null : [for ri in bridge_domain.routed_interfaces : {
            interface_name           = try(ri.name, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.routed_interfaces.name, null)
            split_horizon_group_core = try(ri.split_horizon_group_core, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.routed_interfaces.split_horizon_group_core, null)
            }
          ]
          srv6_evis = try(length(bridge_domain.srv6_evis) == 0, true) ? null : [for srv6_evi in bridge_domain.srv6_evis : {
            vpn_id = try(srv6_evi.vpn_id, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.srv6_evis.vpn_id, null)
            }
          ]
          vnis = try(length(bridge_domain.vnis) == 0, true) ? null : [for vni in bridge_domain.vnis : {
            vni_id = try(vni.vni_id, local.defaults.iosxr.devices.configuration.l2vpn.bridge_groups.bridge_domains.vnis.vni_id, null)
            }
          ]
        }
      ]
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
  routed_interface                   = each.value.routed_interface
  srv6_evis                          = each.value.srv6_evis
  vnis                               = each.value.vnis

  depends_on = [
    iosxr_l2vpn.l2vpn
  ]
}

##### L2VPN PW Class #####

locals {
  l2vpn_pw_class = flatten([
    for device in local.devices : [
      for pw_class in try(local.device_config[device.name].l2vpn.pw_classes, []) : {
        key                                                = format("%s/%s", device.name, pw_class.name)
        device_name                                        = device.name
        name                                               = try(pw_class.name, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.name, null)
        encapsulation_mpls                                 = try(pw_class.encapsulation_mpls.enable, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.enable, try(pw_class.encapsulation_mpls, null) != null ? true : null)
        encapsulation_mpls_transport_mode_ethernet         = try(pw_class.encapsulation_mpls.transport_mode, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.transport_mode, null) == "ethernet" ? true : null
        encapsulation_mpls_transport_mode_vlan             = try(pw_class.encapsulation_mpls.transport_mode, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.transport_mode, null) == "vlan" ? true : null
        encapsulation_mpls_transport_mode_vlan_passthrough = try(pw_class.encapsulation_mpls.transport_mode, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.transport_mode, null) == "vlan-passthrough" ? true : null
        encapsulation_mpls_load_balancing_pw_label         = try(pw_class.encapsulation_mpls.load_balancing.pw_label, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.pw_label, null)
        encapsulation_mpls_load_balancing_flow_label_both  = try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "both" ? true : null
        encapsulation_mpls_load_balancing_flow_label_both_static = (
          try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "both"
          && try(pw_class.encapsulation_mpls.load_balancing.flow_label.static, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.static, false)
        ) ? true : null
        encapsulation_mpls_load_balancing_flow_label_receive = try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "receive" ? true : null
        encapsulation_mpls_load_balancing_flow_label_receive_static = (
          try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "receive"
          && try(pw_class.encapsulation_mpls.load_balancing.flow_label.static, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.static, false)
        ) ? true : null
        encapsulation_mpls_load_balancing_flow_label_transmit = try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "transmit" ? true : null
        encapsulation_mpls_load_balancing_flow_label_transmit_static = (
          try(pw_class.encapsulation_mpls.load_balancing.flow_label.direction, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.direction, null) == "transmit"
          && try(pw_class.encapsulation_mpls.load_balancing.flow_label.static, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.static, false)
        ) ? true : null
        encapsulation_mpls_load_balancing_flow_label_code_17         = contains(["enable", "disable"], try(pw_class.encapsulation_mpls.load_balancing.flow_label.code_17, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.code_17, "")) ? true : null
        encapsulation_mpls_load_balancing_flow_label_code_17_disable = try(pw_class.encapsulation_mpls.load_balancing.flow_label.code_17, local.defaults.iosxr.devices.configuration.l2vpn.pw_classes.encapsulation_mpls.load_balancing.flow_label.code_17, null) == "disable" ? true : null
      }
    ]
  ])
}

resource "iosxr_l2vpn_pw_class" "l2vpn_pw_class" {
  for_each                                                     = { for pw_class in local.l2vpn_pw_class : pw_class.key => pw_class }
  device                                                       = each.value.device_name
  name                                                         = each.value.name
  encapsulation_mpls                                           = each.value.encapsulation_mpls
  encapsulation_mpls_transport_mode_ethernet                   = each.value.encapsulation_mpls_transport_mode_ethernet
  encapsulation_mpls_transport_mode_vlan                       = each.value.encapsulation_mpls_transport_mode_vlan
  encapsulation_mpls_transport_mode_vlan_passthrough           = each.value.encapsulation_mpls_transport_mode_vlan_passthrough
  encapsulation_mpls_load_balancing_pw_label                   = each.value.encapsulation_mpls_load_balancing_pw_label
  encapsulation_mpls_load_balancing_flow_label_both            = each.value.encapsulation_mpls_load_balancing_flow_label_both
  encapsulation_mpls_load_balancing_flow_label_both_static     = each.value.encapsulation_mpls_load_balancing_flow_label_both_static
  encapsulation_mpls_load_balancing_flow_label_code_17         = each.value.encapsulation_mpls_load_balancing_flow_label_code_17
  encapsulation_mpls_load_balancing_flow_label_code_17_disable = each.value.encapsulation_mpls_load_balancing_flow_label_code_17_disable
  encapsulation_mpls_load_balancing_flow_label_receive         = each.value.encapsulation_mpls_load_balancing_flow_label_receive
  encapsulation_mpls_load_balancing_flow_label_receive_static  = each.value.encapsulation_mpls_load_balancing_flow_label_receive_static
  encapsulation_mpls_load_balancing_flow_label_transmit        = each.value.encapsulation_mpls_load_balancing_flow_label_transmit
  encapsulation_mpls_load_balancing_flow_label_transmit_static = each.value.encapsulation_mpls_load_balancing_flow_label_transmit_static

  depends_on = [
    iosxr_l2vpn.l2vpn
  ]
}
