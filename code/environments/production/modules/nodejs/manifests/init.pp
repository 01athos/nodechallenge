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
	include nodejs::lynxapp
	include nodejs::npmdep
	include nodejs::lynxexec
	include nodejs::nginxconfig
	include nodejs::ufwconfig
	include nodejs::loadtestexec
	include nodejs::nginxparse
}
