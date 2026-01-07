locals {
  vrfs = flatten([
    for device in local.devices : [
      for vrf in try(local.device_config[device.name].vrfs, []) : {
        key         = format("%s/%s", device.name, vrf.vrf_name)
        device_name = device.name
        vrf_name    = try(vrf.vrf_name, local.defaults.iosxr.devices.configuration.vrfs.vrf_name, null)
        description = try(vrf.description, local.defaults.iosxr.devices.configuration.vrfs.description, null)
        vpn_id      = try(vrf.vpn_id, local.defaults.iosxr.devices.configuration.vrfs.vpn_id, null)
        # IPv4 Address Families
        ipv4_unicast                     = try(vrf.ipv4_unicast, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast, null)
        ipv4_unicast_import_route_policy = try(vrf.ipv4_unicast_import_route_policy, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_policy, null)
        ipv4_unicast_export_route_policy = try(vrf.ipv4_unicast_export_route_policy, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_policy, null)
        ipv4_multicast                   = try(vrf.ipv4_multicast, local.defaults.iosxr.devices.configuration.vrfs.ipv4_multicast, null)
        ipv4_flowspec                    = try(vrf.ipv4_flowspec, local.defaults.iosxr.devices.configuration.vrfs.ipv4_flowspec, null)
        # IPv6 Address Families
        ipv6_unicast                     = try(vrf.ipv6_unicast, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast, null)
        ipv6_unicast_import_route_policy = try(vrf.ipv6_unicast_import_route_policy, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_policy, null)
        ipv6_unicast_export_route_policy = try(vrf.ipv6_unicast_export_route_policy, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_policy, null)
        ipv6_multicast                   = try(vrf.ipv6_multicast, local.defaults.iosxr.devices.configuration.vrfs.ipv6_multicast, null)
        ipv6_flowspec                    = try(vrf.ipv6_flowspec, local.defaults.iosxr.devices.configuration.vrfs.ipv6_flowspec, null)
        # Route Distinguisher - Two Byte AS
        rd_two_byte_as_number = try(vrf.rd_two_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.rd_two_byte_as_number, null)
        rd_two_byte_as_index  = try(vrf.rd_two_byte_as_index, local.defaults.iosxr.devices.configuration.vrfs.rd_two_byte_as_index, null)
        # Route Distinguisher - Four Byte AS
        rd_four_byte_as_number = try(vrf.rd_four_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.rd_four_byte_as_number, null)
        rd_four_byte_as_index  = try(vrf.rd_four_byte_as_index, local.defaults.iosxr.devices.configuration.vrfs.rd_four_byte_as_index, null)
        # Route Distinguisher - IPv4 Address
        rd_ipv4_address       = try(vrf.rd_ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.rd_ipv4_address, null)
        rd_ipv4_address_index = try(vrf.rd_ipv4_address_index, local.defaults.iosxr.devices.configuration.vrfs.rd_ipv4_address_index, null)
        # IPv4 Unicast Import Route Targets - Two Byte AS
        ipv4_unicast_import_route_target_two_byte_as_format = try(length(vrf.ipv4_unicast_import_route_target_two_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv4_unicast_import_route_target_two_byte_as_format : {
            two_byte_as_number = try(rt.two_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_two_byte_as_format.two_byte_as_number, null)
            asn2_index         = try(rt.asn2_index, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_two_byte_as_format.asn2_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_two_byte_as_format.stitching, null)
          }
        ]
        # IPv4 Unicast Import Route Targets - Four Byte AS
        ipv4_unicast_import_route_target_four_byte_as_format = try(length(vrf.ipv4_unicast_import_route_target_four_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv4_unicast_import_route_target_four_byte_as_format : {
            four_byte_as_number = try(rt.four_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_four_byte_as_format.four_byte_as_number, null)
            asn4_index          = try(rt.asn4_index, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_four_byte_as_format.asn4_index, null)
            stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_four_byte_as_format.stitching, null)
          }
        ]
        # IPv4 Unicast Import Route Targets - IP Address
        ipv4_unicast_import_route_target_ip_address_format = try(length(vrf.ipv4_unicast_import_route_target_ip_address_format) == 0, true) ? null : [
          for rt in vrf.ipv4_unicast_import_route_target_ip_address_format : {
            ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_ip_address_format.ipv4_address, null)
            ipv4_address_index = try(rt.ipv4_address_index, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_ip_address_format.ipv4_address_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_import_route_target_ip_address_format.stitching, null)
          }
        ]
        # IPv4 Unicast Export Route Targets - Two Byte AS
        ipv4_unicast_export_route_target_two_byte_as_format = try(length(vrf.ipv4_unicast_export_route_target_two_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv4_unicast_export_route_target_two_byte_as_format : {
            two_byte_as_number = try(rt.two_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_two_byte_as_format.two_byte_as_number, null)
            asn2_index         = try(rt.asn2_index, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_two_byte_as_format.asn2_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_two_byte_as_format.stitching, null)
          }
        ]
        # IPv4 Unicast Export Route Targets - Four Byte AS
        ipv4_unicast_export_route_target_four_byte_as_format = try(length(vrf.ipv4_unicast_export_route_target_four_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv4_unicast_export_route_target_four_byte_as_format : {
            four_byte_as_number = try(rt.four_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_four_byte_as_format.four_byte_as_number, null)
            asn4_index          = try(rt.asn4_index, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_four_byte_as_format.asn4_index, null)
            stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_four_byte_as_format.stitching, null)
          }
        ]
        # IPv4 Unicast Export Route Targets - IP Address
        ipv4_unicast_export_route_target_ip_address_format = try(length(vrf.ipv4_unicast_export_route_target_ip_address_format) == 0, true) ? null : [
          for rt in vrf.ipv4_unicast_export_route_target_ip_address_format : {
            ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_ip_address_format.ipv4_address, null)
            ipv4_address_index = try(rt.ipv4_address_index, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_ip_address_format.ipv4_address_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv4_unicast_export_route_target_ip_address_format.stitching, null)
          }
        ]
        # IPv6 Unicast Import Route Targets - Two Byte AS
        ipv6_unicast_import_route_target_two_byte_as_format = try(length(vrf.ipv6_unicast_import_route_target_two_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv6_unicast_import_route_target_two_byte_as_format : {
            two_byte_as_number = try(rt.two_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_two_byte_as_format.two_byte_as_number, null)
            asn2_index         = try(rt.asn2_index, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_two_byte_as_format.asn2_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_two_byte_as_format.stitching, null)
          }
        ]
        # IPv6 Unicast Import Route Targets - Four Byte AS
        ipv6_unicast_import_route_target_four_byte_as_format = try(length(vrf.ipv6_unicast_import_route_target_four_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv6_unicast_import_route_target_four_byte_as_format : {
            four_byte_as_number = try(rt.four_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_four_byte_as_format.four_byte_as_number, null)
            asn4_index          = try(rt.asn4_index, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_four_byte_as_format.asn4_index, null)
            stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_four_byte_as_format.stitching, null)
          }
        ]
        # IPv6 Unicast Import Route Targets - IP Address
        ipv6_unicast_import_route_target_ip_address_format = try(length(vrf.ipv6_unicast_import_route_target_ip_address_format) == 0, true) ? null : [
          for rt in vrf.ipv6_unicast_import_route_target_ip_address_format : {
            ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_ip_address_format.ipv4_address, null)
            ipv4_address_index = try(rt.ipv4_address_index, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_ip_address_format.ipv4_address_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_import_route_target_ip_address_format.stitching, null)
          }
        ]
        # IPv6 Unicast Export Route Targets - Two Byte AS
        ipv6_unicast_export_route_target_two_byte_as_format = try(length(vrf.ipv6_unicast_export_route_target_two_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv6_unicast_export_route_target_two_byte_as_format : {
            two_byte_as_number = try(rt.two_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_two_byte_as_format.two_byte_as_number, null)
            asn2_index         = try(rt.asn2_index, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_two_byte_as_format.asn2_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_two_byte_as_format.stitching, null)
          }
        ]
        # IPv6 Unicast Export Route Targets - Four Byte AS
        ipv6_unicast_export_route_target_four_byte_as_format = try(length(vrf.ipv6_unicast_export_route_target_four_byte_as_format) == 0, true) ? null : [
          for rt in vrf.ipv6_unicast_export_route_target_four_byte_as_format : {
            four_byte_as_number = try(rt.four_byte_as_number, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_four_byte_as_format.four_byte_as_number, null)
            asn4_index          = try(rt.asn4_index, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_four_byte_as_format.asn4_index, null)
            stitching           = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_four_byte_as_format.stitching, null)
          }
        ]
        # IPv6 Unicast Export Route Targets - IP Address
        ipv6_unicast_export_route_target_ip_address_format = try(length(vrf.ipv6_unicast_export_route_target_ip_address_format) == 0, true) ? null : [
          for rt in vrf.ipv6_unicast_export_route_target_ip_address_format : {
            ipv4_address       = try(rt.ipv4_address, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_ip_address_format.ipv4_address, null)
            ipv4_address_index = try(rt.ipv4_address_index, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_ip_address_format.ipv4_address_index, null)
            stitching          = try(rt.stitching, local.defaults.iosxr.devices.configuration.vrfs.ipv6_unicast_export_route_target_ip_address_format.stitching, null)
          }
        ]
      }
    ]
  ])
}

resource "iosxr_vrf" "vrf" {
  for_each    = { for vrf in local.vrfs : vrf.key => vrf }
  device      = each.value.device_name
  vrf_name    = each.value.vrf_name
  description = each.value.description
  vpn_id      = each.value.vpn_id
  # IPv4 Address Families
  ipv4_unicast                     = each.value.ipv4_unicast
  ipv4_unicast_import_route_policy = each.value.ipv4_unicast_import_route_policy
  ipv4_unicast_export_route_policy = each.value.ipv4_unicast_export_route_policy
  ipv4_multicast                   = each.value.ipv4_multicast
  ipv4_flowspec                    = each.value.ipv4_flowspec
  # IPv6 Address Families
  ipv6_unicast                     = each.value.ipv6_unicast
  ipv6_unicast_import_route_policy = each.value.ipv6_unicast_import_route_policy
  ipv6_unicast_export_route_policy = each.value.ipv6_unicast_export_route_policy
  ipv6_multicast                   = each.value.ipv6_multicast
  ipv6_flowspec                    = each.value.ipv6_flowspec
  # Route Distinguisher - Two Byte AS
  rd_two_byte_as_number = each.value.rd_two_byte_as_number
  rd_two_byte_as_index  = each.value.rd_two_byte_as_index
  # Route Distinguisher - Four Byte AS
  rd_four_byte_as_number = each.value.rd_four_byte_as_number
  rd_four_byte_as_index  = each.value.rd_four_byte_as_index
  # Route Distinguisher - IPv4 Address
  rd_ipv4_address       = each.value.rd_ipv4_address
  rd_ipv4_address_index = each.value.rd_ipv4_address_index
  # IPv4 Unicast Import Route Targets
  ipv4_unicast_import_route_target_two_byte_as_format  = each.value.ipv4_unicast_import_route_target_two_byte_as_format
  ipv4_unicast_import_route_target_four_byte_as_format = each.value.ipv4_unicast_import_route_target_four_byte_as_format
  ipv4_unicast_import_route_target_ip_address_format   = each.value.ipv4_unicast_import_route_target_ip_address_format
  # IPv4 Unicast Export Route Targets
  ipv4_unicast_export_route_target_two_byte_as_format  = each.value.ipv4_unicast_export_route_target_two_byte_as_format
  ipv4_unicast_export_route_target_four_byte_as_format = each.value.ipv4_unicast_export_route_target_four_byte_as_format
  ipv4_unicast_export_route_target_ip_address_format   = each.value.ipv4_unicast_export_route_target_ip_address_format
  # IPv6 Unicast Import Route Targets
  ipv6_unicast_import_route_target_two_byte_as_format  = each.value.ipv6_unicast_import_route_target_two_byte_as_format
  ipv6_unicast_import_route_target_four_byte_as_format = each.value.ipv6_unicast_import_route_target_four_byte_as_format
  ipv6_unicast_import_route_target_ip_address_format   = each.value.ipv6_unicast_import_route_target_ip_address_format
  # IPv6 Unicast Export Route Targets
  ipv6_unicast_export_route_target_two_byte_as_format  = each.value.ipv6_unicast_export_route_target_two_byte_as_format
  ipv6_unicast_export_route_target_four_byte_as_format = each.value.ipv6_unicast_export_route_target_four_byte_as_format
  ipv6_unicast_export_route_target_ip_address_format   = each.value.ipv6_unicast_export_route_target_ip_address_format

  depends_on = [
    iosxr_route_policy.route_policy
  ]
}
