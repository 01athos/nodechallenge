# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::npmdep
class nodejs::npmdep {
	exec { "npm pm2":
       	          command  => 'npm install -g pm2@latest && sudo npm install backup@latest',
		  user => 'root',
	          provider => 'shell',
		  logoutput => true,
		  unless => '/usr/bin/test -f /usr/bin/pm2',
	     } ->
	exec { "npm dependencies":
        	  command  => 'npm install',
		  cwd => '/opt/weblynx',
		  user => 'root',
	          provider => 'shell',
		  logoutput => true,
		  require => Class['nodejs::nodeinstall'], 
		  unless => 'npm list |grep express',
	     }
}
