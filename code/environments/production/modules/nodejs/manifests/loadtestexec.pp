# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::loadtestexec
class nodejs::loadtestexec {
file { '/tmp/loadtest.sh':
        path => '/tmp/loadtest.sh',
        ensure => file,
        content => epp('/etc/puppetlabs/code/environments/production/modules/nodejs/files/loadtest.epp'),
        mode => '755',} ->

exec { "run loadtest":
                cwd => '/home/ubuntu',
                command  => '/tmp/loadtest.sh',
                user => 'ubuntu',
                provider => 'shell',
                logoutput => true,
                }

}
