#!/usr/bin/pup
# A puppet manifest to install a flask(2.1.0) using package (pip3)
package {'flask':
  ensure   => '2.1.0',
  provider => 'pip3'
}
