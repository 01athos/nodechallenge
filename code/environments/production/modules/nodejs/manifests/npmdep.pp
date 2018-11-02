# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::npmdep
class nodejs::npmdep {
	exec { "npm dependencies":
        	  command  => 'npm install express --save',
		  user => 'root',
	          provider => 'shell',
		  logoutput => true,
		  require => Class['nodejs::nodeinstall'], 
		  unless => 'npm list |grep express',
	     }
}
