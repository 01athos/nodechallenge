# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs
class nodejs {
	include nodejs::repos
	include nodejs::packages
	include nodejs::nodeinstall
	include nodejs::npmdep
	include nodejs::lynxapp
	include nodejs::lynxexec
}
