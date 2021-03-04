# Chat-App-using-Socket.io
Creating a aws server to deploy our Socket.io application on it

** To access the AWS to create all the AWS resource
* You will need to put your access key and secret key

```
provider "aws" {
	region = "us-east-2"
    aws_access_key=""
    aws_secret_key=""
}

```
  
## Setup aws networking
1. creating a VPC (Virtual Private Cloud) we use this vpc to luch our EC2 instance and all the networking
2. Creating two public subnet in two diffrent availability zone which is randomly choosen 
3. To make subnet public we need to create a aws internet gateway to give the access to the subnet 
4. to connect the two subnets to the inetnet gatway we need a route table for it so we create a routing table

## Setup the instance using autoscalling group
1. We need to configure aws lunch configuration this is for EC2 instance which all the instance will be created on this
2. We created 2 instances using autoscaling 
3. We created a keypair in the provider using our machine public key and attach it to the autosclaing group

## Accessing the application via Application load balancer
1. We created security group with 80 HTTP and 22 SSH inbound and All outbound
2. We created target group because autoscaling work with target group for load balancing 
3. To attach ALB to the Target group we need autoscalling attachment

### After Server have been created we need to install node and configure the appliction using ansible

** To access the server in ansible 
* You will need public IP address with ssh

```
serv1 ansible_host="" ansible_connection=ssh ansible_user=ubuntu
serv2 ansible_host="" ansible_connection=ssh ansible_user=ubuntu

```

## playbook.yml file 
1. First we need to install node and some pre requisite 
2. install forever package for running the application always
3. To get tha app we need to clone the repository
4. Start the app.js for always 