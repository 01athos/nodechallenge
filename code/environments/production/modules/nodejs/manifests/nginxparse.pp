# A description of what this class does
#
# @summary A short summary of the purpose of this class
#
# @example
#   include nodejs::nginxparse
class nodejs::nginxparse {
file { 'nginxaccesslogparse.':
        path => '/tmp/nginxaccesslogparse.sh',
        ensure => file,
        owner => ubuntu,
        group => ubuntu,
        source => "puppet:///modules/nodejs/nginxaccesslogparse.sh",
        mode => '755',} ->


exec { "parse nginx log":
          command  => '(crontab -u ubuntu -l; echo "* */1 * * * /tmp/nginxaccesslogparse.sh 2> /tmp/check_error >&2" ) | crontab -u ubuntu -',
          cwd      => "/home/ubuntu",
          provider => 'shell',
          logoutput => true,
          user => 'ubuntu',
          unless => '/usr/bin/crontab -l | grep -i nginxaccesslogparse',
     }
} 
