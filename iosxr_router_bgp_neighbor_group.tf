locals {
  router_bgp_neighbor_group = flatten([
    for device in local.devices : [
      for bgp_process in try(local.device_config[device.name].routing.bgp, []) : [
        for neighbor_group in try(bgp_process.neighbor_groups, []) : {
          key                                               = format("%s/%s/%s", device.name, bgp_process.as_number, neighbor_group.group_name)
          device_name                                       = device.name
          as_number                                         = try(bgp_process.as_number, local.defaults.iosxr.devices.configuration.routing.bgp.as_number, null)
          name                                              = try(neighbor_group.group_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.group_name, null)
          remote_as                                         = try(neighbor_group.remote_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.remote_as, null)
          description                                       = try(neighbor_group.description, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.description, null)
          update_source                                     = try(neighbor_group.update_source, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.update_source, null)
          advertisement_interval_seconds                    = try(neighbor_group.advertisement_interval_seconds, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.advertisement_interval_seconds, null)
          advertisement_interval_milliseconds               = try(neighbor_group.advertisement_interval_milliseconds, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.advertisement_interval_milliseconds, null)
          ao_key_chain_name                                 = try(neighbor_group.ao_key_chain_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_key_chain_name, null)
          ao_key_chain_include_tcp_options                  = try(neighbor_group.ao_key_chain_include_tcp_options, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_key_chain_include_tcp_options, null)
          ao_key_chain_accept_mismatch                      = try(neighbor_group.ao_key_chain_accept_mismatch, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_key_chain_accept_mismatch, null)
          ao_inheritance_disable                            = try(neighbor_group.ao_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.ao_inheritance_disable, null)
          bfd_minimum_interval                              = try(neighbor_group.bfd_minimum_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_minimum_interval, null)
          bfd_multiplier                                    = try(neighbor_group.bfd_multiplier, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_multiplier, null)
          bfd_fast_detect                                   = try(neighbor_group.bfd_fast_detect, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect, null)
          bfd_fast_detect_strict_mode                       = try(neighbor_group.bfd_fast_detect_strict_mode, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect_strict_mode, null)
          bfd_fast_detect_disable                           = try(neighbor_group.bfd_fast_detect_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.bfd_fast_detect_disable, null)
          local_as_inheritance_disable                      = try(neighbor_group.local_as_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_inheritance_disable, null)
          local_as                                          = try(neighbor_group.local_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as, null)
          local_as_no_prepend                               = try(neighbor_group.local_as_no_prepend, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_no_prepend, null)
          local_as_no_prepend_replace_as                    = try(neighbor_group.local_as_no_prepend_replace_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_no_prepend_replace_as, null)
          local_as_no_prepend_replace_as_dual_as            = try(neighbor_group.local_as_no_prepend_replace_as_dual_as, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.local_as_no_prepend_replace_as_dual_as, null)
          password                                          = try(neighbor_group.password, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.password, null)
          password_inheritance_disable                      = try(neighbor_group.password_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.password_inheritance_disable, null)
          timers_keepalive_interval                         = try(neighbor_group.timers_keepalive_interval, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_keepalive_interval, null)
          timers_keepalive_zero                             = try(neighbor_group.timers_keepalive_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_keepalive_zero, null)
          timers_keepalive_zero_holdtime_zero               = try(neighbor_group.timers_keepalive_zero_holdtime_zero, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_keepalive_zero_holdtime_zero, null)
          timers_keepalive_zero_minimum_acceptable_holdtime = try(neighbor_group.timers_keepalive_zero_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_keepalive_zero_minimum_acceptable_holdtime, null)
          timers_holdtime                                   = try(neighbor_group.timers_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holdtime, null)
          timers_holdtime_minimum_acceptable_holdtime       = try(neighbor_group.timers_holdtime_minimum_acceptable_holdtime, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.timers_holdtime_minimum_acceptable_holdtime, null)
          address_families = try(length(neighbor_group.address_families) == 0, true) ? null : [for af in neighbor_group.address_families : {
            af_name                                    = try(af.af_name, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.af_name, null)
            soft_reconfiguration_inbound_always        = try(af.soft_reconfiguration_inbound_always, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.soft_reconfiguration_inbound_always, null)
            next_hop_self                              = try(af.next_hop_self, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.next_hop_self, null)
            next_hop_self_inheritance_disable          = try(af.next_hop_self_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.next_hop_self_inheritance_disable, null)
            route_reflector_client                     = try(af.route_reflector_client, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.route_reflector_client, null)
            route_reflector_client_inheritance_disable = try(af.route_reflector_client_inheritance_disable, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.route_reflector_client_inheritance_disable, null)
            route_policy_in                            = try(af.route_policy_in, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.route_policy_in, null)
            route_policy_out                           = try(af.route_policy_out, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.route_policy_out, null)
            use_af_group                               = try(af.use_af_group, local.defaults.iosxr.devices.configuration.routing.bgp.neighbor_groups.address_families.use_af_group, null)
            }
          ]
        }
      ]
    ]
  ])
}

resource "iosxr_router_bgp_neighbor_group" "router_bgp_neighbor_group" {
  for_each                                          = { for group in local.router_bgp_neighbor_group : group.key => group }
  device                                            = each.value.device_name
  as_number                                         = each.value.as_number
  name                                              = each.value.name
  remote_as                                         = each.value.remote_as
  description                                       = each.value.description
  update_source                                     = each.value.update_source
  advertisement_interval_seconds                    = each.value.advertisement_interval_seconds
  advertisement_interval_milliseconds               = each.value.advertisement_interval_milliseconds
  ao_key_chain_name                                 = each.value.ao_key_chain_name
  ao_key_chain_include_tcp_options                  = each.value.ao_key_chain_include_tcp_options
  ao_key_chain_accept_mismatch                      = each.value.ao_key_chain_accept_mismatch
  ao_inheritance_disable                            = each.value.ao_inheritance_disable
  bfd_minimum_interval                              = each.value.bfd_minimum_interval
  bfd_multiplier                                    = each.value.bfd_multiplier
  bfd_fast_detect                                   = each.value.bfd_fast_detect
  bfd_fast_detect_strict_mode                       = each.value.bfd_fast_detect_strict_mode
  bfd_fast_detect_disable                           = each.value.bfd_fast_detect_disable
  local_as_inheritance_disable                      = each.value.local_as_inheritance_disable
  local_as                                          = each.value.local_as
  local_as_no_prepend                               = each.value.local_as_no_prepend
  local_as_no_prepend_replace_as                    = each.value.local_as_no_prepend_replace_as
  local_as_no_prepend_replace_as_dual_as            = each.value.local_as_no_prepend_replace_as_dual_as
  password                                          = each.value.password
  password_inheritance_disable                      = each.value.password_inheritance_disable
  timers_keepalive_interval                         = each.value.timers_keepalive_interval
  timers_keepalive_zero                             = each.value.timers_keepalive_zero
  timers_keepalive_zero_holdtime_zero               = each.value.timers_keepalive_zero_holdtime_zero
  timers_keepalive_zero_minimum_acceptable_holdtime = each.value.timers_keepalive_zero_minimum_acceptable_holdtime
  timers_holdtime                                   = each.value.timers_holdtime
  timers_holdtime_minimum_acceptable_holdtime       = each.value.timers_holdtime_minimum_acceptable_holdtime
  address_families                                  = each.value.address_families

  depends_on = [
    iosxr_route_policy.route_policy,
    iosxr_key_chain.key_chain
  ]
}
