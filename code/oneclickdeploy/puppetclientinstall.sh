#!/bin/bash
sudo su -
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
sudo dpkg -i puppetlabs-release-pc1-xenial.deb
sudo apt-get update -y
sudo apt-get install puppet-agent -y

echo "172.16.0.9   puppet" >> /etc/hosts

echo "[main]
server = puppet
environment = production
runinterval = 1h" > /etc/puppetlabs/puppet/puppet.conf
sleep 5
/opt/puppetlabs/bin/puppet agent -t
exit
