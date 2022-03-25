terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
# Configure the AWS Provider

provider "aws" {
  shared_config_files      = ["${var.myawsconf}"]
  shared_credentials_files = ["${var.myawscreds}"]
  profile                  = var.myawsprof
}
resource "aws_key_pair" "def_key" {
  key_name   = "def_key"
  public_key = var.def_key_path
}
#-------------------------------------------------
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity
#
data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "caller_arn" {
  value = data.aws_caller_identity.current.arn
}

output "caller_user" {
  value = data.aws_caller_identity.current.user_id
}
#---------------------------------------------------
# 1. Create VPC
resource "aws_vpc" "proj1_vpc" {
  cidr_block           = var.vpcidrblock
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "proj1-vpc"
  }
}
# 2. Add subnet to VPC
resource "aws_subnet" "proj1_subnet" {
  vpc_id            = aws_vpc.proj1_vpc.id
  cidr_block        = var.subnetblock
  availability_zone = "${var.myawsregion}a"
  tags = {
    Name = "proj1-subnet"
  }
}
# 3. Add IGW to VPC
resource "aws_internet_gateway" "proj1_igw" {
  vpc_id = aws_vpc.proj1_vpc.id
  tags = {
    Name = "proj1-igw"
  }
}
# 4. Add default route via IGW to VPC
resource "aws_route_table" "proj1_routes" {
  vpc_id = aws_vpc.proj1_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proj1_igw.id
  }
  tags = {
    Name = "proj1-defrt"
  }
}
# 5. connect IGW-routes and Subnet
resource "aws_route_table_association" "proj1_public" {
  subnet_id      = aws_subnet.proj1_subnet.id
  route_table_id = aws_route_table.proj1_routes.id
}
# 6. Prepare Security Group for instance
resource "aws_security_group" "proj1_sg" {
  name        = "Project-1-EC2-SG"
  description = "To get access to EC2 instance"
  vpc_id      = aws_vpc.proj1_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# 7. Create EC2 Instance
resource "aws_instance" "project1_inst" {
  ami                         = var.aws_ami
  instance_type               = var.aws_instype
  key_name                    = aws_key_pair.def_key.id
  vpc_security_group_ids      = ["${aws_security_group.proj1_sg.id}"]
  subnet_id                   = aws_subnet.proj1_subnet.id
  availability_zone           = "${var.myawsregion}a"
  associate_public_ip_address = true
  tags = {
    Name = "Project-1-EC2"
  }
}

output "instance-private-ip" {
  value = aws_instance.project1_inst.private_ip
}

output "instance-public-ip" {
  value = aws_instance.project1_inst.public_ip
}












# 1. Create an S3 bucket and copy some files on it
# 2. then create an EC2 instance
# 3. copy SSH keys for access over to the EC2
# 4. then start a remote script to do some work
# 5. leave log of the script on S3 bucket

# 1. Create S3 bucket
# resource "aws_s3_bucket" "project1-bucket" {
#    bucket = var.bucket_name
#    acl = var.bucket_acl
#}
# upload stuff to the buckets
# resource "aws_s3_bucket_object" "upload_to_S3" {
#  for_each = fileset("uploadS3/", "*")
#  bucket = aws_s3_bucket.project1-bucket.id
#  key = each.value
#  source = "uploadS3/${each.value}"
#}
