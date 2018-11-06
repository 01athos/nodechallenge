# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxexec
class nodejs::lynxexec {
		exec { "pm2 start":
		cwd => '/opt/weblynx/',
                command  => '/usr/bin/pm2 start /opt/weblynx/lynxapp.js -i max',
                user => 'root',
                provider => 'shell',
                logoutput => true,
                unless => '/bin/netstat -tlnp |grep 3000',
                }

#		service {'pm2-ubuntu.service': 
#			ensure => running, 
#			enable => true,}
		service {'ssh.service': 
			ensure => running, 
			enable => true,}
}
