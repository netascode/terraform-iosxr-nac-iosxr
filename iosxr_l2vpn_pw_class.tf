locals {
  l2vpn_pw_class = flatten([
    for device in local.devices : [
      for pw_class in try(local.device_config[device.name].l2vpn_pw_class, []) : {
        key                                                          = format("%s/%s", device.name, pw_class.name)
        device_name                                                  = device.name
        name                                                         = try(pw_class.name, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.name, null)
        encapsulation_mpls                                           = try(pw_class.encapsulation_mpls, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls, null)
        encapsulation_mpls_transport_mode_ethernet                   = try(pw_class.encapsulation_mpls_transport_mode_ethernet, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_transport_mode_ethernet, null)
        encapsulation_mpls_transport_mode_vlan                       = try(pw_class.encapsulation_mpls_transport_mode_vlan, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_transport_mode_vlan, null)
        encapsulation_mpls_transport_mode_vlan_passthrough           = try(pw_class.encapsulation_mpls_transport_mode_vlan_passthrough, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_transport_mode_vlan_passthrough, null)
        encapsulation_mpls_load_balancing_pw_label                   = try(pw_class.encapsulation_mpls_load_balancing_pw_label, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_pw_label, null)
        encapsulation_mpls_load_balancing_flow_label_both            = try(pw_class.encapsulation_mpls_load_balancing_flow_label_both, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_both, null)
        encapsulation_mpls_load_balancing_flow_label_both_static     = try(pw_class.encapsulation_mpls_load_balancing_flow_label_both_static, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_both_static, null)
        encapsulation_mpls_load_balancing_flow_label_code_17         = try(pw_class.encapsulation_mpls_load_balancing_flow_label_code_17, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_code_17, null)
        encapsulation_mpls_load_balancing_flow_label_code_17_disable = try(pw_class.encapsulation_mpls_load_balancing_flow_label_code_17_disable, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_code_17_disable, null)
        encapsulation_mpls_load_balancing_flow_label_receive         = try(pw_class.encapsulation_mpls_load_balancing_flow_label_receive, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_receive, null)
        encapsulation_mpls_load_balancing_flow_label_receive_static  = try(pw_class.encapsulation_mpls_load_balancing_flow_label_receive_static, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_receive_static, null)
        encapsulation_mpls_load_balancing_flow_label_transmit        = try(pw_class.encapsulation_mpls_load_balancing_flow_label_transmit, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_transmit, null)
        encapsulation_mpls_load_balancing_flow_label_transmit_static = try(pw_class.encapsulation_mpls_load_balancing_flow_label_transmit_static, local.defaults.iosxr.devices.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_transmit_static, null)
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
