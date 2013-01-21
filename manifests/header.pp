# == Define tinyproxy::header
#
# Inserts a HTTP header
#
# === Parameters
#
# [*namevar*]
#   Required. Name of header
#
# [*ensure*]
#   Optional. Ensure parameter
#
# [*value*]
#   Required. Value of header
#
# === Sample usage
#
# tinyproxy::header { 'X-My-Header':
#   ensure  => present,
#   value   => 'MyValue',
# }
#
define tinyproxy::header ( $ensure = present, $value ) {
  include tinyproxy::params
  concat::fragment { "tinyproxy_header_${name}":
    target  => $tinyproxy::params::configfile,
    ensure  => $ensure,
    content => "AddHeader \"${name}\" \"${value}\"\n",
    order   => 20
  }
}