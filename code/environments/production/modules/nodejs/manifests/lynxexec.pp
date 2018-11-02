# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::lynxexec
class nodejs::lynxexec {
	exec { "start Lynxapp":
        	  command  => 'sudo nohup node lynxapp.js &',
	          cwd      => "/home/ubuntu",
	          provider => 'shell',
		  logoutput => true,
		  require => Class['nodejs::lynxapp'],
		  unless => 'netstat -tlnp |grep 3000' 
}

}
