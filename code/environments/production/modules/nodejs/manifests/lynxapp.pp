# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxapp
class nodejs::lynxapp {
	
	file { 'lynxapp.js':
        path => '/root/lynxapp.js',
        ensure => file,
	owner => root,
	group => root,
        source => "puppet:///modules/nodejs/lynxapp.js",
	require => Class['nodejs::nodeinstall'],
        mode => '664',} ->
	
	file { 'node.js':
        path => '/root/node.js',
        ensure => file,
	owner => root,
	group => root,
        source => "puppet:///modules/nodejs/node.js",
        mode => '664',} ->
	
	file { 'weblynx':
        path => '/root/package.json',
        ensure => file,
	owner => root,
	group => root,
        source => "puppet:///modules/nodejs/package.json",
        mode => '664',} ->
	
	file { 'pm2-ubuntu.service':
        path => '/etc/systemd/system/pm2-ubuntu.service',
        ensure => file,
	owner => root,
	group => root,
        source => "puppet:///modules/nodejs/pm2-ubuntu.service",
	mode => '755',}
}
