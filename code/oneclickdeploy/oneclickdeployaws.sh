#!/bin/bash
user="ubuntu"
key="/root/ansible.pem"
##awsoneclickdeploy
aws ec2 run-instances --image-id ami-0782e9ee97725263d --count 1 --instance-type t2.micro --key-name ansible --security-group-ids sg-0f87adac49964b3c9 --subnet-id subnet-0c88800b4d1404bad --associate-public-ip-address |grep "PrivateIpAddress" |grep -v "\["  |cut -d"\"" -f4 |uniq > /tmp/ipvm.txt
## Cria variavel com o Ip da vm criada
ipaddress=`cat /tmp/ipvm.txt`
sudo ssh-keygen -f "/root/.ssh/known_hosts" -R ${ipaddress}
sleep 50
## Aceita o fingerprint da troca de chaves ssh
sudo ssh-keyscan -H ${ipaddress} >> ~/.ssh/known_hosts
## Instala o Puppet Client
ssh -i ${key} ${user}@${ipaddress} < /root/oneclickdeploy/puppetclientinstall.sh
sleep 5
cd /root/oneclickdeploy
## Aceita a chave do puppetclient no master
./puppetmasteraccept.sh
sleep 10
## Deploy Lynxapp via puppet
ssh -i ${key} ${user}@${ipaddress} < /root/oneclickdeploy/puppetrun.sh
