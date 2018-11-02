# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::repos
class nodejs::repos {
	exec { "repos":
        	  command  => 'curl -sL https://deb.nodesource.com/setup_11.x | sudo -E bash - ',
	          provider => 'shell',
		  logoutput => true,
                  unless => 'dpkg --get-selections | grep nodejs',
	     }
}
