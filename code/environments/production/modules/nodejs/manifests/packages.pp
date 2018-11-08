# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::packages
class nodejs::packages {
	$ubuntupkgs = [ 'curl','python-software-properties','nginx','libsasl2-modules','postfix' ]
	package { 
	$ubuntupkgs: ensure => 'installed', 
        require => Class['nodejs::repos'],
}
}
