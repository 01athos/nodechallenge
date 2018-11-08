# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxexec
class nodejs::lynxexec {
		exec { "pm2 start":
		cwd => '/home/ubuntu',
                command  => 'export PM2_HOME="/home/ubuntu/.pm2" && pm2 start lynxapp.js -i max',
                user => 'ubuntu',
                provider => 'shell',
                logoutput => true,
                }

		service {'pm2-ubuntu.service': 
			ensure => running, 
			enable => true,}
		service {'ssh.service': 
			ensure => running, 
			enable => true,}
}
