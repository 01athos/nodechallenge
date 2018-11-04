# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxexec
class nodejs::lynxexec {
		exec { "pm2 start":
		cwd => '/home/ubuntu/',
                command  => 'sudo /usr/bin/pm2 start /home/ubuntu/lynxapp.js -i max',
                user => 'ubuntu',
                provider => 'shell',
                logoutput => true,
                unless => '/bin/netstat -tlnp |grep 3000',
                }

		service {'pm2-ubuntu.service': 
			ensure => running, 
			enable => true,}
		service {'ssh.service': 
			ensure => running, 
			enable => true,}
}
