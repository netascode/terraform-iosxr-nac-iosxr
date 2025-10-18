locals {
  device_l2vpn_pw_class = flatten([
    for device in local.devices : [
      for pw_class in try(local.device_config[device.name].l2vpn_pw_class, []) : {
        device_name = device.name
        key         = "${device.name}-${pw_class.name}"

        name = try(pw_class.name, local.defaults.iosxr.configuration.l2vpn_pw_class.name, null)

        encapsulation_mpls                                             = try(pw_class.encapsulation_mpls, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls, null)
        encapsulation_mpls_transport_mode_ethernet                     = try(pw_class.encapsulation_mpls_transport_mode_ethernet, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_transport_mode_ethernet, null)
        encapsulation_mpls_transport_mode_vlan                         = try(pw_class.encapsulation_mpls_transport_mode_vlan, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_transport_mode_vlan, null)
        encapsulation_mpls_transport_mode_passthrough                  = try(pw_class.encapsulation_mpls_transport_mode_passthrough, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_transport_mode_passthrough, null)
        encapsulation_mpls_load_balancing_pw_label                     = try(pw_class.encapsulation_mpls_load_balancing_pw_label, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_pw_label, null)
        encapsulation_mpls_load_balancing_flow_label_both              = try(pw_class.encapsulation_mpls_load_balancing_flow_label_both, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_both, null)
        encapsulation_mpls_load_balancing_flow_label_both_static       = try(pw_class.encapsulation_mpls_load_balancing_flow_label_both_static, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_both_static, null)
        encapsulation_mpls_load_balancing_flow_label_code_one7         = try(pw_class.encapsulation_mpls_load_balancing_flow_label_code_one7, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_code_one7, null)
        encapsulation_mpls_load_balancing_flow_label_code_one7_disable = try(pw_class.encapsulation_mpls_load_balancing_flow_label_code_one7_disable, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_code_one7_disable, null)
        encapsulation_mpls_load_balancing_flow_label_receive           = try(pw_class.encapsulation_mpls_load_balancing_flow_label_receive, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_receive, null)
        encapsulation_mpls_load_balancing_flow_label_receive_static    = try(pw_class.encapsulation_mpls_load_balancing_flow_label_receive_static, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_receive_static, null)
        encapsulation_mpls_load_balancing_flow_label_transmit          = try(pw_class.encapsulation_mpls_load_balancing_flow_label_transmit, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_transmit, null)
        encapsulation_mpls_load_balancing_flow_label_transmit_static   = try(pw_class.encapsulation_mpls_load_balancing_flow_label_transmit_static, local.defaults.iosxr.configuration.l2vpn_pw_class.encapsulation_mpls_load_balancing_flow_label_transmit_static, null)
      }
    ]
    if try(local.device_config[device.name].l2vpn_pw_class, null) != null
  ])
}

resource "iosxr_l2vpn_pw_class" "l2vpn_pw_class" {
  for_each = { for pw_class in local.device_l2vpn_pw_class : pw_class.key => pw_class }

  device = each.value.device_name
  name   = each.value.name

  encapsulation_mpls                                             = each.value.encapsulation_mpls
  encapsulation_mpls_transport_mode_ethernet                     = each.value.encapsulation_mpls_transport_mode_ethernet
  encapsulation_mpls_transport_mode_vlan                         = each.value.encapsulation_mpls_transport_mode_vlan
  encapsulation_mpls_transport_mode_passthrough                  = each.value.encapsulation_mpls_transport_mode_passthrough
  encapsulation_mpls_load_balancing_pw_label                     = each.value.encapsulation_mpls_load_balancing_pw_label
  encapsulation_mpls_load_balancing_flow_label_both              = each.value.encapsulation_mpls_load_balancing_flow_label_both
  encapsulation_mpls_load_balancing_flow_label_both_static       = each.value.encapsulation_mpls_load_balancing_flow_label_both_static
  encapsulation_mpls_load_balancing_flow_label_code_one7         = each.value.encapsulation_mpls_load_balancing_flow_label_code_one7
  encapsulation_mpls_load_balancing_flow_label_code_one7_disable = each.value.encapsulation_mpls_load_balancing_flow_label_code_one7_disable
  encapsulation_mpls_load_balancing_flow_label_receive           = each.value.encapsulation_mpls_load_balancing_flow_label_receive
  encapsulation_mpls_load_balancing_flow_label_receive_static    = each.value.encapsulation_mpls_load_balancing_flow_label_receive_static
  encapsulation_mpls_load_balancing_flow_label_transmit          = each.value.encapsulation_mpls_load_balancing_flow_label_transmit
  encapsulation_mpls_load_balancing_flow_label_transmit_static   = each.value.encapsulation_mpls_load_balancing_flow_label_transmit_static
}
