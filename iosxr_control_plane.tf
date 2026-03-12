locals {
  control_plane = flatten([
    for device in local.devices : [
      {
        key                      = device.name
        device_name              = device.name
        mgmt_oob_vrf             = try(local.device_config[device.name].control_plane.mgmt_oob_vrf, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_vrf, null)
        mgmt_oob_inband_behavior = try(local.device_config[device.name].control_plane.mgmt_oob_inband_behavior, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_inband_behavior, null)

        mgmt_inband_all_ssh                     = try(local.device_config[device.name].control_plane.mgmt_inband_all.ssh, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.ssh, null)
        mgmt_inband_all_ssh_ipv4_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_ssh_ipv4_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_ssh_ipv6_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_ssh_ipv6_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.ssh_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_telnet                  = try(local.device_config[device.name].control_plane.mgmt_inband_all.telnet, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.telnet, null)
        mgmt_inband_all_telnet_ipv4_prefixes    = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_telnet_ipv4_hosts       = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_telnet_ipv6_prefixes    = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_telnet_ipv6_hosts       = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.telnet_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_snmp                    = try(local.device_config[device.name].control_plane.mgmt_inband_all.snmp, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.snmp, null)
        mgmt_inband_all_snmp_ipv4_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_snmp_ipv4_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_snmp_ipv6_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_snmp_ipv6_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.snmp_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_tftp                    = try(local.device_config[device.name].control_plane.mgmt_inband_all.tftp, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.tftp, null)
        mgmt_inband_all_tftp_ipv4_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_tftp_ipv4_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_tftp_ipv6_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_tftp_ipv6_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.tftp_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_http                    = try(local.device_config[device.name].control_plane.mgmt_inband_all.http, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.http, null)
        mgmt_inband_all_http_ipv4_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.http_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.http_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_http_ipv4_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.http_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.http_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_xml                     = try(local.device_config[device.name].control_plane.mgmt_inband_all.xml, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.xml, null)
        mgmt_inband_all_xml_ipv4_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_xml_ipv4_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_xml_ipv6_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_xml_ipv6_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.xml_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_netconf                 = try(local.device_config[device.name].control_plane.mgmt_inband_all.netconf, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.netconf, null)
        mgmt_inband_all_netconf_ipv4_prefixes   = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_netconf_ipv4_hosts      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_netconf_ipv6_prefixes   = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_netconf_ipv6_hosts      = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.netconf_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_allow_all               = try(local.device_config[device.name].control_plane.mgmt_inband_all.allow_all, local.defaults.iosxr.devices.configuration.control_plane.mgmt_inband_all.allow_all, null)
        mgmt_inband_all_allow_all_ipv4_prefixes = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_allow_all_ipv4_hosts    = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_inband_all_allow_all_ipv6_prefixes = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_inband_all_allow_all_ipv6_hosts    = try(length(local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_inband_all.allow_all_ipv6_hosts : { address = try(h.address, null) }]

        mgmt_oob_all_ssh                     = try(local.device_config[device.name].control_plane.mgmt_oob_all.ssh, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.ssh, null)
        mgmt_oob_all_ssh_ipv4_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_ssh_ipv4_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_ssh_ipv6_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_ssh_ipv6_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.ssh_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_telnet                  = try(local.device_config[device.name].control_plane.mgmt_oob_all.telnet, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.telnet, null)
        mgmt_oob_all_telnet_ipv4_prefixes    = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_telnet_ipv4_hosts       = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_telnet_ipv6_prefixes    = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_telnet_ipv6_hosts       = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.telnet_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_snmp                    = try(local.device_config[device.name].control_plane.mgmt_oob_all.snmp, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.snmp, null)
        mgmt_oob_all_snmp_ipv4_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_snmp_ipv4_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_snmp_ipv6_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_snmp_ipv6_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.snmp_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_tftp                    = try(local.device_config[device.name].control_plane.mgmt_oob_all.tftp, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.tftp, null)
        mgmt_oob_all_tftp_ipv4_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_tftp_ipv4_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_tftp_ipv6_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_tftp_ipv6_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.tftp_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_http                    = try(local.device_config[device.name].control_plane.mgmt_oob_all.http, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.http, null)
        mgmt_oob_all_http_ipv4_prefixes      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.http_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.http_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_http_ipv4_hosts         = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.http_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.http_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_xml                     = try(local.device_config[device.name].control_plane.mgmt_oob_all.xml, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.xml, null)
        mgmt_oob_all_xml_ipv4_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_xml_ipv4_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_xml_ipv6_prefixes       = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_xml_ipv6_hosts          = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.xml_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_netconf                 = try(local.device_config[device.name].control_plane.mgmt_oob_all.netconf, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.netconf, null)
        mgmt_oob_all_netconf_ipv4_prefixes   = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_netconf_ipv4_hosts      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_netconf_ipv6_prefixes   = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_netconf_ipv6_hosts      = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.netconf_ipv6_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_allow_all               = try(local.device_config[device.name].control_plane.mgmt_oob_all.allow_all, local.defaults.iosxr.devices.configuration.control_plane.mgmt_oob_all.allow_all, null)
        mgmt_oob_all_allow_all_ipv4_prefixes = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv4_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_allow_all_ipv4_hosts    = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv4_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv4_hosts : { address = try(h.address, null) }]
        mgmt_oob_all_allow_all_ipv6_prefixes = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv6_prefixes) == 0, true) ? null : [for p in local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
        mgmt_oob_all_allow_all_ipv6_hosts    = try(length(local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv6_hosts) == 0, true) ? null : [for h in local.device_config[device.name].control_plane.mgmt_oob_all.allow_all_ipv6_hosts : { address = try(h.address, null) }]

        mgmt_inband_interfaces = try(length(local.device_config[device.name].control_plane.mgmt_inband_interfaces) == 0, true) ? null : [
          for intf in local.device_config[device.name].control_plane.mgmt_inband_interfaces : {
            interface_name          = try(intf.interface_name, null)
            ssh                     = try(intf.ssh, null)
            ssh_ipv4_prefixes       = try(length(intf.ssh_ipv4_prefixes) == 0, true) ? null : [for p in intf.ssh_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            ssh_ipv4_hosts          = try(length(intf.ssh_ipv4_hosts) == 0, true) ? null : [for h in intf.ssh_ipv4_hosts : { address = try(h.address, null) }]
            ssh_ipv6_prefixes       = try(length(intf.ssh_ipv6_prefixes) == 0, true) ? null : [for p in intf.ssh_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            ssh_ipv6_hosts          = try(length(intf.ssh_ipv6_hosts) == 0, true) ? null : [for h in intf.ssh_ipv6_hosts : { address = try(h.address, null) }]
            telnet                  = try(intf.telnet, null)
            telnet_ipv4_prefixes    = try(length(intf.telnet_ipv4_prefixes) == 0, true) ? null : [for p in intf.telnet_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            telnet_ipv4_hosts       = try(length(intf.telnet_ipv4_hosts) == 0, true) ? null : [for h in intf.telnet_ipv4_hosts : { address = try(h.address, null) }]
            telnet_ipv6_prefixes    = try(length(intf.telnet_ipv6_prefixes) == 0, true) ? null : [for p in intf.telnet_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            telnet_ipv6_hosts       = try(length(intf.telnet_ipv6_hosts) == 0, true) ? null : [for h in intf.telnet_ipv6_hosts : { address = try(h.address, null) }]
            snmp                    = try(intf.snmp, null)
            snmp_ipv4_prefixes      = try(length(intf.snmp_ipv4_prefixes) == 0, true) ? null : [for p in intf.snmp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            snmp_ipv4_hosts         = try(length(intf.snmp_ipv4_hosts) == 0, true) ? null : [for h in intf.snmp_ipv4_hosts : { address = try(h.address, null) }]
            snmp_ipv6_prefixes      = try(length(intf.snmp_ipv6_prefixes) == 0, true) ? null : [for p in intf.snmp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            snmp_ipv6_hosts         = try(length(intf.snmp_ipv6_hosts) == 0, true) ? null : [for h in intf.snmp_ipv6_hosts : { address = try(h.address, null) }]
            tftp                    = try(intf.tftp, null)
            tftp_ipv4_prefixes      = try(length(intf.tftp_ipv4_prefixes) == 0, true) ? null : [for p in intf.tftp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            tftp_ipv4_hosts         = try(length(intf.tftp_ipv4_hosts) == 0, true) ? null : [for h in intf.tftp_ipv4_hosts : { address = try(h.address, null) }]
            tftp_ipv6_prefixes      = try(length(intf.tftp_ipv6_prefixes) == 0, true) ? null : [for p in intf.tftp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            tftp_ipv6_hosts         = try(length(intf.tftp_ipv6_hosts) == 0, true) ? null : [for h in intf.tftp_ipv6_hosts : { address = try(h.address, null) }]
            http                    = try(intf.http, null)
            http_ipv4_prefixes      = try(length(intf.http_ipv4_prefixes) == 0, true) ? null : [for p in intf.http_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            http_ipv4_hosts         = try(length(intf.http_ipv4_hosts) == 0, true) ? null : [for h in intf.http_ipv4_hosts : { address = try(h.address, null) }]
            xml                     = try(intf.xml, null)
            xml_ipv4_prefixes       = try(length(intf.xml_ipv4_prefixes) == 0, true) ? null : [for p in intf.xml_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            xml_ipv4_hosts          = try(length(intf.xml_ipv4_hosts) == 0, true) ? null : [for h in intf.xml_ipv4_hosts : { address = try(h.address, null) }]
            xml_ipv6_prefixes       = try(length(intf.xml_ipv6_prefixes) == 0, true) ? null : [for p in intf.xml_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            xml_ipv6_hosts          = try(length(intf.xml_ipv6_hosts) == 0, true) ? null : [for h in intf.xml_ipv6_hosts : { address = try(h.address, null) }]
            netconf                 = try(intf.netconf, null)
            netconf_ipv4_prefixes   = try(length(intf.netconf_ipv4_prefixes) == 0, true) ? null : [for p in intf.netconf_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            netconf_ipv4_hosts      = try(length(intf.netconf_ipv4_hosts) == 0, true) ? null : [for h in intf.netconf_ipv4_hosts : { address = try(h.address, null) }]
            netconf_ipv6_prefixes   = try(length(intf.netconf_ipv6_prefixes) == 0, true) ? null : [for p in intf.netconf_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            netconf_ipv6_hosts      = try(length(intf.netconf_ipv6_hosts) == 0, true) ? null : [for h in intf.netconf_ipv6_hosts : { address = try(h.address, null) }]
            allow_all               = try(intf.allow_all, null)
            allow_all_ipv4_prefixes = try(length(intf.allow_all_ipv4_prefixes) == 0, true) ? null : [for p in intf.allow_all_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            allow_all_ipv4_hosts    = try(length(intf.allow_all_ipv4_hosts) == 0, true) ? null : [for h in intf.allow_all_ipv4_hosts : { address = try(h.address, null) }]
            allow_all_ipv6_prefixes = try(length(intf.allow_all_ipv6_prefixes) == 0, true) ? null : [for p in intf.allow_all_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            allow_all_ipv6_hosts    = try(length(intf.allow_all_ipv6_hosts) == 0, true) ? null : [for h in intf.allow_all_ipv6_hosts : { address = try(h.address, null) }]
          }
        ]
        mgmt_oob_interfaces = try(length(local.device_config[device.name].control_plane.mgmt_oob_interfaces) == 0, true) ? null : [
          for intf in local.device_config[device.name].control_plane.mgmt_oob_interfaces : {
            interface_name          = try(intf.interface_name, null)
            ssh                     = try(intf.ssh, null)
            ssh_ipv4_prefixes       = try(length(intf.ssh_ipv4_prefixes) == 0, true) ? null : [for p in intf.ssh_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            ssh_ipv4_hosts          = try(length(intf.ssh_ipv4_hosts) == 0, true) ? null : [for h in intf.ssh_ipv4_hosts : { address = try(h.address, null) }]
            ssh_ipv6_prefixes       = try(length(intf.ssh_ipv6_prefixes) == 0, true) ? null : [for p in intf.ssh_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            ssh_ipv6_hosts          = try(length(intf.ssh_ipv6_hosts) == 0, true) ? null : [for h in intf.ssh_ipv6_hosts : { address = try(h.address, null) }]
            telnet                  = try(intf.telnet, null)
            telnet_ipv4_prefixes    = try(length(intf.telnet_ipv4_prefixes) == 0, true) ? null : [for p in intf.telnet_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            telnet_ipv4_hosts       = try(length(intf.telnet_ipv4_hosts) == 0, true) ? null : [for h in intf.telnet_ipv4_hosts : { address = try(h.address, null) }]
            telnet_ipv6_prefixes    = try(length(intf.telnet_ipv6_prefixes) == 0, true) ? null : [for p in intf.telnet_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            telnet_ipv6_hosts       = try(length(intf.telnet_ipv6_hosts) == 0, true) ? null : [for h in intf.telnet_ipv6_hosts : { address = try(h.address, null) }]
            snmp                    = try(intf.snmp, null)
            snmp_ipv4_prefixes      = try(length(intf.snmp_ipv4_prefixes) == 0, true) ? null : [for p in intf.snmp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            snmp_ipv4_hosts         = try(length(intf.snmp_ipv4_hosts) == 0, true) ? null : [for h in intf.snmp_ipv4_hosts : { address = try(h.address, null) }]
            snmp_ipv6_prefixes      = try(length(intf.snmp_ipv6_prefixes) == 0, true) ? null : [for p in intf.snmp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            snmp_ipv6_hosts         = try(length(intf.snmp_ipv6_hosts) == 0, true) ? null : [for h in intf.snmp_ipv6_hosts : { address = try(h.address, null) }]
            tftp                    = try(intf.tftp, null)
            tftp_ipv4_prefixes      = try(length(intf.tftp_ipv4_prefixes) == 0, true) ? null : [for p in intf.tftp_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            tftp_ipv4_hosts         = try(length(intf.tftp_ipv4_hosts) == 0, true) ? null : [for h in intf.tftp_ipv4_hosts : { address = try(h.address, null) }]
            tftp_ipv6_prefixes      = try(length(intf.tftp_ipv6_prefixes) == 0, true) ? null : [for p in intf.tftp_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            tftp_ipv6_hosts         = try(length(intf.tftp_ipv6_hosts) == 0, true) ? null : [for h in intf.tftp_ipv6_hosts : { address = try(h.address, null) }]
            http                    = try(intf.http, null)
            http_ipv4_prefixes      = try(length(intf.http_ipv4_prefixes) == 0, true) ? null : [for p in intf.http_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            http_ipv4_hosts         = try(length(intf.http_ipv4_hosts) == 0, true) ? null : [for h in intf.http_ipv4_hosts : { address = try(h.address, null) }]
            xml                     = try(intf.xml, null)
            xml_ipv4_prefixes       = try(length(intf.xml_ipv4_prefixes) == 0, true) ? null : [for p in intf.xml_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            xml_ipv4_hosts          = try(length(intf.xml_ipv4_hosts) == 0, true) ? null : [for h in intf.xml_ipv4_hosts : { address = try(h.address, null) }]
            xml_ipv6_prefixes       = try(length(intf.xml_ipv6_prefixes) == 0, true) ? null : [for p in intf.xml_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            xml_ipv6_hosts          = try(length(intf.xml_ipv6_hosts) == 0, true) ? null : [for h in intf.xml_ipv6_hosts : { address = try(h.address, null) }]
            netconf                 = try(intf.netconf, null)
            netconf_ipv4_prefixes   = try(length(intf.netconf_ipv4_prefixes) == 0, true) ? null : [for p in intf.netconf_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            netconf_ipv4_hosts      = try(length(intf.netconf_ipv4_hosts) == 0, true) ? null : [for h in intf.netconf_ipv4_hosts : { address = try(h.address, null) }]
            netconf_ipv6_prefixes   = try(length(intf.netconf_ipv6_prefixes) == 0, true) ? null : [for p in intf.netconf_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            netconf_ipv6_hosts      = try(length(intf.netconf_ipv6_hosts) == 0, true) ? null : [for h in intf.netconf_ipv6_hosts : { address = try(h.address, null) }]
            allow_all               = try(intf.allow_all, null)
            allow_all_ipv4_prefixes = try(length(intf.allow_all_ipv4_prefixes) == 0, true) ? null : [for p in intf.allow_all_ipv4_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            allow_all_ipv4_hosts    = try(length(intf.allow_all_ipv4_hosts) == 0, true) ? null : [for h in intf.allow_all_ipv4_hosts : { address = try(h.address, null) }]
            allow_all_ipv6_prefixes = try(length(intf.allow_all_ipv6_prefixes) == 0, true) ? null : [for p in intf.allow_all_ipv6_prefixes : { address = try(p.address, null), length = try(p.length, null) }]
            allow_all_ipv6_hosts    = try(length(intf.allow_all_ipv6_hosts) == 0, true) ? null : [for h in intf.allow_all_ipv6_hosts : { address = try(h.address, null) }]
          }
        ]
      }
    ] if try(local.device_config[device.name].control_plane, null) != null || try(local.defaults.iosxr.devices.configuration.control_plane, null) != null
  ])
}

resource "iosxr_control_plane" "control_plane" {
  for_each = { for cp in local.control_plane : cp.key => cp }
  device   = each.value.device_name

  mgmt_oob_vrf             = each.value.mgmt_oob_vrf
  mgmt_oob_inband_behavior = each.value.mgmt_oob_inband_behavior

  mgmt_inband_all_ssh                     = each.value.mgmt_inband_all_ssh
  mgmt_inband_all_ssh_ipv4_prefixes       = each.value.mgmt_inband_all_ssh_ipv4_prefixes
  mgmt_inband_all_ssh_ipv4_hosts          = each.value.mgmt_inband_all_ssh_ipv4_hosts
  mgmt_inband_all_ssh_ipv6_prefixes       = each.value.mgmt_inband_all_ssh_ipv6_prefixes
  mgmt_inband_all_ssh_ipv6_hosts          = each.value.mgmt_inband_all_ssh_ipv6_hosts
  mgmt_inband_all_telnet                  = each.value.mgmt_inband_all_telnet
  mgmt_inband_all_telnet_ipv4_prefixes    = each.value.mgmt_inband_all_telnet_ipv4_prefixes
  mgmt_inband_all_telnet_ipv4_hosts       = each.value.mgmt_inband_all_telnet_ipv4_hosts
  mgmt_inband_all_telnet_ipv6_prefixes    = each.value.mgmt_inband_all_telnet_ipv6_prefixes
  mgmt_inband_all_telnet_ipv6_hosts       = each.value.mgmt_inband_all_telnet_ipv6_hosts
  mgmt_inband_all_snmp                    = each.value.mgmt_inband_all_snmp
  mgmt_inband_all_snmp_ipv4_prefixes      = each.value.mgmt_inband_all_snmp_ipv4_prefixes
  mgmt_inband_all_snmp_ipv4_hosts         = each.value.mgmt_inband_all_snmp_ipv4_hosts
  mgmt_inband_all_snmp_ipv6_prefixes      = each.value.mgmt_inband_all_snmp_ipv6_prefixes
  mgmt_inband_all_snmp_ipv6_hosts         = each.value.mgmt_inband_all_snmp_ipv6_hosts
  mgmt_inband_all_tftp                    = each.value.mgmt_inband_all_tftp
  mgmt_inband_all_tftp_ipv4_prefixes      = each.value.mgmt_inband_all_tftp_ipv4_prefixes
  mgmt_inband_all_tftp_ipv4_hosts         = each.value.mgmt_inband_all_tftp_ipv4_hosts
  mgmt_inband_all_tftp_ipv6_prefixes      = each.value.mgmt_inband_all_tftp_ipv6_prefixes
  mgmt_inband_all_tftp_ipv6_hosts         = each.value.mgmt_inband_all_tftp_ipv6_hosts
  mgmt_inband_all_http                    = each.value.mgmt_inband_all_http
  mgmt_inband_all_http_ipv4_prefixes      = each.value.mgmt_inband_all_http_ipv4_prefixes
  mgmt_inband_all_http_ipv4_hosts         = each.value.mgmt_inband_all_http_ipv4_hosts
  mgmt_inband_all_xml                     = each.value.mgmt_inband_all_xml
  mgmt_inband_all_xml_ipv4_prefixes       = each.value.mgmt_inband_all_xml_ipv4_prefixes
  mgmt_inband_all_xml_ipv4_hosts          = each.value.mgmt_inband_all_xml_ipv4_hosts
  mgmt_inband_all_xml_ipv6_prefixes       = each.value.mgmt_inband_all_xml_ipv6_prefixes
  mgmt_inband_all_xml_ipv6_hosts          = each.value.mgmt_inband_all_xml_ipv6_hosts
  mgmt_inband_all_netconf                 = each.value.mgmt_inband_all_netconf
  mgmt_inband_all_netconf_ipv4_prefixes   = each.value.mgmt_inband_all_netconf_ipv4_prefixes
  mgmt_inband_all_netconf_ipv4_hosts      = each.value.mgmt_inband_all_netconf_ipv4_hosts
  mgmt_inband_all_netconf_ipv6_prefixes   = each.value.mgmt_inband_all_netconf_ipv6_prefixes
  mgmt_inband_all_netconf_ipv6_hosts      = each.value.mgmt_inband_all_netconf_ipv6_hosts
  mgmt_inband_all_allow_all               = each.value.mgmt_inband_all_allow_all
  mgmt_inband_all_allow_all_ipv4_prefixes = each.value.mgmt_inband_all_allow_all_ipv4_prefixes
  mgmt_inband_all_allow_all_ipv4_hosts    = each.value.mgmt_inband_all_allow_all_ipv4_hosts
  mgmt_inband_all_allow_all_ipv6_prefixes = each.value.mgmt_inband_all_allow_all_ipv6_prefixes
  mgmt_inband_all_allow_all_ipv6_hosts    = each.value.mgmt_inband_all_allow_all_ipv6_hosts

  mgmt_oob_all_ssh                     = each.value.mgmt_oob_all_ssh
  mgmt_oob_all_ssh_ipv4_prefixes       = each.value.mgmt_oob_all_ssh_ipv4_prefixes
  mgmt_oob_all_ssh_ipv4_hosts          = each.value.mgmt_oob_all_ssh_ipv4_hosts
  mgmt_oob_all_ssh_ipv6_prefixes       = each.value.mgmt_oob_all_ssh_ipv6_prefixes
  mgmt_oob_all_ssh_ipv6_hosts          = each.value.mgmt_oob_all_ssh_ipv6_hosts
  mgmt_oob_all_telnet                  = each.value.mgmt_oob_all_telnet
  mgmt_oob_all_telnet_ipv4_prefixes    = each.value.mgmt_oob_all_telnet_ipv4_prefixes
  mgmt_oob_all_telnet_ipv4_hosts       = each.value.mgmt_oob_all_telnet_ipv4_hosts
  mgmt_oob_all_telnet_ipv6_prefixes    = each.value.mgmt_oob_all_telnet_ipv6_prefixes
  mgmt_oob_all_telnet_ipv6_hosts       = each.value.mgmt_oob_all_telnet_ipv6_hosts
  mgmt_oob_all_snmp                    = each.value.mgmt_oob_all_snmp
  mgmt_oob_all_snmp_ipv4_prefixes      = each.value.mgmt_oob_all_snmp_ipv4_prefixes
  mgmt_oob_all_snmp_ipv4_hosts         = each.value.mgmt_oob_all_snmp_ipv4_hosts
  mgmt_oob_all_snmp_ipv6_prefixes      = each.value.mgmt_oob_all_snmp_ipv6_prefixes
  mgmt_oob_all_snmp_ipv6_hosts         = each.value.mgmt_oob_all_snmp_ipv6_hosts
  mgmt_oob_all_tftp                    = each.value.mgmt_oob_all_tftp
  mgmt_oob_all_tftp_ipv4_prefixes      = each.value.mgmt_oob_all_tftp_ipv4_prefixes
  mgmt_oob_all_tftp_ipv4_hosts         = each.value.mgmt_oob_all_tftp_ipv4_hosts
  mgmt_oob_all_tftp_ipv6_prefixes      = each.value.mgmt_oob_all_tftp_ipv6_prefixes
  mgmt_oob_all_tftp_ipv6_hosts         = each.value.mgmt_oob_all_tftp_ipv6_hosts
  mgmt_oob_all_http                    = each.value.mgmt_oob_all_http
  mgmt_oob_all_http_ipv4_prefixes      = each.value.mgmt_oob_all_http_ipv4_prefixes
  mgmt_oob_all_http_ipv4_hosts         = each.value.mgmt_oob_all_http_ipv4_hosts
  mgmt_oob_all_xml                     = each.value.mgmt_oob_all_xml
  mgmt_oob_all_xml_ipv4_prefixes       = each.value.mgmt_oob_all_xml_ipv4_prefixes
  mgmt_oob_all_xml_ipv4_hosts          = each.value.mgmt_oob_all_xml_ipv4_hosts
  mgmt_oob_all_xml_ipv6_prefixes       = each.value.mgmt_oob_all_xml_ipv6_prefixes
  mgmt_oob_all_xml_ipv6_hosts          = each.value.mgmt_oob_all_xml_ipv6_hosts
  mgmt_oob_all_netconf                 = each.value.mgmt_oob_all_netconf
  mgmt_oob_all_netconf_ipv4_prefixes   = each.value.mgmt_oob_all_netconf_ipv4_prefixes
  mgmt_oob_all_netconf_ipv4_hosts      = each.value.mgmt_oob_all_netconf_ipv4_hosts
  mgmt_oob_all_netconf_ipv6_prefixes   = each.value.mgmt_oob_all_netconf_ipv6_prefixes
  mgmt_oob_all_netconf_ipv6_hosts      = each.value.mgmt_oob_all_netconf_ipv6_hosts
  mgmt_oob_all_allow_all               = each.value.mgmt_oob_all_allow_all
  mgmt_oob_all_allow_all_ipv4_prefixes = each.value.mgmt_oob_all_allow_all_ipv4_prefixes
  mgmt_oob_all_allow_all_ipv4_hosts    = each.value.mgmt_oob_all_allow_all_ipv4_hosts
  mgmt_oob_all_allow_all_ipv6_prefixes = each.value.mgmt_oob_all_allow_all_ipv6_prefixes
  mgmt_oob_all_allow_all_ipv6_hosts    = each.value.mgmt_oob_all_allow_all_ipv6_hosts

  mgmt_inband_interfaces = each.value.mgmt_inband_interfaces
  mgmt_oob_interfaces    = each.value.mgmt_oob_interfaces
}
