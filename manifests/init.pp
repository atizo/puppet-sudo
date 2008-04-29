#######################################
# sudo module
# Puzzle ITC - haerry+puppet(at)puzzle.ch
# GPLv3
# manages sudo 
#######################################


# modules_dir { "sudo": }
class sudo {
    case $operatingsystem {
        default: { include sudo::base }
    }
}

class sudo::base {
    package{sudo:
        ensure => installed,
    }
}
