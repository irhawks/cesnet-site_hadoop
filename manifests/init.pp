class site_hadoop inherits site_hadoop::params {
  include 'site_hadoop::install'
  include 'site_hadoop::config'

  Class['site_hadoop::install'] ->
  Class['site_hadoop::config'] ->
  Class['site_hadoop']
}