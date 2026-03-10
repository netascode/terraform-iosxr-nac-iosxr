locals {
  vrfs = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].vrfs, []) : {
        key                                                       = format("%s/%s", device.name, vrf.name)
        device_name                                               = device.name
        name                                                      = try(vrf.name, local.defaults.iosxr.devices.configuration.vrfs.name, null)
        description                                               = try(vrf.description, local.defaults.iosxr.devices.configuration.vrfs.description, null)
        fallback_vrf                                              = try(vrf.fallback_vrf, local.defaults.iosxr.devices.configuration.vrfs.fallback_vrf, null)
        evpn_route_sync                                           = try(vrf.evpn_route_sync, local.defaults.iosxr.devices.configuration.vrfs.evpn_route_sync, null)
        ipv4_unicast                                              = try(vrf.address_family.ipv4_unicast.enable, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.enable, try(vrf.address_family.ipv4_unicast, null) != null ? true : null)
        ipv4_unicast_import_route_policy                          = try(vrf.address_family.ipv4_unicast.import_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_policy, null)
        ipv4_unicast_export_route_policy                          = try(vrf.address_family.ipv4_unicast.export_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_policy, null)
        ipv4_unicast_import_from_bridge_domain_advertise_as_vpn   = try(vrf.address_family.ipv4_unicast.import_from_bridge_domain_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_from_bridge_domain_advertise_as_vpn, null)
        ipv4_unicast_import_from_vrf_advertise_as_vpn             = try(vrf.address_family.ipv4_unicast.import_from_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_from_vrf_advertise_as_vpn, null)
        ipv4_unicast_import_from_vrf_allow_backup                 = try(vrf.address_family.ipv4_unicast.import_from_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_from_vrf_allow_backup, null)
        ipv4_unicast_import_from_vrf_allow_best_external          = try(vrf.address_family.ipv4_unicast.import_from_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_from_vrf_allow_best_external, null)
        ipv4_unicast_import_from_default_vrf_advertise_as_vpn     = try(vrf.address_family.ipv4_unicast.import_from_default_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_from_default_vrf_advertise_as_vpn, null)
        ipv4_unicast_import_from_default_vrf_route_policy         = try(vrf.address_family.ipv4_unicast.import_from_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_from_default_vrf_route_policy, null)
        ipv4_unicast_export_to_vrf_allow_imported_vpn             = try(vrf.address_family.ipv4_unicast.export_to_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_to_vrf_allow_imported_vpn, null)
        ipv4_unicast_export_to_vrf_allow_backup                   = try(vrf.address_family.ipv4_unicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_to_vrf_allow_backup, null)
        ipv4_unicast_export_to_vrf_allow_best_external            = try(vrf.address_family.ipv4_unicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_to_vrf_allow_best_external, null)
        ipv4_unicast_export_to_default_vrf_route_policy           = try(vrf.address_family.ipv4_unicast.export_to_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_to_default_vrf_route_policy, null)
        ipv4_unicast_export_to_default_vrf_allow_imported_vpn     = try(vrf.address_family.ipv4_unicast.export_to_default_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_to_default_vrf_allow_imported_vpn, null)
        ipv4_unicast_max_prefix_limit                             = try(vrf.address_family.ipv4_unicast.max_prefix_limit, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.max_prefix_limit, null)
        ipv4_unicast_max_prefix_threshold                         = try(vrf.address_family.ipv4_unicast.max_prefix_threshold, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.max_prefix_threshold, null)
        ipv4_multicast                                            = try(vrf.address_family.ipv4_multicast.enable, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.enable, try(vrf.address_family.ipv4_multicast, null) != null ? true : null)
        ipv4_multicast_import_route_policy                        = try(vrf.address_family.ipv4_multicast.import_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_policy, null)
        ipv4_multicast_export_route_policy                        = try(vrf.address_family.ipv4_multicast.export_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_policy, null)
        ipv4_multicast_import_from_bridge_domain_advertise_as_vpn = try(vrf.address_family.ipv4_multicast.import_from_bridge_domain_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_from_bridge_domain_advertise_as_vpn, null)
        ipv4_multicast_import_from_vrf_advertise_as_vpn           = try(vrf.address_family.ipv4_multicast.import_from_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_from_vrf_advertise_as_vpn, null)
        ipv4_multicast_import_from_vrf_allow_backup               = try(vrf.address_family.ipv4_multicast.import_from_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_from_vrf_allow_backup, null)
        ipv4_multicast_import_from_vrf_allow_best_external        = try(vrf.address_family.ipv4_multicast.import_from_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_from_vrf_allow_best_external, null)
        ipv4_multicast_import_from_default_vrf_advertise_as_vpn   = try(vrf.address_family.ipv4_multicast.import_from_default_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_from_default_vrf_advertise_as_vpn, null)
        ipv4_multicast_import_from_default_vrf_route_policy       = try(vrf.address_family.ipv4_multicast.import_from_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_from_default_vrf_route_policy, null)
        ipv4_multicast_export_to_vrf_allow_imported_vpn           = try(vrf.address_family.ipv4_multicast.export_to_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_to_vrf_allow_imported_vpn, null)
        ipv4_multicast_export_to_vrf_allow_backup                 = try(vrf.address_family.ipv4_multicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_to_vrf_allow_backup, null)
        ipv4_multicast_export_to_vrf_allow_best_external          = try(vrf.address_family.ipv4_multicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_to_vrf_allow_best_external, null)
        ipv4_multicast_export_to_default_vrf_route_policy         = try(vrf.address_family.ipv4_multicast.export_to_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_to_default_vrf_route_policy, null)
        ipv4_multicast_export_to_default_vrf_allow_imported_vpn   = try(vrf.address_family.ipv4_multicast.export_to_default_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_to_default_vrf_allow_imported_vpn, null)
        ipv4_multicast_max_prefix_limit                           = try(vrf.address_family.ipv4_multicast.max_prefix_limit, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.max_prefix_limit, null)
        ipv4_multicast_max_prefix_threshold                       = try(vrf.address_family.ipv4_multicast.max_prefix_threshold, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.max_prefix_threshold, null)
        ipv4_flowspec                                             = try(vrf.address_family.ipv4_flowspec.enable, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_flowspec.enable, try(vrf.address_family.ipv4_flowspec, null) != null ? true : null)
        ipv6_unicast                                              = try(vrf.address_family.ipv6_unicast.enable, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.enable, try(vrf.address_family.ipv6_unicast, null) != null ? true : null)
        ipv6_unicast_import_route_policy                          = try(vrf.address_family.ipv6_unicast.import_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_policy, null)
        ipv6_unicast_export_route_policy                          = try(vrf.address_family.ipv6_unicast.export_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_policy, null)
        ipv6_unicast_import_from_bridge_domain_advertise_as_vpn   = try(vrf.address_family.ipv6_unicast.import_from_bridge_domain_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_from_bridge_domain_advertise_as_vpn, null)
        ipv6_unicast_import_from_vrf_advertise_as_vpn             = try(vrf.address_family.ipv6_unicast.import_from_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_from_vrf_advertise_as_vpn, null)
        ipv6_unicast_import_from_vrf_allow_backup                 = try(vrf.address_family.ipv6_unicast.import_from_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_from_vrf_allow_backup, null)
        ipv6_unicast_import_from_vrf_allow_best_external          = try(vrf.address_family.ipv6_unicast.import_from_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_from_vrf_allow_best_external, null)
        ipv6_unicast_import_from_default_vrf_advertise_as_vpn     = try(vrf.address_family.ipv6_unicast.import_from_default_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_from_default_vrf_advertise_as_vpn, null)
        ipv6_unicast_import_from_default_vrf_route_policy         = try(vrf.address_family.ipv6_unicast.import_from_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_from_default_vrf_route_policy, null)
        ipv6_unicast_export_to_vrf_allow_imported_vpn             = try(vrf.address_family.ipv6_unicast.export_to_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_to_vrf_allow_imported_vpn, null)
        ipv6_unicast_export_to_vrf_allow_backup                   = try(vrf.address_family.ipv6_unicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_to_vrf_allow_backup, null)
        ipv6_unicast_export_to_vrf_allow_best_external            = try(vrf.address_family.ipv6_unicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_to_vrf_allow_best_external, null)
        ipv6_unicast_export_to_default_vrf_route_policy           = try(vrf.address_family.ipv6_unicast.export_to_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_to_default_vrf_route_policy, null)
        ipv6_unicast_export_to_default_vrf_allow_imported_vpn     = try(vrf.address_family.ipv6_unicast.export_to_default_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_to_default_vrf_allow_imported_vpn, null)
        ipv6_unicast_max_prefix_limit                             = try(vrf.address_family.ipv6_unicast.max_prefix_limit, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.max_prefix_limit, null)
        ipv6_unicast_max_prefix_threshold                         = try(vrf.address_family.ipv6_unicast.max_prefix_threshold, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.max_prefix_threshold, null)
        ipv6_multicast                                            = try(vrf.address_family.ipv6_multicast.enable, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.enable, try(vrf.address_family.ipv6_multicast, null) != null ? true : null)
        ipv6_multicast_import_route_policy                        = try(vrf.address_family.ipv6_multicast.import_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_policy, null)
        ipv6_multicast_export_route_policy                        = try(vrf.address_family.ipv6_multicast.export_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_policy, null)
        ipv6_multicast_import_from_bridge_domain_advertise_as_vpn = try(vrf.address_family.ipv6_multicast.import_from_bridge_domain_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_from_bridge_domain_advertise_as_vpn, null)
        ipv6_multicast_import_from_vrf_advertise_as_vpn           = try(vrf.address_family.ipv6_multicast.import_from_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_from_vrf_advertise_as_vpn, null)
        ipv6_multicast_import_from_vrf_allow_backup               = try(vrf.address_family.ipv6_multicast.import_from_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_from_vrf_allow_backup, null)
        ipv6_multicast_import_from_vrf_allow_best_external        = try(vrf.address_family.ipv6_multicast.import_from_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_from_vrf_allow_best_external, null)
        ipv6_multicast_import_from_default_vrf_advertise_as_vpn   = try(vrf.address_family.ipv6_multicast.import_from_default_vrf_advertise_as_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_from_default_vrf_advertise_as_vpn, null)
        ipv6_multicast_import_from_default_vrf_route_policy       = try(vrf.address_family.ipv6_multicast.import_from_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_from_default_vrf_route_policy, null)
        ipv6_multicast_export_to_vrf_allow_imported_vpn           = try(vrf.address_family.ipv6_multicast.export_to_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_to_vrf_allow_imported_vpn, null)
        ipv6_multicast_export_to_vrf_allow_backup                 = try(vrf.address_family.ipv6_multicast.export_to_vrf_allow_backup, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_to_vrf_allow_backup, null)
        ipv6_multicast_export_to_vrf_allow_best_external          = try(vrf.address_family.ipv6_multicast.export_to_vrf_allow_best_external, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_to_vrf_allow_best_external, null)
        ipv6_multicast_export_to_default_vrf_route_policy         = try(vrf.address_family.ipv6_multicast.export_to_default_vrf_route_policy, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_to_default_vrf_route_policy, null)
        ipv6_multicast_export_to_default_vrf_allow_imported_vpn   = try(vrf.address_family.ipv6_multicast.export_to_default_vrf_allow_imported_vpn, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_to_default_vrf_allow_imported_vpn, null)
        ipv6_multicast_max_prefix_limit                           = try(vrf.address_family.ipv6_multicast.max_prefix_limit, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.max_prefix_limit, null)
        ipv6_multicast_max_prefix_threshold                       = try(vrf.address_family.ipv6_multicast.max_prefix_threshold, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.max_prefix_threshold, null)
        ipv6_flowspec                                             = try(vrf.address_family.ipv6_flowspec.enable, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_flowspec.enable, try(vrf.address_family.ipv6_flowspec, null) != null ? true : null)
        rd = try(vrf.rd, local.defaults.iosxr.devices.configuration.vrfs.rd, null) != null ? provider::utils::normalize_bgp_rd(
          try(vrf.rd, local.defaults.iosxr.devices.configuration.vrfs.rd)
        ) : null
        ipv4_unicast_import_route_targets = try(vrf.address_family.ipv4_unicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv4_unicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_targets.stitching, "disable") }
          )
        ] : null
        ipv4_unicast_export_route_targets = try(vrf.address_family.ipv4_unicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv4_unicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_targets.stitching, "disable") }
          )
        ] : null
        ipv6_unicast_import_route_targets = try(vrf.address_family.ipv6_unicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv6_unicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_targets.stitching, "disable") }
          )
        ] : null
        ipv6_unicast_export_route_targets = try(vrf.address_family.ipv6_unicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv6_unicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_targets.stitching, "disable") }
          )
        ] : null
        ipv4_multicast_import_route_targets = try(vrf.address_family.ipv4_multicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv4_multicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_targets.stitching, "disable") }
          )
        ] : null
        ipv4_multicast_export_route_targets = try(vrf.address_family.ipv4_multicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv4_multicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_targets.stitching, "disable") }
          )
        ] : null
        ipv6_multicast_import_route_targets = try(vrf.address_family.ipv6_multicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv6_multicast.import_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_targets.stitching, "disable") }
          )
        ] : null
        ipv6_multicast_export_route_targets = try(vrf.address_family.ipv6_multicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_targets, null) != null ? [
          for rt in try(vrf.address_family.ipv6_multicast.export_route_targets, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_targets) : merge(
            provider::utils::normalize_bgp_rt(rt.rt),
            { stitching = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_targets.stitching, "disable") }
          )
        ] : null
        vpn_id                         = try(vrf.vpn_id, local.defaults.iosxr.devices.configuration.vrfs.vpn_id, null)
        remote_route_filtering_disable = try(vrf.remote_route_filtering_disable, local.defaults.iosxr.devices.configuration.vrfs.remote_route_filtering_disable, null)
      }
    ]
  ])
}

resource "iosxr_vrf" "vrf" {
  for_each                                                  = { for vrf in local.vrfs : vrf.key => vrf }
  device                                                    = each.value.device_name
  vrf_name                                                  = each.value.name
  description                                               = each.value.description
  fallback_vrf                                              = each.value.fallback_vrf
  evpn_route_sync                                           = each.value.evpn_route_sync
  ipv4_unicast                                              = each.value.ipv4_unicast
  ipv4_unicast_import_route_policy                          = each.value.ipv4_unicast_import_route_policy
  ipv4_unicast_export_route_policy                          = each.value.ipv4_unicast_export_route_policy
  ipv4_unicast_import_from_bridge_domain_advertise_as_vpn   = each.value.ipv4_unicast_import_from_bridge_domain_advertise_as_vpn
  ipv4_unicast_import_from_vrf_advertise_as_vpn             = each.value.ipv4_unicast_import_from_vrf_advertise_as_vpn
  ipv4_unicast_import_from_vrf_allow_backup                 = each.value.ipv4_unicast_import_from_vrf_allow_backup
  ipv4_unicast_import_from_vrf_allow_best_external          = each.value.ipv4_unicast_import_from_vrf_allow_best_external
  ipv4_unicast_import_from_default_vrf_advertise_as_vpn     = each.value.ipv4_unicast_import_from_default_vrf_advertise_as_vpn
  ipv4_unicast_import_from_default_vrf_route_policy         = each.value.ipv4_unicast_import_from_default_vrf_route_policy
  ipv4_unicast_export_to_vrf_allow_imported_vpn             = each.value.ipv4_unicast_export_to_vrf_allow_imported_vpn
  ipv4_unicast_export_to_vrf_allow_backup                   = each.value.ipv4_unicast_export_to_vrf_allow_backup
  ipv4_unicast_export_to_vrf_allow_best_external            = each.value.ipv4_unicast_export_to_vrf_allow_best_external
  ipv4_unicast_export_to_default_vrf_route_policy           = each.value.ipv4_unicast_export_to_default_vrf_route_policy
  ipv4_unicast_export_to_default_vrf_allow_imported_vpn     = each.value.ipv4_unicast_export_to_default_vrf_allow_imported_vpn
  ipv4_unicast_max_prefix_limit                             = each.value.ipv4_unicast_max_prefix_limit
  ipv4_unicast_max_prefix_threshold                         = each.value.ipv4_unicast_max_prefix_threshold
  ipv4_multicast                                            = each.value.ipv4_multicast
  ipv4_multicast_import_route_policy                        = each.value.ipv4_multicast_import_route_policy
  ipv4_multicast_export_route_policy                        = each.value.ipv4_multicast_export_route_policy
  ipv4_multicast_import_from_bridge_domain_advertise_as_vpn = each.value.ipv4_multicast_import_from_bridge_domain_advertise_as_vpn
  ipv4_multicast_import_from_vrf_advertise_as_vpn           = each.value.ipv4_multicast_import_from_vrf_advertise_as_vpn
  ipv4_multicast_import_from_vrf_allow_backup               = each.value.ipv4_multicast_import_from_vrf_allow_backup
  ipv4_multicast_import_from_vrf_allow_best_external        = each.value.ipv4_multicast_import_from_vrf_allow_best_external
  ipv4_multicast_import_from_default_vrf_advertise_as_vpn   = each.value.ipv4_multicast_import_from_default_vrf_advertise_as_vpn
  ipv4_multicast_import_from_default_vrf_route_policy       = each.value.ipv4_multicast_import_from_default_vrf_route_policy
  ipv4_multicast_export_to_vrf_allow_imported_vpn           = each.value.ipv4_multicast_export_to_vrf_allow_imported_vpn
  ipv4_multicast_export_to_vrf_allow_backup                 = each.value.ipv4_multicast_export_to_vrf_allow_backup
  ipv4_multicast_export_to_vrf_allow_best_external          = each.value.ipv4_multicast_export_to_vrf_allow_best_external
  ipv4_multicast_export_to_default_vrf_route_policy         = each.value.ipv4_multicast_export_to_default_vrf_route_policy
  ipv4_multicast_export_to_default_vrf_allow_imported_vpn   = each.value.ipv4_multicast_export_to_default_vrf_allow_imported_vpn
  ipv4_multicast_max_prefix_limit                           = each.value.ipv4_multicast_max_prefix_limit
  ipv4_multicast_max_prefix_threshold                       = each.value.ipv4_multicast_max_prefix_threshold
  ipv4_flowspec                                             = each.value.ipv4_flowspec
  ipv6_unicast                                              = each.value.ipv6_unicast
  ipv6_unicast_import_route_policy                          = each.value.ipv6_unicast_import_route_policy
  ipv6_unicast_export_route_policy                          = each.value.ipv6_unicast_export_route_policy
  ipv6_unicast_import_from_bridge_domain_advertise_as_vpn   = each.value.ipv6_unicast_import_from_bridge_domain_advertise_as_vpn
  ipv6_unicast_import_from_vrf_advertise_as_vpn             = each.value.ipv6_unicast_import_from_vrf_advertise_as_vpn
  ipv6_unicast_import_from_vrf_allow_backup                 = each.value.ipv6_unicast_import_from_vrf_allow_backup
  ipv6_unicast_import_from_vrf_allow_best_external          = each.value.ipv6_unicast_import_from_vrf_allow_best_external
  ipv6_unicast_import_from_default_vrf_advertise_as_vpn     = each.value.ipv6_unicast_import_from_default_vrf_advertise_as_vpn
  ipv6_unicast_import_from_default_vrf_route_policy         = each.value.ipv6_unicast_import_from_default_vrf_route_policy
  ipv6_unicast_export_to_vrf_allow_imported_vpn             = each.value.ipv6_unicast_export_to_vrf_allow_imported_vpn
  ipv6_unicast_export_to_vrf_allow_backup                   = each.value.ipv6_unicast_export_to_vrf_allow_backup
  ipv6_unicast_export_to_vrf_allow_best_external            = each.value.ipv6_unicast_export_to_vrf_allow_best_external
  ipv6_unicast_export_to_default_vrf_route_policy           = each.value.ipv6_unicast_export_to_default_vrf_route_policy
  ipv6_unicast_export_to_default_vrf_allow_imported_vpn     = each.value.ipv6_unicast_export_to_default_vrf_allow_imported_vpn
  ipv6_unicast_max_prefix_limit                             = each.value.ipv6_unicast_max_prefix_limit
  ipv6_unicast_max_prefix_threshold                         = each.value.ipv6_unicast_max_prefix_threshold
  ipv6_multicast                                            = each.value.ipv6_multicast
  ipv6_multicast_import_route_policy                        = each.value.ipv6_multicast_import_route_policy
  ipv6_multicast_export_route_policy                        = each.value.ipv6_multicast_export_route_policy
  ipv6_multicast_import_from_bridge_domain_advertise_as_vpn = each.value.ipv6_multicast_import_from_bridge_domain_advertise_as_vpn
  ipv6_multicast_import_from_vrf_advertise_as_vpn           = each.value.ipv6_multicast_import_from_vrf_advertise_as_vpn
  ipv6_multicast_import_from_vrf_allow_backup               = each.value.ipv6_multicast_import_from_vrf_allow_backup
  ipv6_multicast_import_from_vrf_allow_best_external        = each.value.ipv6_multicast_import_from_vrf_allow_best_external
  ipv6_multicast_import_from_default_vrf_advertise_as_vpn   = each.value.ipv6_multicast_import_from_default_vrf_advertise_as_vpn
  ipv6_multicast_import_from_default_vrf_route_policy       = each.value.ipv6_multicast_import_from_default_vrf_route_policy
  ipv6_multicast_export_to_vrf_allow_imported_vpn           = each.value.ipv6_multicast_export_to_vrf_allow_imported_vpn
  ipv6_multicast_export_to_vrf_allow_backup                 = each.value.ipv6_multicast_export_to_vrf_allow_backup
  ipv6_multicast_export_to_vrf_allow_best_external          = each.value.ipv6_multicast_export_to_vrf_allow_best_external
  ipv6_multicast_export_to_default_vrf_route_policy         = each.value.ipv6_multicast_export_to_default_vrf_route_policy
  ipv6_multicast_export_to_default_vrf_allow_imported_vpn   = each.value.ipv6_multicast_export_to_default_vrf_allow_imported_vpn
  ipv6_multicast_max_prefix_limit                           = each.value.ipv6_multicast_max_prefix_limit
  ipv6_multicast_max_prefix_threshold                       = each.value.ipv6_multicast_max_prefix_threshold
  ipv6_flowspec                                             = each.value.ipv6_flowspec
  rd_two_byte_as_number                                     = try(each.value.rd.format == "two_byte_as" ? each.value.rd.as_number : null, null)
  rd_two_byte_as_index                                      = try(each.value.rd.format == "two_byte_as" ? each.value.rd.assigned_number : null, null)
  rd_four_byte_as_number                                    = try(each.value.rd.format == "four_byte_as" ? each.value.rd.as_number : null, null)
  rd_four_byte_as_index                                     = try(each.value.rd.format == "four_byte_as" ? each.value.rd.assigned_number : null, null)
  rd_ipv4_address                                           = try(each.value.rd.format == "ipv4_address" ? each.value.rd.ipv4_address : null, null)
  rd_ipv4_address_index                                     = try(each.value.rd.format == "ipv4_address" ? each.value.rd.assigned_number : null, null)
  ipv4_unicast_import_route_target_two_byte_as_format = try(length([for rt in each.value.ipv4_unicast_import_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_unicast_import_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv4_unicast_import_route_target_four_byte_as_format = try(length([for rt in each.value.ipv4_unicast_import_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_unicast_import_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv4_unicast_import_route_target_ip_address_format = try(length([for rt in each.value.ipv4_unicast_import_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv4_unicast_import_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv4_unicast_export_route_target_two_byte_as_format = try(length([for rt in each.value.ipv4_unicast_export_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_unicast_export_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv4_unicast_export_route_target_four_byte_as_format = try(length([for rt in each.value.ipv4_unicast_export_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_unicast_export_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv4_unicast_export_route_target_ip_address_format = try(length([for rt in each.value.ipv4_unicast_export_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv4_unicast_export_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv6_unicast_import_route_target_two_byte_as_format = try(length([for rt in each.value.ipv6_unicast_import_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_unicast_import_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv6_unicast_import_route_target_four_byte_as_format = try(length([for rt in each.value.ipv6_unicast_import_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_unicast_import_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv6_unicast_import_route_target_ip_address_format = try(length([for rt in each.value.ipv6_unicast_import_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv6_unicast_import_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv6_unicast_export_route_target_two_byte_as_format = try(length([for rt in each.value.ipv6_unicast_export_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_unicast_export_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv6_unicast_export_route_target_four_byte_as_format = try(length([for rt in each.value.ipv6_unicast_export_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_unicast_export_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv6_unicast_export_route_target_ip_address_format = try(length([for rt in each.value.ipv6_unicast_export_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv6_unicast_export_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv4_multicast_import_route_target_two_byte_as_format = try(length([for rt in each.value.ipv4_multicast_import_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_multicast_import_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv4_multicast_import_route_target_four_byte_as_format = try(length([for rt in each.value.ipv4_multicast_import_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_multicast_import_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv4_multicast_import_route_target_ip_address_format = try(length([for rt in each.value.ipv4_multicast_import_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv4_multicast_import_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv4_multicast_export_route_target_two_byte_as_format = try(length([for rt in each.value.ipv4_multicast_export_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_multicast_export_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv4_multicast_export_route_target_four_byte_as_format = try(length([for rt in each.value.ipv4_multicast_export_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv4_multicast_export_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv4_multicast_export_route_target_ip_address_format = try(length([for rt in each.value.ipv4_multicast_export_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv4_multicast_export_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv6_multicast_import_route_target_two_byte_as_format = try(length([for rt in each.value.ipv6_multicast_import_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_multicast_import_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv6_multicast_import_route_target_four_byte_as_format = try(length([for rt in each.value.ipv6_multicast_import_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_multicast_import_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv6_multicast_import_route_target_ip_address_format = try(length([for rt in each.value.ipv6_multicast_import_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv6_multicast_import_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  ipv6_multicast_export_route_target_two_byte_as_format = try(length([for rt in each.value.ipv6_multicast_export_route_targets : rt if rt.format == "two_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_multicast_export_route_targets : {
      two_byte_as_number = rt.as_number
      asn2_index         = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "two_byte_as"
  ]
  ipv6_multicast_export_route_target_four_byte_as_format = try(length([for rt in each.value.ipv6_multicast_export_route_targets : rt if rt.format == "four_byte_as"]) == 0, true) ? null : [
    for rt in each.value.ipv6_multicast_export_route_targets : {
      four_byte_as_number = rt.as_number
      asn4_index          = rt.assigned_number
      stitching           = rt.stitching
    } if rt.format == "four_byte_as"
  ]
  ipv6_multicast_export_route_target_ip_address_format = try(length([for rt in each.value.ipv6_multicast_export_route_targets : rt if rt.format == "ipv4_address"]) == 0, true) ? null : [
    for rt in each.value.ipv6_multicast_export_route_targets : {
      ipv4_address       = rt.ipv4_address
      ipv4_address_index = rt.assigned_number
      stitching          = rt.stitching
    } if rt.format == "ipv4_address"
  ]
  vpn_id                         = each.value.vpn_id
  remote_route_filtering_disable = each.value.remote_route_filtering_disable

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}
