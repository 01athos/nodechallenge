# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxapp
class nodejs::lynxapp {
	
	file { 'lynxapp.js':
        path => '/home/ubuntu/lynxapp.js',
        ensure => file,
	owner => ubuntu,
	group => ubuntu,
        source => "puppet:///modules/nodejs/lynxapp.js",
	require => Class['nodejs::nodeinstall'],
        mode => '664',} ->
	
	file { 'weblynx':
        path => '/home/ubuntu/package.json',
        ensure => file,
	owner => ubuntu,
	group => ubuntu,
        source => "puppet:///modules/nodejs/package.json",
        mode => '664',} ->
	
	file { 'pm2-ubuntu.service':
        path => '/etc/systemd/system/pm2-ubuntu.service',
        ensure => file,
	owner => ubuntu,
	group => ubuntu,
        source => "puppet:///modules/nodejs/pm2-ubuntu.service",
	mode => '755',}
}
