# TF-Full-Instance-Stack
Fully provisioned AWS Instance setup with terraform

This repository contains TF codes that creates a fully working aws ec2 instance environment provisioned with a bash script that pulls, unzips and hosts a webpage

The resources created with these TF scripts includes:
VPC
3 Public and private Subnets for different availability zones for a specified region
An internet gateway
A route table  
Association of all public subnets with the route table
A security group which leaves port 22 and 80 accessible to the specified range of IPs
Key pairs
EC2 instance provisioned with a bash script (web.sh)
provisioned commands to instance with remote-exec
Created EBS volumes and attached it to instance
Output private and public IP address of instance on terminal upon creation
And execution is completed, TFstate file will be stored in specified s3 bucket 

To test run this Terraform, create new key-pair, modify instance key-pair value, modify the 'MYIP' variable and backend s3

