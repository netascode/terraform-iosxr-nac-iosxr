locals {
  mpls_ldp_mldp = flatten([
    for device in local.devices : [
      {
        key                   = device.name
        device_name           = device.name
        logging_internal      = try(local.device_config[device.name].mpls_ldp_mldp.logging_internal, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.logging_internal, null)
        logging_notifications = try(local.device_config[device.name].mpls_ldp_mldp.logging_notifications, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.logging_notifications, null)
        address_family = try(length(local.device_config[device.name].mpls_ldp_mldp.address_family) == 0, true) ? null : [
          for af in local.device_config[device.name].mpls_ldp_mldp.address_family : {
            name                              = try(af.name, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.name, null)
            carrier_supporting_carrier        = try(af.carrier_supporting_carrier, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.carrier_supporting_carrier, null)
            forwarding_recursive              = try(af.forwarding_recursive, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.forwarding_recursive, null)
            forwarding_recursive_route_policy = try(af.forwarding_recursive_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.forwarding_recursive_route_policy, null)
            make_before_break_delay           = try(af.make_before_break_delay, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.make_before_break_delay, null)
            make_before_break_delete_delay    = try(af.make_before_break_delete_delay, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.make_before_break_delete_delay, null)
            make_before_break_route_policy    = try(af.make_before_break_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.make_before_break_route_policy, null)
            mofrr_enable                      = try(af.mofrr_enable, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.mofrr_enable, null)
            mofrr_route_policy                = try(af.mofrr_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.mofrr_route_policy, null)
            neighbors_route_policy_in         = try(af.neighbors_route_policy_in, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.neighbors_route_policy_in, null)
            neighbors_route_policy_out        = try(af.neighbors_route_policy_out, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.neighbors_route_policy_out, null)
            recursive_fec_enable              = try(af.recursive_fec_enable, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.recursive_fec_enable, null)
            recursive_fec_route_policy        = try(af.recursive_fec_route_policy, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.recursive_fec_route_policy, null)
            rib_unicast_always                = try(af.rib_unicast_always, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.rib_unicast_always, null)
            neighbors = try(length(af.neighbors) == 0, true) ? null : [
              for neighbor in af.neighbors : {
                neighbor_address          = try(neighbor.neighbor_address, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.neighbors.neighbor_address, null)
                neighbor_route_policy_in  = try(neighbor.neighbor_route_policy_in, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.neighbors.neighbor_route_policy_in, null)
                neighbor_route_policy_out = try(neighbor.neighbor_route_policy_out, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.neighbors.neighbor_route_policy_out, null)
              }
            ]
            statics = try(length(af.statics) == 0, true) ? null : [
              for static in af.statics : {
                lsp_address = try(static.lsp_address, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.statics.lsp_address, null)
                mp2mp       = try(static.mp2mp, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.statics.mp2mp, null)
                p2mp        = try(static.p2mp, local.defaults.iosxr.devices.configuration.mpls_ldp_mldp.address_family.statics.p2mp, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].mpls_ldp_mldp, null) != null || try(local.defaults.iosxr.devices.configuration.mpls_ldp_mldp, null) != null
  ])
}

resource "iosxr_mpls_ldp_mldp" "mpls_ldp_mldp" {
  for_each              = { for v in local.mpls_ldp_mldp : v.key => v }
  device                = each.value.device_name
  logging_internal      = each.value.logging_internal
  logging_notifications = each.value.logging_notifications
  address_family        = each.value.address_family

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}
