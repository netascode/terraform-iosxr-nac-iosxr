locals {
  control_plane = flatten([
    for device in local.devices : [
      {
        key                      = device.name
        device_name              = device.name
        mgmt_oob_vrf             = try(local.device_config[device.name].control_plane.management_plane.out_of_band.vrf, local.defaults.iosxr.devices.configuration.control_plane.management_plane.out_of_band.vrf, null)
        mgmt_oob_inband_behavior = try(local.device_config[device.name].control_plane.management_plane.out_of_band.inband_behavior, local.defaults.iosxr.devices.configuration.control_plane.management_plane.out_of_band.inband_behavior, null)
        mgmt_inband_interfaces = try(length(local.device_config[device.name].control_plane.management_plane.inband.interfaces) == 0, true) ? null : [
          for intf in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces, []) : {
            interface_name = try(intf.name, local.defaults.iosxr.devices.configuration.control_plane.management_plane.inband.interfaces.name, null)
            ssh            = try(length([for e in try(intf.ssh, []) : e if e.address == "any"]) > 0, false) ? true : null
            telnet         = try(length([for e in try(intf.telnet, []) : e if e.address == "any"]) > 0, false) ? true : null
            snmp           = try(length([for e in try(intf.snmp, []) : e if e.address == "any"]) > 0, false) ? true : null
            tftp           = try(length([for e in try(intf.tftp, []) : e if e.address == "any"]) > 0, false) ? true : null
            http           = try(length([for e in try(intf.http, []) : e if e.address == "any"]) > 0, false) ? true : null
            xml            = try(length([for e in try(intf.xml, []) : e if e.address == "any"]) > 0, false) ? true : null
            netconf        = try(length([for e in try(intf.netconf, []) : e if e.address == "any"]) > 0, false) ? true : null
            allow_all      = try(length([for e in try(intf.all, []) : e if e.address == "any"]) > 0, false) ? true : null
            ssh_ipv4_prefixes = try(length([for e in try(intf.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            ssh_ipv6_prefixes = try(length([for e in try(intf.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            telnet_ipv4_prefixes = try(length([for e in try(intf.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            telnet_ipv6_prefixes = try(length([for e in try(intf.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            snmp_ipv4_prefixes = try(length([for e in try(intf.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            snmp_ipv6_prefixes = try(length([for e in try(intf.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            tftp_ipv4_prefixes = try(length([for e in try(intf.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            tftp_ipv6_prefixes = try(length([for e in try(intf.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            http_ipv4_prefixes = try(length([for e in try(intf.http, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.http, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            xml_ipv4_prefixes = try(length([for e in try(intf.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            xml_ipv6_prefixes = try(length([for e in try(intf.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            netconf_ipv4_prefixes = try(length([for e in try(intf.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            netconf_ipv6_prefixes = try(length([for e in try(intf.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            allow_all_ipv4_prefixes = try(length([for e in try(intf.all, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            allow_all_ipv6_prefixes = try(length([for e in try(intf.all, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
          }
        ]
        mgmt_inband_all_ssh       = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.ssh, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_telnet    = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.telnet, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_snmp      = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.snmp, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_tftp      = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.tftp, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_http      = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.http, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_xml       = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.xml, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_netconf   = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.netconf, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_allow_all = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.all, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_inband_all_ssh_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_ssh_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_inband_all_telnet_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_telnet_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_inband_all_snmp_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_snmp_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_inband_all_tftp_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_tftp_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_inband_all_http_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.http, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.http, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_xml_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_xml_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_inband_all_netconf_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_netconf_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_inband_all_allow_all_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.all, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_inband_all_allow_all_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.all, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.inband.interfaces_all.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_interfaces = try(length(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces) == 0, true) ? null : [
          for intf in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces, []) : {
            interface_name = try(intf.name, local.defaults.iosxr.devices.configuration.control_plane.management_plane.out_of_band.interfaces.name, null)
            ssh            = try(length([for e in try(intf.ssh, []) : e if e.address == "any"]) > 0, false) ? true : null
            telnet         = try(length([for e in try(intf.telnet, []) : e if e.address == "any"]) > 0, false) ? true : null
            snmp           = try(length([for e in try(intf.snmp, []) : e if e.address == "any"]) > 0, false) ? true : null
            tftp           = try(length([for e in try(intf.tftp, []) : e if e.address == "any"]) > 0, false) ? true : null
            http           = try(length([for e in try(intf.http, []) : e if e.address == "any"]) > 0, false) ? true : null
            xml            = try(length([for e in try(intf.xml, []) : e if e.address == "any"]) > 0, false) ? true : null
            netconf        = try(length([for e in try(intf.netconf, []) : e if e.address == "any"]) > 0, false) ? true : null
            allow_all      = try(length([for e in try(intf.all, []) : e if e.address == "any"]) > 0, false) ? true : null
            ssh_ipv4_prefixes = try(length([for e in try(intf.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            ssh_ipv6_prefixes = try(length([for e in try(intf.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            telnet_ipv4_prefixes = try(length([for e in try(intf.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            telnet_ipv6_prefixes = try(length([for e in try(intf.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            snmp_ipv4_prefixes = try(length([for e in try(intf.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            snmp_ipv6_prefixes = try(length([for e in try(intf.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            tftp_ipv4_prefixes = try(length([for e in try(intf.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            tftp_ipv6_prefixes = try(length([for e in try(intf.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            http_ipv4_prefixes = try(length([for e in try(intf.http, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.http, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            xml_ipv4_prefixes = try(length([for e in try(intf.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            xml_ipv6_prefixes = try(length([for e in try(intf.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            netconf_ipv4_prefixes = try(length([for e in try(intf.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            netconf_ipv6_prefixes = try(length([for e in try(intf.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
            allow_all_ipv4_prefixes = try(length([for e in try(intf.all, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
              for e in try(intf.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
            ]
            allow_all_ipv6_prefixes = try(length([for e in try(intf.all, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
              for e in try(intf.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
            ]
          }
        ]
        mgmt_oob_all_ssh       = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.ssh, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_telnet    = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.telnet, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_snmp      = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.snmp, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_tftp      = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.tftp, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_http      = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.http, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_xml       = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.xml, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_netconf   = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.netconf, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_allow_all = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.all, []) : e if e.address == "any"]) > 0, false) ? true : null
        mgmt_oob_all_ssh_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_ssh_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.ssh, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.ssh, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_all_telnet_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_telnet_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.telnet, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.telnet, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_all_snmp_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_snmp_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.snmp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.snmp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_all_tftp_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_tftp_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.tftp, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.tftp, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_all_http_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.http, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.http, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_xml_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_xml_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.xml, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.xml, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_all_netconf_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_netconf_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.netconf, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.netconf, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
        mgmt_oob_all_allow_all_ipv4_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.all, []) : e if e.address != "any" && can(regex(":", e.address)) == false]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == false
        ]
        mgmt_oob_all_allow_all_ipv6_prefixes = try(length([for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.all, []) : e if e.address != "any" && can(regex(":", e.address)) == true]) == 0, true) ? null : [
          for e in try(local.device_config[device.name].control_plane.management_plane.out_of_band.interfaces_all.all, []) : { address = e.address, length = e.length } if e.address != "any" && can(regex(":", e.address)) == true
        ]
      }
    ] if try(local.device_config[device.name].control_plane, null) != null || try(local.defaults.iosxr.devices.configuration.control_plane, null) != null
  ])
}

resource "iosxr_control_plane" "control_plane" {
  for_each                                = { for cp in local.control_plane : cp.key => cp }
  device                                  = each.value.device_name
  mgmt_oob_vrf                            = each.value.mgmt_oob_vrf
  mgmt_oob_inband_behavior                = each.value.mgmt_oob_inband_behavior
  mgmt_inband_interfaces                  = each.value.mgmt_inband_interfaces
  mgmt_oob_interfaces                     = each.value.mgmt_oob_interfaces
  mgmt_inband_all_ssh                     = each.value.mgmt_inband_all_ssh
  mgmt_inband_all_telnet                  = each.value.mgmt_inband_all_telnet
  mgmt_inband_all_snmp                    = each.value.mgmt_inband_all_snmp
  mgmt_inband_all_tftp                    = each.value.mgmt_inband_all_tftp
  mgmt_inband_all_http                    = each.value.mgmt_inband_all_http
  mgmt_inband_all_xml                     = each.value.mgmt_inband_all_xml
  mgmt_inband_all_netconf                 = each.value.mgmt_inband_all_netconf
  mgmt_inband_all_allow_all               = each.value.mgmt_inband_all_allow_all
  mgmt_inband_all_ssh_ipv4_prefixes       = each.value.mgmt_inband_all_ssh_ipv4_prefixes
  mgmt_inband_all_ssh_ipv6_prefixes       = each.value.mgmt_inband_all_ssh_ipv6_prefixes
  mgmt_inband_all_telnet_ipv4_prefixes    = each.value.mgmt_inband_all_telnet_ipv4_prefixes
  mgmt_inband_all_telnet_ipv6_prefixes    = each.value.mgmt_inband_all_telnet_ipv6_prefixes
  mgmt_inband_all_snmp_ipv4_prefixes      = each.value.mgmt_inband_all_snmp_ipv4_prefixes
  mgmt_inband_all_snmp_ipv6_prefixes      = each.value.mgmt_inband_all_snmp_ipv6_prefixes
  mgmt_inband_all_tftp_ipv4_prefixes      = each.value.mgmt_inband_all_tftp_ipv4_prefixes
  mgmt_inband_all_tftp_ipv6_prefixes      = each.value.mgmt_inband_all_tftp_ipv6_prefixes
  mgmt_inband_all_http_ipv4_prefixes      = each.value.mgmt_inband_all_http_ipv4_prefixes
  mgmt_inband_all_xml_ipv4_prefixes       = each.value.mgmt_inband_all_xml_ipv4_prefixes
  mgmt_inband_all_xml_ipv6_prefixes       = each.value.mgmt_inband_all_xml_ipv6_prefixes
  mgmt_inband_all_netconf_ipv4_prefixes   = each.value.mgmt_inband_all_netconf_ipv4_prefixes
  mgmt_inband_all_netconf_ipv6_prefixes   = each.value.mgmt_inband_all_netconf_ipv6_prefixes
  mgmt_inband_all_allow_all_ipv4_prefixes = each.value.mgmt_inband_all_allow_all_ipv4_prefixes
  mgmt_inband_all_allow_all_ipv6_prefixes = each.value.mgmt_inband_all_allow_all_ipv6_prefixes
  mgmt_oob_all_ssh                        = each.value.mgmt_oob_all_ssh
  mgmt_oob_all_telnet                     = each.value.mgmt_oob_all_telnet
  mgmt_oob_all_snmp                       = each.value.mgmt_oob_all_snmp
  mgmt_oob_all_tftp                       = each.value.mgmt_oob_all_tftp
  mgmt_oob_all_http                       = each.value.mgmt_oob_all_http
  mgmt_oob_all_xml                        = each.value.mgmt_oob_all_xml
  mgmt_oob_all_netconf                    = each.value.mgmt_oob_all_netconf
  mgmt_oob_all_allow_all                  = each.value.mgmt_oob_all_allow_all
  mgmt_oob_all_ssh_ipv4_prefixes          = each.value.mgmt_oob_all_ssh_ipv4_prefixes
  mgmt_oob_all_ssh_ipv6_prefixes          = each.value.mgmt_oob_all_ssh_ipv6_prefixes
  mgmt_oob_all_telnet_ipv4_prefixes       = each.value.mgmt_oob_all_telnet_ipv4_prefixes
  mgmt_oob_all_telnet_ipv6_prefixes       = each.value.mgmt_oob_all_telnet_ipv6_prefixes
  mgmt_oob_all_snmp_ipv4_prefixes         = each.value.mgmt_oob_all_snmp_ipv4_prefixes
  mgmt_oob_all_snmp_ipv6_prefixes         = each.value.mgmt_oob_all_snmp_ipv6_prefixes
  mgmt_oob_all_tftp_ipv4_prefixes         = each.value.mgmt_oob_all_tftp_ipv4_prefixes
  mgmt_oob_all_tftp_ipv6_prefixes         = each.value.mgmt_oob_all_tftp_ipv6_prefixes
  mgmt_oob_all_http_ipv4_prefixes         = each.value.mgmt_oob_all_http_ipv4_prefixes
  mgmt_oob_all_xml_ipv4_prefixes          = each.value.mgmt_oob_all_xml_ipv4_prefixes
  mgmt_oob_all_xml_ipv6_prefixes          = each.value.mgmt_oob_all_xml_ipv6_prefixes
  mgmt_oob_all_netconf_ipv4_prefixes      = each.value.mgmt_oob_all_netconf_ipv4_prefixes
  mgmt_oob_all_netconf_ipv6_prefixes      = each.value.mgmt_oob_all_netconf_ipv6_prefixes
  mgmt_oob_all_allow_all_ipv4_prefixes    = each.value.mgmt_oob_all_allow_all_ipv4_prefixes
  mgmt_oob_all_allow_all_ipv6_prefixes    = each.value.mgmt_oob_all_allow_all_ipv6_prefixes

  lifecycle {
    replace_triggered_by = [terraform_data.control_plane_replace[each.key]]
  }
}

##### When inband_behavior is configured, any change requires a full replace. Cannot modify in-place on IOS-XR. #####

resource "terraform_data" "control_plane_replace" {
  for_each = { for cp in local.control_plane : cp.key => cp }
  input    = each.value.mgmt_oob_inband_behavior != null ? sha256(jsonencode(each.value)) : null
}
