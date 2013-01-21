# == Define tinyproxy::reversepath
#
# Configures reverse proxy path mappings
#
# === Parameters
#
# [*namevar*]
#   Required. Description of reverse proxy path mapping
#
# [*ensure*]
#   Optional. Ensure parameter
#
# [*path*]
#   Required. Path to proxy
#
# [*target*]
#   Required. URL to proxy to
#
# === Sample usage
#
# tinyproxy::noupstream { 'no_proxy_my_other_site_com':
#   ensure  => present,
#   match   => 'my.other.site.com',
# }
#
define tinyproxy::reversepath ( $ensure = present, $path, $target ) {
  include tinyproxy::params
  concat::fragment { "tinyproxy_reversepath_${name}":
    ensure  => $ensure,
    content => "ReversePath \"${path}\" \"${target}\"\n",
    order   => 50
  }
}