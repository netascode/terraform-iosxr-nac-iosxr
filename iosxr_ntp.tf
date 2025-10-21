locals {
  device_ntp_configs = flatten([
    for device in local.devices : [
      {
        key                          = device.name
        device_name                  = device.name
        ipv4_dscp                    = try(local.device_config[device.name].ntp.ipv4_dscp, local.defaults.iosxr.configuration.ntp.ipv4_dscp, null)
        ipv4_precedence              = try(local.device_config[device.name].ntp.ipv4_precedence, local.defaults.iosxr.configuration.ntp.ipv4_precedence, null)
        ipv6_dscp                    = try(local.device_config[device.name].ntp.ipv6_dscp, local.defaults.iosxr.configuration.ntp.ipv6_dscp, null)
        ipv6_precedence              = try(local.device_config[device.name].ntp.ipv6_precedence, local.defaults.iosxr.configuration.ntp.ipv6_precedence, null)
        access_group_ipv6_peer       = try(local.device_config[device.name].ntp.access_group_ipv6_peer, local.defaults.iosxr.configuration.ntp.access_group_ipv6_peer, null)
        access_group_ipv6_query_only = try(local.device_config[device.name].ntp.access_group_ipv6_query_only, local.defaults.iosxr.configuration.ntp.access_group_ipv6_query_only, null)
        access_group_ipv6_serve      = try(local.device_config[device.name].ntp.access_group_ipv6_serve, local.defaults.iosxr.configuration.ntp.access_group_ipv6_serve, null)
        access_group_ipv6_serve_only = try(local.device_config[device.name].ntp.access_group_ipv6_serve_only, local.defaults.iosxr.configuration.ntp.access_group_ipv6_serve_only, null)
        access_group_ipv4_peer       = try(local.device_config[device.name].ntp.access_group_ipv4_peer, local.defaults.iosxr.configuration.ntp.access_group_ipv4_peer, null)
        access_group_ipv4_query_only = try(local.device_config[device.name].ntp.access_group_ipv4_query_only, local.defaults.iosxr.configuration.ntp.access_group_ipv4_query_only, null)
        access_group_ipv4_serve      = try(local.device_config[device.name].ntp.access_group_ipv4_serve, local.defaults.iosxr.configuration.ntp.access_group_ipv4_serve, null)
        access_group_ipv4_serve_only = try(local.device_config[device.name].ntp.access_group_ipv4_serve_only, local.defaults.iosxr.configuration.ntp.access_group_ipv4_serve_only, null)
        authenticate                 = try(local.device_config[device.name].ntp.authenticate, local.defaults.iosxr.configuration.ntp.authenticate, null)
        broadcastdelay               = try(local.device_config[device.name].ntp.broadcastdelay, local.defaults.iosxr.configuration.ntp.broadcastdelay, null)
        max_associations             = try(local.device_config[device.name].ntp.max_associations, local.defaults.iosxr.configuration.ntp.max_associations, null)
        update_calendar              = try(local.device_config[device.name].ntp.update_calendar, local.defaults.iosxr.configuration.ntp.update_calendar, null)
        log_internal_sync            = try(local.device_config[device.name].ntp.log_internal_sync, local.defaults.iosxr.configuration.ntp.log_internal_sync, null)
        source_interface_name        = try(local.device_config[device.name].ntp.source_interface_name, local.defaults.iosxr.configuration.ntp.source_interface_name, null)
        passive                      = try(local.device_config[device.name].ntp.passive, local.defaults.iosxr.configuration.ntp.passive, null)
        primary_stratum_number       = try(local.device_config[device.name].ntp.primary_stratum_number, local.defaults.iosxr.configuration.ntp.primary_stratum_number, null)
        primary_reference_clock      = try(local.device_config[device.name].ntp.primary_reference_clock, local.defaults.iosxr.configuration.ntp.primary_reference_clock, null)
        admin_plane_version          = try(local.device_config[device.name].ntp.admin_plane_version, local.defaults.iosxr.configuration.ntp.admin_plane_version, null)
        admin_plane_key              = try(local.device_config[device.name].ntp.admin_plane_key, local.defaults.iosxr.configuration.ntp.admin_plane_key, null)
        admin_plane_minpoll          = try(local.device_config[device.name].ntp.admin_plane_minpoll, local.defaults.iosxr.configuration.ntp.admin_plane_minpoll, null)
        admin_plane_maxpoll          = try(local.device_config[device.name].ntp.admin_plane_maxpoll, local.defaults.iosxr.configuration.ntp.admin_plane_maxpoll, null)
        admin_plane_prefer           = try(local.device_config[device.name].ntp.admin_plane_prefer, local.defaults.iosxr.configuration.ntp.admin_plane_prefer, null)
        admin_plane_burst            = try(local.device_config[device.name].ntp.admin_plane_burst, local.defaults.iosxr.configuration.ntp.admin_plane_burst, null)
        admin_plane_iburst           = try(local.device_config[device.name].ntp.admin_plane_iburst, local.defaults.iosxr.configuration.ntp.admin_plane_iburst, null)
        access_group_vrfs = try(length(local.device_config[device.name].ntp.access_group_vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.access_group_vrfs : {
            vrf_name        = try(vrf.vrf_name, local.defaults.iosxr.configuration.ntp.access_group_vrfs.vrf_name, null)
            ipv6_peer       = try(vrf.ipv6_peer, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv6_peer, null)
            ipv6_query_only = try(vrf.ipv6_query_only, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv6_query_only, null)
            ipv6_serve      = try(vrf.ipv6_serve, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv6_serve, null)
            ipv6_serve_only = try(vrf.ipv6_serve_only, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv6_serve_only, null)
            ipv4_peer       = try(vrf.ipv4_peer, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv4_peer, null)
            ipv4_query_only = try(vrf.ipv4_query_only, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv4_query_only, null)
            ipv4_serve      = try(vrf.ipv4_serve, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv4_serve, null)
            ipv4_serve_only = try(vrf.ipv4_serve_only, local.defaults.iosxr.configuration.ntp.access_group_vrfs.ipv4_serve_only, null)
          }
        ]
        authentication_keys = try(length(local.device_config[device.name].ntp.authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.authentication_keys : {
            key_number    = try(key.key_number, local.defaults.iosxr.configuration.ntp.authentication_keys.key_number, null)
            md5_encrypted = try(key.md5_encrypted, local.defaults.iosxr.configuration.ntp.authentication_keys.md5_encrypted, null)
          }
        ]
        trusted_keys = try(length(local.device_config[device.name].ntp.trusted_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.trusted_keys : {
            key_number = try(key.key_number, local.defaults.iosxr.configuration.ntp.trusted_keys.key_number, null)
          }
        ]
        source_vrfs = try(length(local.device_config[device.name].ntp.source_vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.source_vrfs : {
            vrf_name       = try(vrf.vrf_name, local.defaults.iosxr.configuration.ntp.source_vrfs.vrf_name, null)
            interface_name = try(vrf.interface_name, local.defaults.iosxr.configuration.ntp.source_vrfs.interface_name, null)
          }
        ]
        cmac_authentication_keys = try(length(local.device_config[device.name].ntp.cmac_authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.cmac_authentication_keys : {
            key_number     = try(key.key_number, local.defaults.iosxr.configuration.ntp.cmac_authentication_keys.key_number, null)
            cmac_encrypted = try(key.cmac_encrypted, local.defaults.iosxr.configuration.ntp.cmac_authentication_keys.cmac_encrypted, null)
          }
        ]
        hmac_sha1_authentication_keys = try(length(local.device_config[device.name].ntp.hmac_sha1_authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.hmac_sha1_authentication_keys : {
            key_number          = try(key.key_number, local.defaults.iosxr.configuration.ntp.hmac_sha1_authentication_keys.key_number, null)
            hmac_sha1_encrypted = try(key.hmac_sha1_encrypted, local.defaults.iosxr.configuration.ntp.hmac_sha1_authentication_keys.hmac_sha1_encrypted, null)
          }
        ]
        hmac_sha2_authentication_keys = try(length(local.device_config[device.name].ntp.hmac_sha2_authentication_keys) == 0, true) ? null : [
          for key in local.device_config[device.name].ntp.hmac_sha2_authentication_keys : {
            key_number          = try(key.key_number, local.defaults.iosxr.configuration.ntp.hmac_sha2_authentication_keys.key_number, null)
            hmac_sha2_encrypted = try(key.hmac_sha2_encrypted, local.defaults.iosxr.configuration.ntp.hmac_sha2_authentication_keys.hmac_sha2_encrypted, null)
          }
        ]
        interfaces = try(length(local.device_config[device.name].ntp.interfaces) == 0, true) ? null : [
          for interface in local.device_config[device.name].ntp.interfaces : {
            interface_name        = try(interface.interface_name, local.defaults.iosxr.configuration.ntp.interfaces.interface_name, null)
            broadcast_destination = try(interface.broadcast_destination, local.defaults.iosxr.configuration.ntp.interfaces.broadcast_destination, null)
            broadcast_key         = try(interface.broadcast_key, local.defaults.iosxr.configuration.ntp.interfaces.broadcast_key, null)
            broadcast_version     = try(interface.broadcast_version, local.defaults.iosxr.configuration.ntp.interfaces.broadcast_version, null)
            disable               = try(interface.disable, local.defaults.iosxr.configuration.ntp.interfaces.disable, null)
          }
        ]
        interface_vrfs = try(length(local.device_config[device.name].ntp.interface_vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.interface_vrfs : {
            vrf_name = try(vrf.vrf_name, local.defaults.iosxr.configuration.ntp.interface_vrfs.vrf_name, null)
            interfaces = try(length(vrf.interfaces) == 0, true) ? null : [for interface in vrf.interfaces : {
              interface_name        = try(interface.interface_name, local.defaults.iosxr.configuration.ntp.interface_vrfs.interfaces.interface_name, null)
              broadcast_client      = try(interface.broadcast_client, local.defaults.iosxr.configuration.ntp.interface_vrfs.interfaces.broadcast_client, null)
              broadcast_destination = try(interface.broadcast_destination, local.defaults.iosxr.configuration.ntp.interface_vrfs.interfaces.broadcast_destination, null)
              broadcast_key         = try(interface.broadcast_key, local.defaults.iosxr.configuration.ntp.interface_vrfs.interfaces.broadcast_key, null)
              broadcast_version     = try(interface.broadcast_version, local.defaults.iosxr.configuration.ntp.interface_vrfs.interfaces.broadcast_version, null)
              disable               = try(interface.disable, local.defaults.iosxr.configuration.ntp.interface_vrfs.interfaces.disable, null)
              }
            ]
          }
        ]
        ipv4_peers_servers = try(length(local.device_config[device.name].ntp.ipv4_peers_servers) == 0, true) ? null : [
          for server in local.device_config[device.name].ntp.ipv4_peers_servers : {
            address = try(server.address, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.address, null)
            type    = try(server.type, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.type, null)
            version = try(server.version, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.version, null)
            key     = try(server.key, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.key, null)
            minpoll = try(server.minpoll, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.minpoll, null)
            maxpoll = try(server.maxpoll, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.maxpoll, null)
            prefer  = try(server.prefer, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.prefer, null)
            burst   = try(server.burst, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.burst, null)
            iburst  = try(server.iburst, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.iburst, null)
            source  = try(server.source, local.defaults.iosxr.configuration.ntp.ipv4_peers_servers.source, null)
          }
        ]
        ipv6_peers_servers = try(length(local.device_config[device.name].ntp.ipv6_peers_servers) == 0, true) ? null : [
          for server in local.device_config[device.name].ntp.ipv6_peers_servers : {
            address      = try(server.address, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.address, null)
            type         = try(server.type, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.type, null)
            version      = try(server.version, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.version, null)
            key          = try(server.key, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.key, null)
            minpoll      = try(server.minpoll, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.minpoll, null)
            maxpoll      = try(server.maxpoll, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.maxpoll, null)
            prefer       = try(server.prefer, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.prefer, null)
            burst        = try(server.burst, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.burst, null)
            iburst       = try(server.iburst, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.iburst, null)
            source       = try(server.source, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.source, null)
            ipv6_address = try(server.ipv6_address, local.defaults.iosxr.configuration.ntp.ipv6_peers_servers.ipv6_address, null)
          }
        ]
        peers_servers_vrfs = try(length(local.device_config[device.name].ntp.peers_servers_vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ntp.peers_servers_vrfs : {
            vrf_name = try(vrf.vrf_name, null)
            ipv4_peers_servers = try(length(vrf.ipv4_peers_servers) == 0, true) ? null : [for server in vrf.ipv4_peers_servers : {
              address = try(server.address, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.address, null)
              type    = try(server.type, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.type, null)
              version = try(server.version, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.version, null)
              key     = try(server.key, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.key, null)
              minpoll = try(server.minpoll, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.minpoll, null)
              maxpoll = try(server.maxpoll, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.maxpoll, null)
              prefer  = try(server.prefer, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.prefer, null)
              burst   = try(server.burst, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.burst, null)
              iburst  = try(server.iburst, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.iburst, null)
              source  = try(server.source, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv4_peers_servers.source, null)
              }
            ]
            ipv6_peers_servers = try(length(vrf.ipv6_peers_servers) == 0, true) ? null : [for server in vrf.ipv6_peers_servers : {
              address      = try(server.address, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.address, null)
              type         = try(server.type, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.type, null)
              version      = try(server.version, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.version, null)
              key          = try(server.key, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.key, null)
              minpoll      = try(server.minpoll, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.minpoll, null)
              maxpoll      = try(server.maxpoll, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.maxpoll, null)
              prefer       = try(server.prefer, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.prefer, null)
              burst        = try(server.burst, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.burst, null)
              iburst       = try(server.iburst, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.iburst, null)
              source       = try(server.source, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.source, null)
              ipv6_address = try(server.ipv6_address, local.defaults.iosxr.configuration.ntp.peers_servers_vrfs.ipv6_peers_servers.ipv6_address, null)
              }
            ]
          }
        ]
      }
    ] if try(local.device_config[device.name].ntp, null) != null || try(local.defaults.iosxr.configuration.ntp, null) != null
  ])
}

resource "iosxr_ntp" "ntp" {
  for_each                      = { for ntp_config in local.device_ntp_configs : ntp_config.key => ntp_config }
  device                        = each.value.device_name
  ipv4_dscp                     = each.value.ipv4_dscp
  ipv4_precedence               = each.value.ipv4_precedence
  ipv6_dscp                     = each.value.ipv6_dscp
  ipv6_precedence               = each.value.ipv6_precedence
  access_group_ipv6_peer        = each.value.access_group_ipv6_peer
  access_group_ipv6_query_only  = each.value.access_group_ipv6_query_only
  access_group_ipv6_serve       = each.value.access_group_ipv6_serve
  access_group_ipv6_serve_only  = each.value.access_group_ipv6_serve_only
  access_group_ipv4_peer        = each.value.access_group_ipv4_peer
  access_group_ipv4_query_only  = each.value.access_group_ipv4_query_only
  access_group_ipv4_serve       = each.value.access_group_ipv4_serve
  access_group_ipv4_serve_only  = each.value.access_group_ipv4_serve_only
  authenticate                  = each.value.authenticate
  broadcastdelay                = each.value.broadcastdelay
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
  peers_servers_vrfs            = each.value.peers_servers_vrfs
}
