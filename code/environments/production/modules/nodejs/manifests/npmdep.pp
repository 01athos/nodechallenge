# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::npmdep
class nodejs::npmdep {
	exec { "npm pm2":
       	          command  => 'npm install -g pm2@latest && npm install backup@latest',
		  cwd => '/root',
		  user => 'root',
	          provider => 'shell',
		  logoutput => true,
		  require => Class['nodejs::lynxapp'], 
	     } ->
	exec { "npm dependencies":
        	  command  => 'cd /root && npm install',
		  cwd => '/root',
		  user => 'root',
	          provider => 'shell',
		  logoutput => true,
	     }
}
