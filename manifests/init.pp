#
# sudo module
#
# Copyright 2008, Puzzle ITC GmbH
# Copyright 2010, Atizo AG
# Marcel Härry haerry+puppet(at)puzzle.ch
# Merged with immerda.ch Module
# <admin+puppet@immerda.ch>
# Simon Josi simon.josi+puppet(at)atizo.com
#
# This program is free software; you can redistribute 
# it and/or modify it under the terms of the GNU 
# General Public License version 3 as published by 
# the Free Software Foundation.
#

class sudo($deploy_suoders = false) {
  case $kernel {
    linux: { include sudo::linux }
    default: { include sudo::base }
  }
}
