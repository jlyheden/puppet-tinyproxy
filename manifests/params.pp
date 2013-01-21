# == Class tinyproxy::params
#
# Settings class
#
# === Parameters
#
# None
#
class tinyproxy::params {
  $autoupgrade = false
  case $::lsbdistcodename {
    'lucid','precise': {
      $configfile = '/etc/tinyproxy.conf'
      $package = 'tinyproxy'
      $service = 'tinyproxy'
      $hasstatus = false
      $user = 'nobody'
      $group = 'nogroup'
      $port = 3128
      $listen = undef
      $bind = undef
      $bindsame = undef
      $timeout = 600
      $allow = []
      $errorfiles = {}
      $defaulterrorfile= '/usr/share/tinyproxy/default.html'
      $stathost = undef
      $statfile = '/usr/share/tinyproxy/stats.html'
      $logfile = '/var/log/tinyproxy/tinyproxy.log'
      $syslog = undef
      $loglevel = 'Info'
      $pidfile = '/var/run/tinyproxy/tinyproxy.pid'
      $xtinyproxy = undef
      $maxclients = 100
      $minspareservers = 5
      $maxspareservers = 20
      $startservers = 10
      $maxrequestsperchild = 0
      $viaproxyname = 'tinyproxy'
      $disableviaheader = undef
      $filter = undef
      $filterurls = undef
      $filterextended = undef
      $filtercasesensitive = undef
      $filterdefaultdeny = undef
      $anonymous = []
      $connectport = []
      $reverseonly = undef
      $reversemagic = undef
      $reversebaseurl = undef
    }
    default: {
      fail("Unsupported distro ${::lsbdistcodename}")
    }
  }
}