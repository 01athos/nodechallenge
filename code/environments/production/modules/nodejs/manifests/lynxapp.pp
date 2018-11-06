# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxapp
class nodejs::lynxapp {
	
	file { '/opt/weblynx/':
        ensure => directory,
        owner  => root,
        group  => root,
        mode   => '755',
  	} ->
	file { 'lynxapp.js':
        path => '/opt/weblynx/lynxapp.js',
        ensure => file,
	owner => root,
	group => root,
        source => "puppet:///modules/nodejs/lynxapp.js",
	require => Class['nodejs::nodeinstall'],
        mode => '664',} ->
	
	file { 'weblynx':
        path => '/opt/weblynx/package.json',
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
