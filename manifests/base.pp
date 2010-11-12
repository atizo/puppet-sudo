class sudo::base {
  if $deploy_sudoers {
    file{'/etc/sudoers':
      source => [
        "puppet://$source/modules/site-sudo/$fqdn/sudoers",
        "puppet://$source/moduels/site-sudo/sudoers",
        "puppet://$source/modules/sudo/$operatingsystem/sudoers",
        "puppet://$source/modules/sudo/sudoers",
      ],
      owner => root, group => 0, mode => 0440;
    }
  }
}
