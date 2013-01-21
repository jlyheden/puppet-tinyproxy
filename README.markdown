What is it?
===========

A Puppet module that manages tinyproxy

Released under the Apache 2.0 licence

Dependencies:
-------------

puppet-concat: https://github.com/ripienaar/puppet-concat

Usage:
------

You can install, configure and start the service simply by including the class
<pre>
include tinyproxy
</pre>

The module supports a bunch of parameters, check the init.pp for more details, however here's an example on how to override a few parameters:
<pre>
class { 'tinyproxy':
    listen             => '127.0.0.1',
    port               => 8080,
    connection_timeout => 60
}
</pre>

In addition you can add ACLs, headers and upstream proxies via separate resource definitions:
<pre>
tinyproxy::header { 'X-My-Header':
    ensure  => present,
    value   => 'Powered by Tinyproxy'
}

tinyproxy::upstream { 'my_upstream':
    ensure  => present,
    proxy   => 'myproxy:8080',
    match   => '.domain.com'
}

tinyproxy::noupstream { 'my_noupstream':
    ensure  => present,
    match   => '.internal.domain.com'
}

tinyproxy::reversepath { 'my_reversepath':
    ensure  => present,
    path    => '/mypath/',
    target  => 'http://www.some.server.com'
}
</pre>