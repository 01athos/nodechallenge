# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::ufwconfig
class nodejs::ufwconfig {

        exec { "firewall rules":
        command  => '/usr/sbin/ufw allow "OpenSSH" && /usr/sbin/ufw allow "Nginx HTTPS" && /usr/bin/touch /home/rulesok.txt',
        user => 'root',
        provider => 'shell',
	require =>  Class['nodejs::nginxconfig'],
	unless => '/usr/bin/test -f /home/rulesok.txt',
        logoutput => true,} ->
	
	file { 'ufw.conf':
        path => '/etc/ufw/ufw.conf',
        ensure => file,
        owner => root,
        group => root,
        source => "puppet:///modules/nodejs/ufw.conf",
        mode => '644',} ->

	exec { "firewall restart":
        command  => '/bin/systemctl restart ufw && /usr/bin/touch /home/firewallok.txt',
        user => 'root',
        provider => 'shell',
	unless => '/usr/bin/test -f /home/firewallok.txt',
        logoutput => true,}
}
