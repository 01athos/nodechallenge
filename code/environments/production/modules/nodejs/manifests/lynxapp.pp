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
	owner => root,
	group => root,
        source => "puppet:///modules/nodejs/lynxapp.js",
	require => Class['nodejs::nodeinstall'],
        mode => '664',}
}
