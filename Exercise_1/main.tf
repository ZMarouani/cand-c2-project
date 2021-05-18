# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
    profile = "udacity"
    region = "us-east-1"
    shared_credentials_file = "C:\\Users\\marouanizied\\.aws\\credentials"

}

#Use command terraform import aws_vpc.Primary vpc-08c4190270427a49b 
#To import existing vpc
resource "aws_vpc" "Primary" {
  cidr_block       = "10.1.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Primary"
  }
}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "Udacity_T2" {
    count = 4
    ami = "ami-0742b4e673072066f"
    instance_type = "t2.micro"
    tags = {
      "name" = "Udacity T2"
    }
    subnet_id = "subnet-0ca29555d1d84cf64"
}

# TODO: provision 2 m4.large EC2 instances named Udacity M4
resource "aws_instance" "Udacity_M4" {
    count = 2
    ami = "ami-0d5eff06f840b45e9"
    instance_type = "m4.large"
    tags = {
      "name" = "Udacity M4"
    }
    subnet_id = "subnet-0ca29555d1d84cf64"
}

