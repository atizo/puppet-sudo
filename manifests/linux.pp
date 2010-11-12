class sudo::linux inherits sudo::base {
  package{'sudo':
    ensure => installed,
  }
  if $deploy_sudoers {
    File['/etc/sudoers']{
      require => Package['sudo'],
    }
  }
}
