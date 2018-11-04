# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::nginxconfig
class nodejs::nginxconfig {
	file { 'dhparam.pem':
        path => '/etc/ssl/certs/dhparam.pem',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/dhparam.pem",
        require => Class['nodejs::lynxexec'],
        mode => '644',} ->

	file { 'nginx-selfsigned.crt':
        path => '/etc/ssl/certs/nginx-selfsigned.crt',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/nginx-selfsigned.crt",
        require => Class['nodejs::lynxexec'],
        mode => '644',} ->
	
	file { 'nginx-selfsigned.key':
        path => '/etc/ssl/private/nginx-selfsigned.key',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/nginx-selfsigned.key",
        require => Class['nodejs::lynxexec'],
        mode => '644',} ->
	
	file { 'self-signed.conf':
        path => '/etc/nginx/snippets/self-signed.conf',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/self-signed.conf",
        require => Class['nodejs::lynxexec'],
        mode => '644',} ->
	
	file { 'ssl-params.conf':
        path => '/etc/nginx/snippets/ssl-params.conf',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/ssl-params.conf",
        mode => '644',} ->
	
	file { 'default':
        path => '/etc/nginx/sites-available/default',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/default",
	require => Package["nginx"],        	
	mode => '644',} ->

	exec { "nginx restart":
        command  => '/bin/systemctl restart nginx && /usr/bin/touch /home/nginxrestarted',
        user => 'root',
        provider => 'shell',
	unless => '/usr/bin/test -f /home/nginxrestarted',
        logoutput => true,}
}
