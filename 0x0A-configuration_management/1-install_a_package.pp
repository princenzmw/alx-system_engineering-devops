#!/usr/bin/pup
# A Puppet manifest to install a Werkzeug and Flask using package (pip3)

package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3',
}

package {'werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
}
