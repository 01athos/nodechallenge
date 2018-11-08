# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::npmdep
class nodejs::npmdep {
	exec { "npm pm2":
       	          command  => 'sudo npm install -g pm2@latest && sudo npm install -g backup@latest && sudo npm install -g loadtest@latest',
		  cwd => '/home/ubuntu',
		  user => 'ubuntu',
	          provider => 'shell',
		  logoutput => true,
		  require => Class['nodejs::lynxapp'], 
	     } ->
	exec { "npm dependencies":
        	  command  => 'sudo npm install',
		  cwd => '/home/ubuntu',
		  user => 'ubuntu',
	          provider => 'shell',
		  logoutput => true,
	     }
}
