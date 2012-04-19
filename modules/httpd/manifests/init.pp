# Basic Puppet Apache manifest

class httpd {
  package { 'httpd':
    ensure => present,
  }

  service { 'httpd':
    ensure  => running,
    require => File['index.html'],
  }

  file { 'index.html':
      path   => '/var/www/html/index.html',
      ensure => file,
      require => Package['httpd'],
      source  => 'puppet:///modules/httpd/index.html',
  }

}
