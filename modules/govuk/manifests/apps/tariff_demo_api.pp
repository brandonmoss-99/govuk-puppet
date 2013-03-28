class govuk::apps::tariff_demo_api($port = 3042) {
  govuk::app { 'tariff_demo_api':
    app_type          => 'rack',
    port              => $port,
    health_check_path => '/healthcheck',
  }
}
