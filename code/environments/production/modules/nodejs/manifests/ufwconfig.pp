# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::ufwconfig
class nodejs::ufwconfig {

        exec { "firewall rules":
        command  => '/usr/sbin/ufw allow 'OpenSSH' && /usr/sbin/ufw 'Nginx HTTPS'',
        user => 'root',
        provider => 'shell',
	require =>  Class['nodejs::nginxconf']
        logoutput => true,} ->
	
	file { 'ufw.conf':
        path => '/etc/ufw/ufw.conf',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/ufw.conf",
        mode => '644',
        notify  => Service["ufw"],}
}
