# A puppet manifest that install flask from pip3
exec { 'update':
  command => '/usr/bin/apt-get update'
}

package { 'python3-pip':
  ensure   => installed,
  require  => Exec['update']
}

exec { 'install flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  require => Package['python3-pip']
}
