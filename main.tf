terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    shell = {
      source  = "scottwinkler/shell"
      version = "~> 1.0"
    }
  }
}
# Configure the AWS Provider

provider "aws" {
  shared_config_files      = ["${var.myawsconf}"]
  shared_credentials_files = ["${var.myawscreds}"]
  profile                  = var.myawsprof
  alias                    = "region"
  default_tags {
    tags = {
      Source   = "${var.sourcerepo}"
      Pipeline = "${var.CIPipeline}"
      Name     = "proj1"
    }
  }
}
data "aws_region" "current" {
  provider = aws.region
}
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair
# ... and note in above: aws provider does not create-new but require-existing key file
# https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#having-ec2-create-your-key-pair
# a) create a new pair according to aws spec
# b) paste the pub-key directly into a var and dont use file-path (would give format errors)
# c) this keypair obviously is NEW to AWS and not already imported or generated in console
resource "aws_key_pair" "proj1_key" {
  provider   = aws.region
  key_name   = "id_proj1"
  public_key = var.def_pub_key
}
#-------------------------------------------------
# 1. Create VPC
resource "aws_vpc" "proj1_vpc" {
  provider             = aws.region
  cidr_block           = var.vpcidrblock
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "aws:vpc-${var.vpcidrblock}"
  }
}
# 2. Add subnet to VPC
resource "aws_subnet" "proj1_subnet" {
  vpc_id            = aws_vpc.proj1_vpc.id
  cidr_block        = var.subnetblock
  availability_zone = "${var.myawsregion}a"
  tags = {
    Name = "aws:subnet-${var.subnetblock}"
  }
}
# 3. Add IGW to VPC
resource "aws_internet_gateway" "proj1_igw" {
  vpc_id = aws_vpc.proj1_vpc.id
}
# 4. Add default route via IGW to VPC
resource "aws_route_table" "proj1_routes" {
  vpc_id = aws_vpc.proj1_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.proj1_igw.id
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
  key_name                    = aws_key_pair.proj1_key.id
  vpc_security_group_ids      = ["${aws_security_group.proj1_sg.id}"]
  subnet_id                   = aws_subnet.proj1_subnet.id
  availability_zone           = "${var.myawsregion}a"
  associate_public_ip_address = true
}
# 8. Create a hosts file for ansible
# but this way doesnt scale inventory groups and is ugly - can be done better:
# https://github.com/habakke/terraform-provider-ansible/blob/main/README.md
resource "local_file" "ansible_inventory" {
  depends_on = [aws_instance.project1_inst]
  content = templatefile("${path.module}/ansible/inventory.tmpl",
    { ec2pubip = aws_instance.project1_inst.public_ip }
  )
  filename        = "${path.module}/ansible/${var.ansible_hosts}"
  file_permission = "0644"
}
# 9. Run the playbook to install requested SW
# https://livebook.manning.com/book/terraform-in-action/appendix-d/v-11/14
resource "shell_script" "call_ansible" {
  lifecycle_commands {
    create = <<-EOF
      cd "${path.module}/ansible/"
      rc="$(ansible-playbook ${path.module}/${var.ansible_playbook} >/dev/null 2>&1)$?"
      echo "{\"ansible_playbook_exit_status\": \"$rc\"}" > ${path.module}/${var.ansible_tf_statfile}
    EOF
    delete = <<-EOF
      rm -f "ansible/${var.ansible_log}"
      rm -f "ansible/${var.ansible_tf_statfile}"
    EOF
  }
  environment = {
    ANSIBLE_HOST_KEY_CHECKING = "False"
    ANSIBLE_PRIVATE_KEY_FILE  = var.ansible_privkey
    ANSIBLE_LOG_PATH          = var.ansible_log
    ANSIBLE_REMOTE_USER       = var.ami_user
    ANSIBLE_INVENTORY         = var.ansible_hosts
  }
  depends_on = [local_file.ansible_inventory]
}
#output "call_ansible" {
#  value = shell_script.call-ansible.output["ansible_playbook_exit_status"]
#}

# Create an S3 bucket and copy some files on it:
# 1. Create S3 bucket
# resource "aws_s3_bucket" "project1-bucket" {
#    bucket = var.bucket_name
#    acl = var.bucket_acl
#}
# upload stuff to the bucket
# resource "aws_s3_bucket_object" "upload_to_S3" {
#  for_each = fileset("uploadS3/", "*")
#  bucket = aws_s3_bucket.project1-bucket.id
#  key = each.value
#  source = "uploadS3/${each.value}"
#}
