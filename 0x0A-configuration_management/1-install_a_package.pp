# A puppet manifest that install flask from pip3.
exec { 'update':
  command => '/usr/bin/apt-get update'
}

package { 'python3-pip':
  ensure  => installed,
  require => Exec['update']
}

exec { 'uninstall werkzeug':
  command => '/usr/bin/pip3 uninstall -y werkzeug',
  require => Package['python3-pip']
}

exec { 'install werkzeug':
  command => '/usr/bin/pip3 install werkzeug==0.16.1',
  require => Exec['uninstall werkzeug']
}

exec { 'install flask':
  command => '/usr/bin/pip3 install flask==2.1.0',
  require => Exec['install werkzeug']
}
