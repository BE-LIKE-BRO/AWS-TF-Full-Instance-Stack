# Fully provisioned AWS Instance setup with terraform

This repository contains TF codes that creates from scratch a fully working aws ec2 instance environment provisioned with a bash script that pulls, unzips and hosts a webpage

The resources created with these TF scripts includes:
1. VPC
2. 3 Public and private Subnets for different availability zones for a specified region
3. An internet gateway
4. A route table  
5. Association of all public subnets with the route table
6. A security group which leaves port 22 and 80 accessible to the specified range of IPs
7. Key pairs
8. EC2 instance provisioned with a bash script (web.sh)
9. provisioned commands to instance with remote-exec
10. Created EBS volumes and attached it to instance
11. Output private and public IP address of instance on terminal upon creation

EXECUTION PROCESS

1. create new key-pair in your aws environment
2. append instance key-pair value in instance.tf with newly created key-pair directory 
3. modify the 'MYIP' variable in vars.tf to yours 
3. Modify backend s3 to your s3

POINTER

Confirm deployment success by accessing the instance's port 80 on your browser; a webpage should open. 
Upon completion, TFstate file will be stored in specified s3 bucket 
