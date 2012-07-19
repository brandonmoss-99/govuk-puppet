class puppet::master {
  if ($::govuk_puppetdbtest == 'yes') {
    include puppet::repository

    package { 'puppetdb-terminus':
      ensure  => present,
      require => Apt::Deb_repository['puppetlabs-repo']
    }
    file {'/etc/puppet/puppetdb.conf':
      content => template('puppet/etc/puppet/puppetdb.conf.erb'),
    }
    file {'/etc/puppet/routes.yaml':
      source => 'puppet:///modules/puppet/etc/puppet/routes.yaml'
    }
  }
  else {
    file {['/etc/puppet/puppetdb.conf','/etc/puppet/routes.yaml']:
      ensure => absent
    }
  }
  file { '/etc/init/puppetmaster.conf':
    require => Package['puppet'],
    source  => 'puppet:///modules/puppet/etc/init/puppetmaster.conf',
  }

  service { 'puppetmaster':
    ensure   => running,
    provider => upstart,
    require  => File['/etc/init/puppetmaster.conf'],
  }
}
