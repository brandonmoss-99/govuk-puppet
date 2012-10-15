class govuk::apps::static( $port = 3013 ) {
  govuk::app { 'static':
    app_type           => 'rack',
    port               => $port,
    enable_nginx_vhost => false,
    #if changed, nginx::config::vhost::static also needs to change
    health_check_path  => '/templates/wrapper.html.erb';
  }

  $whitehall_host = "whitehall-frontend.$::govuk_platform.alphagov.co.uk"

  nginx::config::vhost::static { "static.$::govuk_platform.alphagov.co.uk":
    to                => "localhost:${port}",
    protected         => false,
    aliases           => ['calendars', 'smartanswers', 'static', 'frontend', 'designprinciples', 'licencefinder', 'tariff', 'efg', 'feedback', 'datainsight-frontend', 'businesssupportfinder'],
    ssl_only          => true,
    server_names      => ['static.*', 'assets.*'],
    extra_root_config => "location ^~ /government/assets/ {
      expires max;
      proxy_set_header Host $whitehall_host;
      proxy_pass http://$whitehall_host;
    }

    location ^~ /government/uploads/ {
      proxy_set_header Host $whitehall_host;
      proxy_pass http://$whitehall_host;
    }

    # PNGs for graphs that are being served in IE instead of SVGs
    # cannot be static assets since they are being regenerated
    # every N minutes, but should be still served via CDN
    location ~ /performance/graphs/.*\.png$ {
      proxy_set_header Host $datainsight_host;
      proxy_set_header Cache-Control 'max-age=300';
      proxy_pass http://$datainsight_host;
    }",
  }

}
