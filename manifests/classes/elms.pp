class elms_base::mongo_server {
  include govuk_node::base
  include ecryptfs
  include mongodb::server
  include java::openjdk6::jre

  case $::govuk_provider {
    sky: {
      $mongo_hosts = [
        "licensify-mongo-1.licensify.${::govuk_platform}",
        "licensify-mongo-2.licensify.${::govuk_platform}",
        "licensify-mongo-3.licensify.${::govuk_platform}"
      ]
    }
    #aws
    default: {
      $mongo_hosts = [
        'licensify-mongo0',
        'licensify-mongo1',
        'licensify-mongo2'
      ]
    }
  }

  @@backup::directory {"backup_mongodb_backups_$::hostname":
    directory => '/var/lib/automongodbbackup/',
    host_name => $::hostname,
    fq_dn     => $::fqdn,
  }

  class { 'mongodb::backup':
    members   => $mongo_hosts,
    domonthly => false
  }

  class { 'mongodb::configure_replica_set':
    members => $mongo_hosts
  }
}

class elms_base::frontend_server {
  include govuk_node::base
  include clamav
  include java::openjdk6::jre

  class { 'nginx': }
  class { 'licensify::apps':
    require => Class['nginx']
  }
}

class elms_base::sky_frontend_server {
  include govuk_node::base
  include clamav
  include java::openjdk6::jre

  class { 'nginx': }
  class { 'licensify::apps::licensify': }
}

class elms_base::sky_backend_server {
  include govuk_node::base
  include clamav
  include java::openjdk6::jre

  class { 'nginx': }
  class { 'licensify::apps::licensify_admin': }
  class { 'licensify::apps::licensify_feed': }
}
