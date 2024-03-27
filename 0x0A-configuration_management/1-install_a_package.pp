# A puppet manifest that install flask from pip3.
package { 'pip':
  ensure   => present,
}

package { 'flask':
  ensure   => '2.1.0',
  provider => pip3,
  require  => Package['pip']
}
