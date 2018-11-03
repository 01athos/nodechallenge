# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::nginxconfig
class nodejs::nginxconfig {
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
	mode => '644',
	notify  => Service["nginx"],} -> # Restart nginx server if being updated

	file { 'ufw.conf':
        path => '/etc/ufw/ufw.conf',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/ufw.conf",
        mode => '644',
        notify  => Service["ufw"],} ->

	exec { "firewall rules":
        command  => '/usr/sbin/ufw allow 'OpenSSH' && /usr/sbin/ufw 'Nginx HTTPS'',
        user => 'root',
        provider => 'shell',
        logoutput => true,}
	
}
