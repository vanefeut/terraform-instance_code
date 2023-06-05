Module Name: ec2-instance-spin
Author: Kennedy N


Disclaimer: This module employs a module in its implementation

        Published May 30, 2023 by terraform-aws-modules
        Module managed by antonbabenko
        Source Code: github.com/terraform-aws-modules/terraform-aws-vpc 

Description:
Module spins EC2 instance based on list of variables specified in calling module.
as described below:-

team="dev"--------------------Team Signature

owner="Ken"-------------------Author Signature

env="stage"-------------------Environment Signature

region = "us-east-1"-----------AWS region in which to create instances

vpc_name="stage-vpc"-----------VPC Name 

vpc_cidr ="192.168.0.0/16"-----VPC CIDR BLOCK

sg_name="stage-sg"-------------Security group name

ec2_instance_name="stage-server"--EC2 instance name

instance_type = "t3.micro"--------EC2 instance type

key_name="stage-terraform-key"-----Key pair key name



