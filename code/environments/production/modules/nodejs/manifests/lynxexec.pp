# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxexec
class nodejs::lynxexec {
		service {'pm2-ubuntu.service': 
			ensure => running, 
			enable => true,}
		service {'ssh.service': 
			ensure => running, 
			enable => true,}
}
