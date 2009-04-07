#
# sudo module
#
# Copyright 2008, Puzzle ITC GmbH
# Marcel Härry haerry+puppet(at)puzzle.ch
# Simon Josi josi+puppet(at)puzzle.ch
# Merged with immerda.ch Module
# <admin+puppet@immerda.ch>
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class sudo {
    case $kernel {
        linux: { include sudo::linux }
        default: { include sudo::base }
    }
}

class sudo::base {
    if $sudo_deploy_sudoers {
      file{'/etc/sudoers':
        source => [ "puppet://$source/files/sudo/sudoers/${fqdn}/sudoers",
                    "puppet://$source/files/sudo/sudoers/sudoers",
                    "puppet://$source/sudo/sudoers/${operatingsystem}/sudoers",
                    "puppet://$source/sudo/sudoers/sudoers" ],
        owner => root, group => 0, mode => 0440;
      }
    }
}

class sudo::linux inherits sudo::base {
    package{'sudo':
        ensure => installed,
    }

    if $sudo_deploy_sudoers {
      File['/etc/sudoers']{
        require => Package['sudo'],
      }
    }
}
