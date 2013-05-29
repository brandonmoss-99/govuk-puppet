class govuk::node::s_licensify_lb {
  include govuk::node::s_base

  include loadbalancer

  $licensify_frontend_servers = extlookup('lb_nodes_licensify_frontend')
  $licensify_backend_servers = extlookup('lb_nodes_licensify_backend')
  $enable_feed_console = str2bool(extlookup('govuk_enable_licensify_feed_console','no'))

  loadbalancer::balance {
    # Licensify frontend
    'licensify':
      servers       => $licensify_frontend_servers,
      internal_only => true;

    # Licensify upload pdf public endpoint
    'uploadlicence':
      https_only    => true,
      internal_only => true,
      servers       => $licensify_frontend_servers;

    # Licensify admin interface
    'licensify-admin':
      https_only    => true,
      internal_only => true,
      servers       => $licensify_backend_servers;

  }
  if ($enable_feed_console) {
    loadbalancer::balance {
      # Licensify feed frontend
      'licensify-feed':
        https_only    => true,
        internal_only => true,
        servers       => $licensify_backend_servers;
    }
  }
}
