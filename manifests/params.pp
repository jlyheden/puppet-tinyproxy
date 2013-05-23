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
  case $::osfamily {
    'RedHat':{
      $configfile = '/etc/tinyproxy/tinyproxy.conf'
      $package = 'tinyproxy'
      $service = 'tinyproxy'
      $hasstatus = false
      $hasrestart = true
      $user = 'tinyproxy'
      $group = 'tinyproxy'
      $port = 8888
      $listen = undef
      $bind = undef
      $bindsame = undef
      $connection_timeout = 600
      $allow = []
      $errorfiles = {}
      $defaulterrorfile= '/usr/share/tinyproxy/default.html'
      $stathost = undef
      $statfile = '/usr/share/tinyproxy/stats.html'
      $logfile = '/var/log/tinyproxy/tinyproxy.log'
      $syslog = undef
      $log_level = 'Info'
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
      case $::lsbdistcodename {
        'lucid','precise': {
          $configfile = '/etc/tinyproxy.conf'
          $package = 'tinyproxy'
          $service = 'tinyproxy'
          $hasstatus = false
          $hasrestart = true
          $user = 'nobody'
          $group = 'nogroup'
          $port = 3128
          $listen = undef
          $bind = undef
          $bindsame = undef
          $connection_timeout = 600
          $allow = []
          $errorfiles = {}
          $defaulterrorfile= '/usr/share/tinyproxy/default.html'
          $stathost = undef
          $statfile = '/usr/share/tinyproxy/stats.html'
          $logfile = '/var/log/tinyproxy/tinyproxy.log'
          $syslog = undef
          $log_level = 'Info'
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
          fail("Unsupported osfamily: ${::osfamily}, lsbdistcodename: ${::lsbdistcodename}")
        }
      }
    }
  }
}
