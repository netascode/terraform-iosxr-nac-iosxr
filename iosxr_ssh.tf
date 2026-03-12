locals {
  ssh = flatten([
    for device in local.devices : [
      {
        key         = device.name
        device_name = device.name
        timeout     = try(local.device_config[device.name].ssh.timeout, local.defaults.iosxr.devices.configuration.ssh.timeout, null)
        server_vrfs = try(length(local.device_config[device.name].ssh.server_vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ssh.server_vrfs : {
            vrf_name         = try(vrf.vrf_name, null)
            ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.ssh.server_vrfs.ipv4_access_list, null)
            ipv6_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.ssh.server_vrfs.ipv6_access_list, null)
          }
        ]
        server_v2                     = try(local.device_config[device.name].ssh.server_v2, local.defaults.iosxr.devices.configuration.ssh.server_v2, null)
        server_v1                     = try(local.device_config[device.name].ssh.server_v1, local.defaults.iosxr.devices.configuration.ssh.server_v1, null)
        server_rate_limit             = try(local.device_config[device.name].ssh.server_rate_limit, local.defaults.iosxr.devices.configuration.ssh.server_rate_limit, null)
        server_disable_hmac_sha2_512  = try(local.device_config[device.name].ssh.server_disable_hmac_sha2_512, local.defaults.iosxr.devices.configuration.ssh.server_disable_hmac_sha2_512, null)
        server_disable_hmac_sha1      = try(local.device_config[device.name].ssh.server_disable_hmac_sha1, local.defaults.iosxr.devices.configuration.ssh.server_disable_hmac_sha1, null)
        server_disable_hmac_sha2_256  = try(local.device_config[device.name].ssh.server_disable_hmac_sha2_256, local.defaults.iosxr.devices.configuration.ssh.server_disable_hmac_sha2_256, null)
        server_enable_cipher_aes_cbc  = try(local.device_config[device.name].ssh.server_enable_cipher_aes_cbc, local.defaults.iosxr.devices.configuration.ssh.server_enable_cipher_aes_cbc, null)
        server_enable_cipher_3des_cbc = try(local.device_config[device.name].ssh.server_enable_cipher_3des_cbc, local.defaults.iosxr.devices.configuration.ssh.server_enable_cipher_3des_cbc, null)
        server_session_limit          = try(local.device_config[device.name].ssh.server_session_limit, local.defaults.iosxr.devices.configuration.ssh.server_session_limit, null)
        server_logging                = try(local.device_config[device.name].ssh.server_logging, local.defaults.iosxr.devices.configuration.ssh.server_logging, null)
        server_dscp                   = try(local.device_config[device.name].ssh.server_dscp, local.defaults.iosxr.devices.configuration.ssh.server_dscp, null)
        server_netconf_port           = try(local.device_config[device.name].ssh.server_netconf_port, local.defaults.iosxr.devices.configuration.ssh.server_netconf_port, null)
        server_netconf_vrfs = try(length(local.device_config[device.name].ssh.server_netconf_vrfs) == 0, true) ? null : [
          for vrf in local.device_config[device.name].ssh.server_netconf_vrfs : {
            vrf_name         = try(vrf.vrf_name, null)
            ipv4_access_list = try(vrf.ipv4_access_list, local.defaults.iosxr.devices.configuration.ssh.server_netconf_vrfs.ipv4_access_list, null)
            ipv6_access_list = try(vrf.ipv6_access_list, local.defaults.iosxr.devices.configuration.ssh.server_netconf_vrfs.ipv6_access_list, null)
          }
        ]
        server_netconf_xml                        = try(local.device_config[device.name].ssh.server_netconf_xml, local.defaults.iosxr.devices.configuration.ssh.server_netconf_xml, null)
        server_rekey_time                         = try(local.device_config[device.name].ssh.server_rekey_time, local.defaults.iosxr.devices.configuration.ssh.server_rekey_time, null)
        server_rekey_volume                       = try(local.device_config[device.name].ssh.server_rekey_volume, local.defaults.iosxr.devices.configuration.ssh.server_rekey_volume, null)
        server_algorithms_key_exchanges           = try(local.device_config[device.name].ssh.server_algorithms_key_exchanges, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_key_exchanges, null)
        server_algorithms_host_key_ecdsa_nistp256 = try(local.device_config[device.name].ssh.server_algorithms_host_key_ecdsa_nistp256, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_ecdsa_nistp256, null)
        server_algorithms_host_key_ecdsa_nistp384 = try(local.device_config[device.name].ssh.server_algorithms_host_key_ecdsa_nistp384, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_ecdsa_nistp384, null)
        server_algorithms_host_key_ecdsa_nistp521 = try(local.device_config[device.name].ssh.server_algorithms_host_key_ecdsa_nistp521, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_ecdsa_nistp521, null)
        server_algorithms_host_key_rsa            = try(local.device_config[device.name].ssh.server_algorithms_host_key_rsa, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_rsa, null)
        server_algorithms_host_key_dsa            = try(local.device_config[device.name].ssh.server_algorithms_host_key_dsa, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_dsa, null)
        server_algorithms_host_key_x509v3_ssh_rsa = try(local.device_config[device.name].ssh.server_algorithms_host_key_x509v3_ssh_rsa, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_x509v3_ssh_rsa, null)
        server_algorithms_host_key_ed25519        = try(local.device_config[device.name].ssh.server_algorithms_host_key_ed25519, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_ed25519, null)
        server_algorithms_host_key_rsa_sha512     = try(local.device_config[device.name].ssh.server_algorithms_host_key_rsa_sha512, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_rsa_sha512, null)
        server_algorithms_host_key_rsa_sha256     = try(local.device_config[device.name].ssh.server_algorithms_host_key_rsa_sha256, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_rsa_sha256, null)
        server_algorithms_host_key_ssh_rsa        = try(local.device_config[device.name].ssh.server_algorithms_host_key_ssh_rsa, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_host_key_ssh_rsa, null)
        server_algorithms_ciphers                 = try(local.device_config[device.name].ssh.server_algorithms_ciphers, local.defaults.iosxr.devices.configuration.ssh.server_algorithms_ciphers, null)
        server_max_auth_limit                     = try(local.device_config[device.name].ssh.server_max_auth_limit, local.defaults.iosxr.devices.configuration.ssh.server_max_auth_limit, null)
        server_tcp_window_scale                   = try(local.device_config[device.name].ssh.server_tcp_window_scale, local.defaults.iosxr.devices.configuration.ssh.server_tcp_window_scale, null)
        server_port_forwarding_local              = try(local.device_config[device.name].ssh.server_port_forwarding_local, local.defaults.iosxr.devices.configuration.ssh.server_port_forwarding_local, null)
        server_port                               = try(local.device_config[device.name].ssh.server_port, local.defaults.iosxr.devices.configuration.ssh.server_port, null)
        server_usernames = try(length(local.device_config[device.name].ssh.server_usernames) == 0, true) ? null : [
          for user in local.device_config[device.name].ssh.server_usernames : {
            username  = try(user.username, null)
            keystring = try(user.keystring, local.defaults.iosxr.devices.configuration.ssh.server_usernames.keystring, null)
          }
        ]
        client_source_interface         = try(local.device_config[device.name].ssh.client_source_interface, local.defaults.iosxr.devices.configuration.ssh.client_source_interface, null)
        client_vrf                      = try(local.device_config[device.name].ssh.client_vrf, local.defaults.iosxr.devices.configuration.ssh.client_vrf, null)
        client_dscp                     = try(local.device_config[device.name].ssh.client_dscp, local.defaults.iosxr.devices.configuration.ssh.client_dscp, null)
        client_rekey_time               = try(local.device_config[device.name].ssh.client_rekey_time, local.defaults.iosxr.devices.configuration.ssh.client_rekey_time, null)
        client_rekey_volume             = try(local.device_config[device.name].ssh.client_rekey_volume, local.defaults.iosxr.devices.configuration.ssh.client_rekey_volume, null)
        client_disable_hmac_sha1        = try(local.device_config[device.name].ssh.client_disable_hmac_sha1, local.defaults.iosxr.devices.configuration.ssh.client_disable_hmac_sha1, null)
        client_disable_hmac_sha2_512    = try(local.device_config[device.name].ssh.client_disable_hmac_sha2_512, local.defaults.iosxr.devices.configuration.ssh.client_disable_hmac_sha2_512, null)
        client_disable_hmac_sha2_256    = try(local.device_config[device.name].ssh.client_disable_hmac_sha2_256, local.defaults.iosxr.devices.configuration.ssh.client_disable_hmac_sha2_256, null)
        client_enable_cipher_aes_cbc    = try(local.device_config[device.name].ssh.client_enable_cipher_aes_cbc, local.defaults.iosxr.devices.configuration.ssh.client_enable_cipher_aes_cbc, null)
        client_enable_cipher_3des_cbc   = try(local.device_config[device.name].ssh.client_enable_cipher_3des_cbc, local.defaults.iosxr.devices.configuration.ssh.client_enable_cipher_3des_cbc, null)
        client_algorithms_key_exchanges = try(local.device_config[device.name].ssh.client_algorithms_key_exchanges, local.defaults.iosxr.devices.configuration.ssh.client_algorithms_key_exchanges, null)
        client_algorithms_ciphers       = try(local.device_config[device.name].ssh.client_algorithms_ciphers, local.defaults.iosxr.devices.configuration.ssh.client_algorithms_ciphers, null)
        client_tcp_window_scale         = try(local.device_config[device.name].ssh.client_tcp_window_scale, local.defaults.iosxr.devices.configuration.ssh.client_tcp_window_scale, null)
        client_v2                       = try(local.device_config[device.name].ssh.client_v2, local.defaults.iosxr.devices.configuration.ssh.client_v2, null)
        client_v1                       = try(local.device_config[device.name].ssh.client_v1, local.defaults.iosxr.devices.configuration.ssh.client_v1, null)
        client_knownhost                = try(local.device_config[device.name].ssh.client_knownhost, local.defaults.iosxr.devices.configuration.ssh.client_knownhost, null)
      }
    ] if try(local.device_config[device.name].ssh, null) != null || try(local.defaults.iosxr.devices.configuration.ssh, null) != null
  ])
}

resource "iosxr_ssh" "ssh" {
  for_each                                  = { for ssh in local.ssh : ssh.key => ssh }
  device                                    = each.value.device_name
  timeout                                   = each.value.timeout
  server_vrfs                               = each.value.server_vrfs
  server_v2                                 = each.value.server_v2
  server_v1                                 = each.value.server_v1
  server_rate_limit                         = each.value.server_rate_limit
  server_disable_hmac_sha2_512              = each.value.server_disable_hmac_sha2_512
  server_disable_hmac_sha1                  = each.value.server_disable_hmac_sha1
  server_disable_hmac_sha2_256              = each.value.server_disable_hmac_sha2_256
  server_enable_cipher_aes_cbc              = each.value.server_enable_cipher_aes_cbc
  server_enable_cipher_3des_cbc             = each.value.server_enable_cipher_3des_cbc
  server_session_limit                      = each.value.server_session_limit
  server_logging                            = each.value.server_logging
  server_dscp                               = each.value.server_dscp
  server_netconf_port                       = each.value.server_netconf_port
  server_netconf_vrfs                       = each.value.server_netconf_vrfs
  server_netconf_xml                        = each.value.server_netconf_xml
  server_rekey_time                         = each.value.server_rekey_time
  server_rekey_volume                       = each.value.server_rekey_volume
  server_algorithms_key_exchanges           = each.value.server_algorithms_key_exchanges
  server_algorithms_host_key_ecdsa_nistp256 = each.value.server_algorithms_host_key_ecdsa_nistp256
  server_algorithms_host_key_ecdsa_nistp384 = each.value.server_algorithms_host_key_ecdsa_nistp384
  server_algorithms_host_key_ecdsa_nistp521 = each.value.server_algorithms_host_key_ecdsa_nistp521
  server_algorithms_host_key_rsa            = each.value.server_algorithms_host_key_rsa
  server_algorithms_host_key_dsa            = each.value.server_algorithms_host_key_dsa
  server_algorithms_host_key_x509v3_ssh_rsa = each.value.server_algorithms_host_key_x509v3_ssh_rsa
  server_algorithms_host_key_ed25519        = each.value.server_algorithms_host_key_ed25519
  server_algorithms_host_key_rsa_sha512     = each.value.server_algorithms_host_key_rsa_sha512
  server_algorithms_host_key_rsa_sha256     = each.value.server_algorithms_host_key_rsa_sha256
  server_algorithms_host_key_ssh_rsa        = each.value.server_algorithms_host_key_ssh_rsa
  server_algorithms_ciphers                 = each.value.server_algorithms_ciphers
  server_max_auth_limit                     = each.value.server_max_auth_limit
  server_tcp_window_scale                   = each.value.server_tcp_window_scale
  server_port_forwarding_local              = each.value.server_port_forwarding_local
  server_port                               = each.value.server_port
  server_usernames                          = each.value.server_usernames
  client_source_interface                   = each.value.client_source_interface
  client_vrf                                = each.value.client_vrf
  client_dscp                               = each.value.client_dscp
  client_rekey_time                         = each.value.client_rekey_time
  client_rekey_volume                       = each.value.client_rekey_volume
  client_disable_hmac_sha1                  = each.value.client_disable_hmac_sha1
  client_disable_hmac_sha2_512              = each.value.client_disable_hmac_sha2_512
  client_disable_hmac_sha2_256              = each.value.client_disable_hmac_sha2_256
  client_enable_cipher_aes_cbc              = each.value.client_enable_cipher_aes_cbc
  client_enable_cipher_3des_cbc             = each.value.client_enable_cipher_3des_cbc
  client_algorithms_key_exchanges           = each.value.client_algorithms_key_exchanges
  client_algorithms_ciphers                 = each.value.client_algorithms_ciphers
  client_tcp_window_scale                   = each.value.client_tcp_window_scale
  client_v2                                 = each.value.client_v2
  client_v1                                 = each.value.client_v1
  client_knownhost                          = each.value.client_knownhost
}
