locals {
  vrfs = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].vrfs, []) : {
        key                                                       = format("%s/%s", device.name, vrf.vrf_name)
        device_name                                               = device.name
        vrf_name                                                  = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.vrfs.vrf_name, null)
        description                                               = try(vrf.description, local.defaults.iosxr.devices.configuration.vrfs.description, null)
        fallback_vrf                                              = try(vrf.fallback_vrf, local.defaults.iosxr.devices.configuration.vrfs.fallback_vrf, null)
        evpn_route_sync                                           = try(vrf.evpn_route_sync, local.defaults.iosxr.devices.configuration.vrfs.evpn_route_sync, null)
        ipv4_unicast                                              = try(can(vrf.address_family.ipv4_unicast), can(local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast), false) ? true : null
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
        ipv4_multicast                                            = try(can(vrf.address_family.ipv4_multicast), can(local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast), false) ? true : null
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
        ipv4_flowspec                                             = try(can(vrf.address_family.ipv4_flowspec), can(local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_flowspec), false) ? true : null
        ipv6_unicast                                              = try(can(vrf.address_family.ipv6_unicast), can(local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast), false) ? true : null
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
        ipv6_multicast                                            = try(can(vrf.address_family.ipv6_multicast), can(local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast), false) ? true : null
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
        ipv6_flowspec                                             = try(can(vrf.address_family.ipv6_flowspec), can(local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_flowspec), false) ? true : null
        rd_two_byte_as_number                                     = try(vrf.rd_two_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.rd_two_byte_as_number, null)
        rd_two_byte_as_index                                      = try(vrf.rd_two_byte_as_index, local.defaults.iosxr.devices.configuration.vrfs.rd_two_byte_as_index, null)
        rd_four_byte_as_number                                    = try(vrf.rd_four_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.rd_four_byte_as_number, null)
        rd_four_byte_as_index                                     = try(vrf.rd_four_byte_as_index, local.defaults.iosxr.devices.configuration.vrfs.rd_four_byte_as_index, null)
        rd_ipv4_address                                           = try(vrf.rd_ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.rd_ipv4_address, null)
        rd_ipv4_address_index                                     = try(vrf.rd_ipv4_address_index, local.defaults.iosxr.devices.configuration.vrfs.rd_ipv4_address_index, null)
        ipv4_unicast_import_route_target_two_byte_as_format = try(length(vrf.address_family.ipv4_unicast.import_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_unicast.import_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv4_unicast_import_route_target_four_byte_as_format = try(length(vrf.address_family.ipv4_unicast.import_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_unicast.import_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv4_unicast_import_route_target_ip_address_format = try(length(vrf.address_family.ipv4_unicast.import_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_unicast.import_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.import_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv4_unicast_export_route_target_two_byte_as_format = try(length(vrf.address_family.ipv4_unicast.export_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_unicast.export_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv4_unicast_export_route_target_four_byte_as_format = try(length(vrf.address_family.ipv4_unicast.export_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_unicast.export_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv4_unicast_export_route_target_ip_address_format = try(length(vrf.address_family.ipv4_unicast.export_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_unicast.export_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_unicast.export_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv6_unicast_import_route_target_two_byte_as_format = try(length(vrf.address_family.ipv6_unicast.import_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_unicast.import_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv6_unicast_import_route_target_four_byte_as_format = try(length(vrf.address_family.ipv6_unicast.import_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_unicast.import_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv6_unicast_import_route_target_ip_address_format = try(length(vrf.address_family.ipv6_unicast.import_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_unicast.import_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.import_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv6_unicast_export_route_target_two_byte_as_format = try(length(vrf.address_family.ipv6_unicast.export_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_unicast.export_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv6_unicast_export_route_target_four_byte_as_format = try(length(vrf.address_family.ipv6_unicast.export_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_unicast.export_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv6_unicast_export_route_target_ip_address_format = try(length(vrf.address_family.ipv6_unicast.export_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_unicast.export_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_unicast.export_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv4_multicast_import_route_target_two_byte_as_format = try(length(vrf.address_family.ipv4_multicast.import_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_multicast.import_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv4_multicast_import_route_target_four_byte_as_format = try(length(vrf.address_family.ipv4_multicast.import_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_multicast.import_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv4_multicast_import_route_target_ip_address_format = try(length(vrf.address_family.ipv4_multicast.import_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_multicast.import_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.import_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv4_multicast_export_route_target_two_byte_as_format = try(length(vrf.address_family.ipv4_multicast.export_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_multicast.export_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv4_multicast_export_route_target_four_byte_as_format = try(length(vrf.address_family.ipv4_multicast.export_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_multicast.export_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv4_multicast_export_route_target_ip_address_format = try(length(vrf.address_family.ipv4_multicast.export_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv4_multicast.export_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv4_multicast.export_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv6_multicast_import_route_target_two_byte_as_format = try(length(vrf.address_family.ipv6_multicast.import_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_multicast.import_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv6_multicast_import_route_target_four_byte_as_format = try(length(vrf.address_family.ipv6_multicast.import_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_multicast.import_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv6_multicast_import_route_target_ip_address_format = try(length(vrf.address_family.ipv6_multicast.import_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_multicast.import_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.import_route_target_ip_address_format.stitching, "disable")
          }
        ]
        ipv6_multicast_export_route_target_two_byte_as_format = try(length(vrf.address_family.ipv6_multicast.export_route_target_two_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_multicast.export_route_target_two_byte_format : {
          two_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_two_byte_format.as_number, null)
          asn2_index         = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_two_byte_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_two_byte_format.stitching, "disable")
          }
        ]
        ipv6_multicast_export_route_target_four_byte_as_format = try(length(vrf.address_family.ipv6_multicast.export_route_target_four_byte_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_multicast.export_route_target_four_byte_format : {
          four_byte_as_number = try(rt.as_number, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_four_byte_format.as_number, null)
          asn4_index          = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_four_byte_format.index, null)
          stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_four_byte_format.stitching, "disable")
          }
        ]
        ipv6_multicast_export_route_target_ip_address_format = try(length(vrf.address_family.ipv6_multicast.export_route_target_ip_address_format) == 0, true) ? null : [for rt in vrf.address_family.ipv6_multicast.export_route_target_ip_address_format : {
          ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_ip_address_format.ipv4_address, null)
          ipv4_address_index = try(rt.index, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_ip_address_format.index, null)
          stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.address_family.ipv6_multicast.export_route_target_ip_address_format.stitching, "disable")
          }
        ]
        vpn_id                         = try(vrf.vpn_id, local.defaults.iosxr.devices.configuration.vrfs.vpn_id, null)
        remote_route_filtering_disable = try(vrf.remote_route_filtering_disable, local.defaults.iosxr.devices.configuration.vrfs.remote_route_filtering_disable, null)
      }
    ]
  ])
}

resource "iosxr_vrf" "vrf" {
  for_each                                                  = { for vrf in local.vrfs : vrf.key => vrf }
  device                                                    = each.value.device_name
  vrf_name                                                  = each.value.vrf_name
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
  rd_two_byte_as_number                                     = each.value.rd_two_byte_as_number
  rd_two_byte_as_index                                      = each.value.rd_two_byte_as_index
  rd_four_byte_as_number                                    = each.value.rd_four_byte_as_number
  rd_four_byte_as_index                                     = each.value.rd_four_byte_as_index
  rd_ipv4_address                                           = each.value.rd_ipv4_address
  rd_ipv4_address_index                                     = each.value.rd_ipv4_address_index
  ipv4_unicast_import_route_target_two_byte_as_format       = each.value.ipv4_unicast_import_route_target_two_byte_as_format
  ipv4_unicast_import_route_target_four_byte_as_format      = each.value.ipv4_unicast_import_route_target_four_byte_as_format
  ipv4_unicast_import_route_target_ip_address_format        = each.value.ipv4_unicast_import_route_target_ip_address_format
  ipv4_unicast_export_route_target_two_byte_as_format       = each.value.ipv4_unicast_export_route_target_two_byte_as_format
  ipv4_unicast_export_route_target_four_byte_as_format      = each.value.ipv4_unicast_export_route_target_four_byte_as_format
  ipv4_unicast_export_route_target_ip_address_format        = each.value.ipv4_unicast_export_route_target_ip_address_format
  ipv6_unicast_import_route_target_two_byte_as_format       = each.value.ipv6_unicast_import_route_target_two_byte_as_format
  ipv6_unicast_import_route_target_four_byte_as_format      = each.value.ipv6_unicast_import_route_target_four_byte_as_format
  ipv6_unicast_import_route_target_ip_address_format        = each.value.ipv6_unicast_import_route_target_ip_address_format
  ipv6_unicast_export_route_target_two_byte_as_format       = each.value.ipv6_unicast_export_route_target_two_byte_as_format
  ipv6_unicast_export_route_target_four_byte_as_format      = each.value.ipv6_unicast_export_route_target_four_byte_as_format
  ipv6_unicast_export_route_target_ip_address_format        = each.value.ipv6_unicast_export_route_target_ip_address_format
  ipv4_multicast_import_route_target_two_byte_as_format     = each.value.ipv4_multicast_import_route_target_two_byte_as_format
  ipv4_multicast_import_route_target_four_byte_as_format    = each.value.ipv4_multicast_import_route_target_four_byte_as_format
  ipv4_multicast_import_route_target_ip_address_format      = each.value.ipv4_multicast_import_route_target_ip_address_format
  ipv4_multicast_export_route_target_two_byte_as_format     = each.value.ipv4_multicast_export_route_target_two_byte_as_format
  ipv4_multicast_export_route_target_four_byte_as_format    = each.value.ipv4_multicast_export_route_target_four_byte_as_format
  ipv4_multicast_export_route_target_ip_address_format      = each.value.ipv4_multicast_export_route_target_ip_address_format
  ipv6_multicast_import_route_target_two_byte_as_format     = each.value.ipv6_multicast_import_route_target_two_byte_as_format
  ipv6_multicast_import_route_target_four_byte_as_format    = each.value.ipv6_multicast_import_route_target_four_byte_as_format
  ipv6_multicast_import_route_target_ip_address_format      = each.value.ipv6_multicast_import_route_target_ip_address_format
  ipv6_multicast_export_route_target_two_byte_as_format     = each.value.ipv6_multicast_export_route_target_two_byte_as_format
  ipv6_multicast_export_route_target_four_byte_as_format    = each.value.ipv6_multicast_export_route_target_four_byte_as_format
  ipv6_multicast_export_route_target_ip_address_format      = each.value.ipv6_multicast_export_route_target_ip_address_format
  vpn_id                                                    = each.value.vpn_id
  remote_route_filtering_disable                            = each.value.remote_route_filtering_disable

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}
