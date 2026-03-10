locals {
  ntp = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        ipv4_dscp = try(lookup(local.dscp_map,
          tostring(try(local.device_config[device.name].ntp.ipv4_dscp, local.defaults.iosxr.devices.configuration.ntp.ipv4_dscp)),
          tostring(try(local.device_config[device.name].ntp.ipv4_dscp, local.defaults.iosxr.devices.configuration.ntp.ipv4_dscp))
          ), null
        )
        ipv4_precedence = try(
          lookup(local.precedence_map,
            tostring(try(local.device_config[device.name].ntp.ipv4_precedence, local.defaults.iosxr.devices.configuration.ntp.ipv4_precedence)),
            tostring(try(local.device_config[device.name].ntp.ipv4_precedence, local.defaults.iosxr.devices.configuration.ntp.ipv4_precedence))
          ), null
        )
        ipv6_dscp = try(
          lookup(local.dscp_map,
            tostring(try(local.device_config[device.name].ntp.ipv6_dscp, local.defaults.iosxr.devices.configuration.ntp.ipv6_dscp)),
            tostring(try(local.device_config[device.name].ntp.ipv6_dscp, local.defaults.iosxr.devices.configuration.ntp.ipv6_dscp))
          ), null
        )
        ipv6_precedence = try(
          lookup(local.precedence_map,
            tostring(try(local.device_config[device.name].ntp.ipv6_precedence, local.defaults.iosxr.devices.configuration.ntp.ipv6_precedence)),
            tostring(try(local.device_config[device.name].ntp.ipv6_precedence, local.defaults.iosxr.devices.configuration.ntp.ipv6_precedence))
          ), null
        )
        access_group_ipv4_peer       = try(local.device_config[device.name].ntp.access_groups.ipv4_peer, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv4_peer, null)
        access_group_ipv4_query_only = try(local.device_config[device.name].ntp.access_groups.ipv4_query_only, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv4_query_only, null)
        access_group_ipv4_serve      = try(local.device_config[device.name].ntp.access_groups.ipv4_serve, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv4_serve, null)
        access_group_ipv4_serve_only = try(local.device_config[device.name].ntp.access_groups.ipv4_serve_only, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv4_serve_only, null)
        access_group_ipv6_peer       = try(local.device_config[device.name].ntp.access_groups.ipv6_peer, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv6_peer, null)
        access_group_ipv6_query_only = try(local.device_config[device.name].ntp.access_groups.ipv6_query_only, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv6_query_only, null)
        access_group_ipv6_serve      = try(local.device_config[device.name].ntp.access_groups.ipv6_serve, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv6_serve, null)
        access_group_ipv6_serve_only = try(local.device_config[device.name].ntp.access_groups.ipv6_serve_only, local.defaults.iosxr.devices.configuration.ntp.access_groups.ipv6_serve_only, null)
        authenticate                 = try(local.device_config[device.name].ntp.authenticate, local.defaults.iosxr.devices.configuration.ntp.authenticate, null)
        broadcastdelay               = try(local.device_config[device.name].ntp.broadcastdelay, local.defaults.iosxr.devices.configuration.ntp.broadcastdelay, null)
        drift_aging_time             = try(local.device_config[device.name].ntp.drift_aging_time, local.defaults.iosxr.devices.configuration.ntp.drift_aging_time, null)
        drift_file_bootflash         = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "bootflash" ? true : null
        drift_file_compactflash      = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "compactflash" ? true : null
        drift_file_disk0             = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "disk0" ? true : null
        drift_file_disk1             = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "disk1" ? true : null
        drift_file_disk2             = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "disk2" ? true : null
        drift_file_harddisk          = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "harddisk" ? true : null
        drift_file_usb               = try(local.device_config[device.name].ntp.drift_file, local.defaults.iosxr.devices.configuration.ntp.drift_file, null) == "usb" ? true : null
        drift_filename               = try(local.device_config[device.name].ntp.drift_filename, local.defaults.iosxr.devices.configuration.ntp.drift_filename, null)
        max_associations             = try(local.device_config[device.name].ntp.max_associations, local.defaults.iosxr.devices.configuration.ntp.max_associations, null)
        update_calendar              = try(local.device_config[device.name].ntp.update_calendar, local.defaults.iosxr.devices.configuration.ntp.update_calendar, null)
        log_internal_sync            = try(local.device_config[device.name].ntp.log_internal_sync, local.defaults.iosxr.devices.configuration.ntp.log_internal_sync, null)
        source_interface_name        = try(local.device_config[device.name].ntp.source_interface, local.defaults.iosxr.devices.configuration.ntp.source_interface, null)
        passive                      = try(local.device_config[device.name].ntp.passive, local.defaults.iosxr.devices.configuration.ntp.passive, null)
        primary_stratum_number       = try(tonumber(local.device_config[device.name].ntp.master), tonumber(local.defaults.iosxr.devices.configuration.ntp.master), null)
        primary_reference_clock      = try(local.device_config[device.name].ntp.master, local.defaults.iosxr.devices.configuration.ntp.master, null) == "primary_reference_clock" ? true : null
        admin_plane_version          = try(local.device_config[device.name].ntp.admin_plane_version, local.defaults.iosxr.devices.configuration.ntp.admin_plane_version, null)
        admin_plane_key              = try(local.device_config[device.name].ntp.admin_plane_key, local.defaults.iosxr.devices.configuration.ntp.admin_plane_key, null)
        admin_plane_minpoll          = try(local.device_config[device.name].ntp.admin_plane_minpoll, local.defaults.iosxr.devices.configuration.ntp.admin_plane_minpoll, null)
        admin_plane_maxpoll          = try(local.device_config[device.name].ntp.admin_plane_maxpoll, local.defaults.iosxr.devices.configuration.ntp.admin_plane_maxpoll, null)
        admin_plane_prefer           = try(local.device_config[device.name].ntp.admin_plane_prefer, local.defaults.iosxr.devices.configuration.ntp.admin_plane_prefer, null)
        admin_plane_burst            = try(local.device_config[device.name].ntp.admin_plane_burst, local.defaults.iosxr.devices.configuration.ntp.admin_plane_burst, null)
        admin_plane_iburst           = try(local.device_config[device.name].ntp.admin_plane_iburst, local.defaults.iosxr.devices.configuration.ntp.admin_plane_iburst, null)
        trusted_keys = try(length(local.device_config[device.name].ntp.authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.authentication_keys : {
            key_number = try(key.number, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.number, null)
          } if try(key.trusted, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.trusted, null) == true
        ]
        authentication_keys = try(length(local.device_config[device.name].ntp.authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.authentication_keys : {
            key_number    = try(key.number, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.number, null)
            md5_encrypted = try(key.key, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.key, null)
          } if try(key.mode, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.mode, null) == "md5"
        ]
        cmac_authentication_keys = try(length(local.device_config[device.name].ntp.authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.authentication_keys : {
            key_number     = try(key.number, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.number, null)
            cmac_encrypted = try(key.key, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.key, null)
          } if try(key.mode, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.mode, null) == "cmac"
        ]
        hmac_sha1_authentication_keys = try(length(local.device_config[device.name].ntp.authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.authentication_keys : {
            key_number          = try(key.number, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.number, null)
            hmac_sha1_encrypted = try(key.key, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.key, null)
          } if try(key.mode, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.mode, null) == "hmac_sha1"
        ]
        hmac_sha2_authentication_keys = try(length(local.device_config[device.name].ntp.authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.authentication_keys : {
            key_number          = try(key.number, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.number, null)
            hmac_sha2_encrypted = try(key.key, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.key, null)
          } if try(key.mode, local.defaults.iosxr.devices.configuration.ntp.authentication_keys.mode, null) == "hmac_sha2"
        ]
        source_vrfs = try(length(local.device_config[device.name].ntp.vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.vrfs : {
            vrf_name       = try(vrf.vrf, local.defaults.iosxr.devices.configuration.ntp.vrfs.vrf, null)
            interface_name = try(vrf.source_interface, local.defaults.iosxr.devices.configuration.ntp.vrfs.source_interface, null)
          } if try(vrf.source_interface, local.defaults.iosxr.devices.configuration.ntp.vrfs.source_interface, null) != null
        ]
        interfaces = try(length(local.device_config[device.name].ntp.interfaces) == 0, true) ? null : [
          for interface in local.device_config[device.name].ntp.interfaces : {
            interface_name        = try(interface.name, local.defaults.iosxr.devices.configuration.ntp.interfaces.name, null)
            broadcast_client      = try(interface.broadcast_client, local.defaults.iosxr.devices.configuration.ntp.interfaces.broadcast_client, null)
            broadcast_destination = try(interface.broadcast_destination, local.defaults.iosxr.devices.configuration.ntp.interfaces.broadcast_destination, null)
            broadcast_key         = try(interface.broadcast_key, local.defaults.iosxr.devices.configuration.ntp.interfaces.broadcast_key, null)
            broadcast_version     = try(interface.broadcast_version, local.defaults.iosxr.devices.configuration.ntp.interfaces.broadcast_version, null)
            disable               = try(interface.disable, local.defaults.iosxr.devices.configuration.ntp.interfaces.disable, null)
          }
        ]
        ipv4_peers_servers = try(length(concat(try(local.device_config[device.name].ntp.peers, []), try(local.device_config[device.name].ntp.servers, []))) == 0, true) ? null : concat(
          [for entry in try(local.device_config[device.name].ntp.peers, []) : {
            address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, null)
            type    = "peer"
            version = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.peers.version, null)
            key     = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.peers.key, null)
            minpoll = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.peers.minpoll, null)
            maxpoll = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.peers.maxpoll, null)
            prefer  = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.peers.prefer, null)
            burst   = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.peers.burst, null)
            iburst  = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.peers.iburst, null)
            source  = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.peers.source, null)
          } if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, "")))],
          [for entry in try(local.device_config[device.name].ntp.servers, []) : {
            address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, null)
            type    = "server"
            version = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.servers.version, null)
            key     = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.servers.key, null)
            minpoll = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.servers.minpoll, null)
            maxpoll = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.servers.maxpoll, null)
            prefer  = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.servers.prefer, null)
            burst   = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.servers.burst, null)
            iburst  = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.servers.iburst, null)
            source  = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.servers.source, null)
          } if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, "")))]
        )
        ipv6_peers_servers = try(length(concat(try(local.device_config[device.name].ntp.peers, []), try(local.device_config[device.name].ntp.servers, []))) == 0, true) ? null : concat(
          [for entry in try(local.device_config[device.name].ntp.peers, []) : {
            address      = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, null)
            type         = "peer"
            ipv6_address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, null)
            version      = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.peers.version, null)
            key          = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.peers.key, null)
            minpoll      = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.peers.minpoll, null)
            maxpoll      = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.peers.maxpoll, null)
            prefer       = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.peers.prefer, null)
            burst        = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.peers.burst, null)
            iburst       = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.peers.iburst, null)
            source       = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.peers.source, null)
          } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, ""))) == true],
          [for entry in try(local.device_config[device.name].ntp.servers, []) : {
            address      = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, null)
            type         = "server"
            ipv6_address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, null)
            version      = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.servers.version, null)
            key          = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.servers.key, null)
            minpoll      = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.servers.minpoll, null)
            maxpoll      = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.servers.maxpoll, null)
            prefer       = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.servers.prefer, null)
            burst        = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.servers.burst, null)
            iburst       = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.servers.iburst, null)
            source       = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.servers.source, null)
          } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, ""))) == true]
        )
        hostname_peers_servers = try(length(concat(try(local.device_config[device.name].ntp.peers, []), try(local.device_config[device.name].ntp.servers, []))) == 0, true) ? null : concat(
          [for entry in try(local.device_config[device.name].ntp.peers, []) : {
            fqdn_hostname = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, null)
            type          = "peer"
            version       = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.peers.version, null)
            key           = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.peers.key, null)
            minpoll       = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.peers.minpoll, null)
            maxpoll       = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.peers.maxpoll, null)
            prefer        = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.peers.prefer, null)
            burst         = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.peers.burst, null)
            iburst        = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.peers.iburst, null)
            source        = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.peers.source, null)
          } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, ""))) == false && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.peers.address, ""))) == false],
          [for entry in try(local.device_config[device.name].ntp.servers, []) : {
            fqdn_hostname = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, null)
            type          = "server"
            version       = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.servers.version, null)
            key           = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.servers.key, null)
            minpoll       = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.servers.minpoll, null)
            maxpoll       = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.servers.maxpoll, null)
            prefer        = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.servers.prefer, null)
            burst         = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.servers.burst, null)
            iburst        = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.servers.iburst, null)
            source        = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.servers.source, null)
          } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, ""))) == false && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.servers.address, ""))) == false]
        )
        access_group_vrfs = try(length(local.device_config[device.name].ntp.vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.vrfs : {
            vrf_name        = try(vrf.vrf, local.defaults.iosxr.devices.configuration.ntp.vrfs.vrf, null)
            ipv4_peer       = try(vrf.access_groups.ipv4_peer, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv4_peer, null)
            ipv4_query_only = try(vrf.access_groups.ipv4_query_only, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv4_query_only, null)
            ipv4_serve      = try(vrf.access_groups.ipv4_serve, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv4_serve, null)
            ipv4_serve_only = try(vrf.access_groups.ipv4_serve_only, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv4_serve_only, null)
            ipv6_peer       = try(vrf.access_groups.ipv6_peer, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv6_peer, null)
            ipv6_query_only = try(vrf.access_groups.ipv6_query_only, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv6_query_only, null)
            ipv6_serve      = try(vrf.access_groups.ipv6_serve, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv6_serve, null)
            ipv6_serve_only = try(vrf.access_groups.ipv6_serve_only, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups.ipv6_serve_only, null)
          } if try(vrf.access_groups, local.defaults.iosxr.devices.configuration.ntp.vrfs.access_groups, null) != null
        ]
        interface_vrfs = try(length(local.device_config[device.name].ntp.vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.vrfs : {
            vrf_name = try(vrf.vrf, local.defaults.iosxr.devices.configuration.ntp.vrfs.vrf, null)
            interfaces = try(length(vrf.interfaces) == 0, true) ? null : [for interface in vrf.interfaces : {
              interface_name        = try(interface.name, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces.name, null)
              broadcast_client      = try(interface.broadcast_client, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces.broadcast_client, null)
              broadcast_destination = try(interface.broadcast_destination, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces.broadcast_destination, null)
              broadcast_key         = try(interface.broadcast_key, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces.broadcast_key, null)
              broadcast_version     = try(interface.broadcast_version, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces.broadcast_version, null)
              disable               = try(interface.disable, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces.disable, null)
              }
            ]
          } if try(vrf.interfaces, local.defaults.iosxr.devices.configuration.ntp.vrfs.interfaces, null) != null
        ]
        peers_servers_vrfs = try(length(local.device_config[device.name].ntp.vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.vrfs : {
            vrf_name = try(vrf.vrf, local.defaults.iosxr.devices.configuration.ntp.vrfs.vrf, null)
            ipv4_peers_servers = try(length(concat(try(vrf.peers, []), try(vrf.servers, []))) == 0, true) ? null : concat(
              [for entry in try(vrf.peers, []) : {
                address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, null)
                type    = "peer"
                version = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.version, null)
                key     = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.key, null)
                minpoll = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.minpoll, null)
                maxpoll = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.maxpoll, null)
                prefer  = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.prefer, null)
                burst   = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.burst, null)
                iburst  = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.iburst, null)
                source  = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.source, null)
              } if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, "")))],
              [for entry in try(vrf.servers, []) : {
                address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, null)
                type    = "server"
                version = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.version, null)
                key     = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.key, null)
                minpoll = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.minpoll, null)
                maxpoll = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.maxpoll, null)
                prefer  = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.prefer, null)
                burst   = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.burst, null)
                iburst  = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.iburst, null)
                source  = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.source, null)
              } if can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, "")))]
            )
            ipv6_peers_servers = try(length(concat(try(vrf.peers, []), try(vrf.servers, []))) == 0, true) ? null : concat(
              [for entry in try(vrf.peers, []) : {
                address      = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, null)
                type         = "peer"
                ipv6_address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, null)
                version      = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.version, null)
                key          = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.key, null)
                minpoll      = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.minpoll, null)
                maxpoll      = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.maxpoll, null)
                prefer       = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.prefer, null)
                burst        = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.burst, null)
                iburst       = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.iburst, null)
                source       = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.source, null)
              } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, ""))) == true],
              [for entry in try(vrf.servers, []) : {
                address      = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, null)
                type         = "server"
                ipv6_address = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, null)
                version      = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.version, null)
                key          = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.key, null)
                minpoll      = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.minpoll, null)
                maxpoll      = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.maxpoll, null)
                prefer       = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.prefer, null)
                burst        = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.burst, null)
                iburst       = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.iburst, null)
                source       = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.source, null)
              } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, ""))) == true]
            )
            hostname_peers_servers = try(length(concat(try(vrf.peers, []), try(vrf.servers, []))) == 0, true) ? null : concat(
              [for entry in try(vrf.peers, []) : {
                fqdn_hostname = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, null)
                type          = "peer"
                version       = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.version, null)
                key           = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.key, null)
                minpoll       = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.minpoll, null)
                maxpoll       = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.maxpoll, null)
                prefer        = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.prefer, null)
                burst         = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.burst, null)
                iburst        = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.iburst, null)
                source        = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.source, null)
              } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, ""))) == false && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers.address, ""))) == false],
              [for entry in try(vrf.servers, []) : {
                fqdn_hostname = try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, null)
                type          = "server"
                version       = try(entry.version, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.version, null)
                key           = try(entry.key, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.key, null)
                minpoll       = try(entry.minpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.minpoll, null)
                maxpoll       = try(entry.maxpoll, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.maxpoll, null)
                prefer        = try(entry.prefer, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.prefer, null)
                burst         = try(entry.burst, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.burst, null)
                iburst        = try(entry.iburst, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.iburst, null)
                source        = try(entry.source, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.source, null)
              } if can(regex(":", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, ""))) == false && can(regex("^\\d+\\.\\d+\\.\\d+\\.\\d+$", try(entry.address, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers.address, ""))) == false]
            )
          } if try(vrf.peers, local.defaults.iosxr.devices.configuration.ntp.vrfs.peers, null) != null || try(vrf.servers, local.defaults.iosxr.devices.configuration.ntp.vrfs.servers, null) != null
        ]
      }
    ] if try(local.device_config[device.name].ntp, null) != null || try(local.defaults.iosxr.devices.configuration.ntp, null) != null
  ])
}

resource "iosxr_ntp" "ntp" {
  for_each                      = { for ntp in local.ntp : ntp.key => ntp }
  device                        = each.value.device_name
  ipv4_dscp                     = each.value.ipv4_dscp
  ipv4_precedence               = each.value.ipv4_precedence
  ipv6_dscp                     = each.value.ipv6_dscp
  ipv6_precedence               = each.value.ipv6_precedence
  access_group_ipv4_peer        = each.value.access_group_ipv4_peer
  access_group_ipv4_query_only  = each.value.access_group_ipv4_query_only
  access_group_ipv4_serve       = each.value.access_group_ipv4_serve
  access_group_ipv4_serve_only  = each.value.access_group_ipv4_serve_only
  access_group_ipv6_peer        = each.value.access_group_ipv6_peer
  access_group_ipv6_query_only  = each.value.access_group_ipv6_query_only
  access_group_ipv6_serve       = each.value.access_group_ipv6_serve
  access_group_ipv6_serve_only  = each.value.access_group_ipv6_serve_only
  authenticate                  = each.value.authenticate
  broadcastdelay                = each.value.broadcastdelay
  drift_aging_time              = each.value.drift_aging_time
  drift_file_bootflash          = each.value.drift_file_bootflash
  drift_file_compactflash       = each.value.drift_file_compactflash
  drift_file_disk0              = each.value.drift_file_disk0
  drift_file_disk1              = each.value.drift_file_disk1
  drift_file_disk2              = each.value.drift_file_disk2
  drift_file_harddisk           = each.value.drift_file_harddisk
  drift_file_usb                = each.value.drift_file_usb
  drift_filename                = each.value.drift_filename
  max_associations              = each.value.max_associations
  update_calendar               = each.value.update_calendar
  log_internal_sync             = each.value.log_internal_sync
  source_interface_name         = each.value.source_interface_name
  passive                       = each.value.passive
  primary_stratum_number        = each.value.primary_stratum_number
  primary_reference_clock       = each.value.primary_reference_clock
  admin_plane_version           = each.value.admin_plane_version
  admin_plane_key               = each.value.admin_plane_key
  admin_plane_minpoll           = each.value.admin_plane_minpoll
  admin_plane_maxpoll           = each.value.admin_plane_maxpoll
  admin_plane_prefer            = each.value.admin_plane_prefer
  admin_plane_burst             = each.value.admin_plane_burst
  admin_plane_iburst            = each.value.admin_plane_iburst
  access_group_vrfs             = each.value.access_group_vrfs
  authentication_keys           = each.value.authentication_keys
  trusted_keys                  = each.value.trusted_keys
  source_vrfs                   = each.value.source_vrfs
  cmac_authentication_keys      = each.value.cmac_authentication_keys
  hmac_sha1_authentication_keys = each.value.hmac_sha1_authentication_keys
  hmac_sha2_authentication_keys = each.value.hmac_sha2_authentication_keys
  interfaces                    = each.value.interfaces
  interface_vrfs                = each.value.interface_vrfs
  ipv4_peers_servers            = each.value.ipv4_peers_servers
  ipv6_peers_servers            = each.value.ipv6_peers_servers
  hostname_peers_servers        = each.value.hostname_peers_servers
  peers_servers_vrfs            = each.value.peers_servers_vrfs
}
