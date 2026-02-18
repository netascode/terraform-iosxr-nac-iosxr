resource "iosxr_crypto" "crypto" {
  for_each = {
    for device in local.devices : device.name => device
    if try(local.device_config[device.name].crypto, null) != null ||
    try(local.defaults.iosxr.configuration.crypto, null) != null
  }
  device = each.value.name

  ca_trustpoint_system_description                     = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_description, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_description, null)
  ca_trustpoint_system_enrollment_retry_count          = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_enrollment_retry_count, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_enrollment_retry_count, null)
  ca_trustpoint_system_enrollment_retry_period         = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_enrollment_retry_period, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_enrollment_retry_period, null)
  ca_trustpoint_system_enrollment_url                  = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_enrollment_url, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_enrollment_url, null)
  ca_trustpoint_system_sftp_username                   = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_sftp_username, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_sftp_username, null)
  ca_trustpoint_system_sftp_password                   = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_sftp_password, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_sftp_password, null)
  ca_trustpoint_system_auto_enroll                     = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_auto_enroll, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_auto_enroll, null)
  ca_trustpoint_system_renewal_message_type_pkcsreq    = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_renewal_message_type_pkcsreq, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_renewal_message_type_pkcsreq, null)
  ca_trustpoint_system_skip_challenge_password         = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_skip_challenge_password, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_skip_challenge_password, null)
  ca_trustpoint_system_rsa_keypair                     = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_rsa_keypair, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_rsa_keypair, null)
  ca_trustpoint_system_ca_keypair_ecdsanistp521        = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ca_keypair_ecdsanistp521, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ca_keypair_ecdsanistp521, null)
  ca_trustpoint_system_crl_optional                    = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_crl_optional, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_crl_optional, null)
  ca_trustpoint_system_query_url                       = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_query_url, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_query_url, null)
  ca_trustpoint_system_ip_address                      = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ip_address, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ip_address, null)
  ca_trustpoint_system_subject_name                    = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_subject_name, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_subject_name, null)
  ca_trustpoint_system_subject_name_ca_certificate     = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_subject_name_ca_certificate, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_subject_name_ca_certificate, null)
  ca_trustpoint_system_subject_alternative_name        = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_subject_alternative_name, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_subject_alternative_name, null)
  ca_trustpoint_system_serial_number                   = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_serial_number, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_serial_number, null)
  ca_trustpoint_system_vrf                             = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_vrf, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_vrf, null)
  ca_trustpoint_system_lifetime_ca_certificate         = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_lifetime_ca_certificate, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_lifetime_ca_certificate, null)
  ca_trustpoint_system_lifetime_certificate            = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_lifetime_certificate, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_lifetime_certificate, null)
  ca_trustpoint_system_message_digest                  = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_message_digest, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_message_digest, null)
  ca_trustpoint_system_ca_keypair_dsa                  = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ca_keypair_dsa, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ca_keypair_dsa, null)
  ca_trustpoint_system_ca_keypair_ecdsanistp256        = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ca_keypair_ecdsanistp256, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ca_keypair_ecdsanistp256, null)
  ca_trustpoint_system_ca_keypair_ecdsanistp384        = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ca_keypair_ecdsanistp384, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ca_keypair_ecdsanistp384, null)
  ca_trustpoint_system_ca_keypair_ed25519              = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ca_keypair_ed25519, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ca_keypair_ed25519, null)
  ca_trustpoint_system_ca_keypair_rsa                  = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ca_keypair_rsa, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ca_keypair_rsa, null)
  ca_trustpoint_system_enrollment_self                 = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_enrollment_self, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_enrollment_self, null)
  ca_trustpoint_system_enrollment_terminal             = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_enrollment_terminal, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_enrollment_terminal, null)
  ca_trustpoint_system_ip_address_none                 = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_ip_address_none, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_ip_address_none, null)
  ca_trustpoint_system_keypair_dsa                     = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_keypair_dsa, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_keypair_dsa, null)
  ca_trustpoint_system_keypair_ecdsanistp256           = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_keypair_ecdsanistp256, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_keypair_ecdsanistp256, null)
  ca_trustpoint_system_keypair_ecdsanistp384           = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_keypair_ecdsanistp384, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_keypair_ecdsanistp384, null)
  ca_trustpoint_system_keypair_ecdsanistp521           = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_keypair_ecdsanistp521, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_keypair_ecdsanistp521, null)
  ca_trustpoint_system_keypair_ed25519                 = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_keypair_ed25519, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_keypair_ed25519, null)
  ca_trustpoint_system_keypair_rsa                     = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_keypair_rsa, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_keypair_rsa, null)
  ca_trustpoint_system_renewal_message_type_renewalreq = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_renewal_message_type_renewalreq, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_renewal_message_type_renewalreq, null)
  ca_trustpoint_system_serial_number_none              = try(local.device_config[each.value.name].crypto.ca_trustpoint_system_serial_number_none, local.defaults.iosxr.configuration.crypto.ca_trustpoint_system_serial_number_none, null)
  ca_http_proxy                                        = try(local.device_config[each.value.name].crypto.ca_http_proxy, local.defaults.iosxr.configuration.crypto.ca_http_proxy, null)
  ca_http_proxy_port                                   = try(local.device_config[each.value.name].crypto.ca_http_proxy_port, local.defaults.iosxr.configuration.crypto.ca_http_proxy_port, null)
  ca_source_interface_ipv4                             = try(local.device_config[each.value.name].crypto.ca_source_interface_ipv4, local.defaults.iosxr.configuration.crypto.ca_source_interface_ipv4, null)
  ca_source_interface_ipv6                             = try(local.device_config[each.value.name].crypto.ca_source_interface_ipv6, local.defaults.iosxr.configuration.crypto.ca_source_interface_ipv6, null)
  ca_rsa_1024_disable                                  = try(local.device_config[each.value.name].crypto.ca_rsa_1024_disable, local.defaults.iosxr.configuration.crypto.ca_rsa_1024_disable, null)
  ca_fqdn_check_ip_address_allow                       = try(local.device_config[each.value.name].crypto.ca_fqdn_check_ip_address_allow, local.defaults.iosxr.configuration.crypto.ca_fqdn_check_ip_address_allow, null)
  ca_crl_curl_timeout                                  = try(local.device_config[each.value.name].crypto.ca_crl_curl_timeout, local.defaults.iosxr.configuration.crypto.ca_crl_curl_timeout, null)
  fips_mode                                            = try(local.device_config[each.value.name].crypto.fips_mode, local.defaults.iosxr.configuration.crypto.fips_mode, null)

  ca_trustpoints = try(length(local.device_config[each.value.name].crypto.ca_trustpoints) == 0, true) ? null : [
    for tp in try(local.device_config[each.value.name].crypto.ca_trustpoints, []) : {
      trustpoint_name                   = try(tp.trustpoint_name, null)
      auto_enroll                       = try(tp.auto_enroll, null)
      crl_optional                      = try(tp.crl_optional, null)
      description                       = try(tp.description, null)
      enrollment_retry_count            = try(tp.enrollment_retry_count, null)
      enrollment_retry_period           = try(tp.enrollment_retry_period, null)
      enrollment_terminal               = try(tp.enrollment_terminal, null)
      enrollment_url                    = try(tp.enrollment_url, null)
      ip_address                        = try(tp.ip_address, null)
      ip_address_none                   = try(tp.ip_address_none, null)
      message_digest                    = try(tp.message_digest, null)
      method_est_credential_certificate = try(tp.method_est_credential_certificate, null)
      query_url                         = try(tp.query_url, null)
      renewal_message_type_pkcsreq      = try(tp.renewal_message_type_pkcsreq, null)
      renewal_message_type_renewalreq   = try(tp.renewal_message_type_renewalreq, null)
      rsakeypair                        = try(tp.rsakeypair, null)
      serial_number                     = try(tp.serial_number, null)
      serial_number_none                = try(tp.serial_number_none, null)
      sftp_password                     = try(tp.sftp_password, null)
      sftp_username                     = try(tp.sftp_username, null)
      skip_challenge_password           = try(tp.skip_challenge_password, null)
      subject_alternative_name          = try(tp.subject_alternative_name, null)
      subject_name                      = try(tp.subject_name, null)
      vrf                               = try(tp.vrf, null)
    }
  ]

  ca_openssh_trustpoints = try(length(local.device_config[each.value.name].crypto.ca_openssh_trustpoints) == 0, true) ? null : [
    for tp in try(local.device_config[each.value.name].crypto.ca_openssh_trustpoints, []) : {
      trustpoint_name = try(tp.trustpoint_name, null)
      rsakeypair      = try(tp.rsakeypair, null)
    }
  ]
}
