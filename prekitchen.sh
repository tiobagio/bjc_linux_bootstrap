#!/bin/bash
# README:
# This utility is run before `kitchen create` on AWS instance.  It populates .kitchen.local.yml with the 
# subnet_id and security_group_id of the instance where this utility runs.
#
# Need some checking like this (taken from AWS EC2 tool)
#
#x=$(curl -s http://169.254.169.254/)
#if ( $? -gt 0 ) {
#        Write-Host '[ERROR] Command not valid outside EC2 instance. Please run this command within a running EC2 instance.'
#        exit 1
#}

mymac=`curl -s http://169.254.169.254/latest/meta-data/mac`
my_vpc_id=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mymac/vpc-id`
my_security_group_id=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mymac/security-group-ids`
my_subnet_id=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/$mymac/subnet-id`

echo "writing to .kitchen.local.yml with security group $my_security_group_id on subnet $my_subnet_id"

export AWS_REGION="ap-southeast-1"
export AWS_VPC_ID=$my_vpc_id
export AWS_SUBNET_ID=$my_subnet_id
export AWS_SECURITY_GROUP_ID=$my_security_group_id
export AWS_KEYPAIR="chef-gcc"
export AWS_KEYPAIR_FILE="/home/ubuntu/.ssh/chef-gcc.pem"
export CHEF_ORG="automate-org"
export AUTOMATE_HOSTNAME="aut-automate-server.com"

#entries=<<-EOF
#---
#driver:
#    security_group_ids: $mysg
#    subnet_id: $mysubnet
#EOF
#echo $entries > ./kitchen.local.yml 
