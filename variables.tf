# your local users personal aws settings and profile
# main.tf uses the same key for both aws and later login to the EC2 instance
variable "myawsconf" {
  default = "/Users/mpenners/.aws/config"
}
variable "myawscreds" {
  default = "/Users/mpenners/.aws/credentials"
}
variable "myawsprof" {
  default = "pennersm"
}
variable "def_pub_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6Fvt5RoVlb+/w+fS38iDG6kvZoT84nbMCNwnL+3jbTrU5F0PY0fYG+DVwMdJuiuLONe9VjqvEwkiinGqyRJGmcc60g3krhPcVSXTP6dtNsAPplmVC9SrrZAyVtdyj3B+CvrWDjFxCsFjzWV2Py0C2j2rioaRZh6JhDCimJBiKEuXZxjh6R8toXut6njOAVoJPfmpBN6TJIY/YZRpw21HCjy7m86kNMb2+laeEBzmqu5Nbw01z5OyNDi9fA0DFlSfahWZ2F1Tx7fWIPILj8pUZnYWofV2lHDAtjEonKDcRdTBOwXg5suJq4JqZIUCWAy52skh0VK2WNpkdM7KUEtlv mpenners@M-C02W10FNHTDG"
}
# MIND TO ADJUST YOUR REGION
variable "myawsregion" {
  default = "eu-south-1"
}
#-----------------------------------
# those 2 are just used to assign tags
variable "sourcerepo" {
  default = "devopsTrain-exe1-awstf"
}
variable "CIPipeline" {
  default = "devopsTrain-exe1-cipipe"
}
#-----------------------------------
# Define your EC2 settings here
variable "vpcidrblock" {
  default = "10.0.2.0/23"
}
variable "subnetblock" {
  default = "10.0.2.0/24"
}
# NOTE: the AMI is region specific
variable "aws_ami" {
  default = "ami-0f8ce9c417115413d"
}
variable "ami_user" {
  default = "ubuntu"
}
variable "aws_instype" {
  default = "t3.micro"
}
variable "bucket_acl" {
  default = "private"
}
variable "bucket_name" {
  default = "project1_bucket"
}
#-----------------------------------
# settings for ansible
# playbook that will be executed this file can be edited
variable "ansible_playbook" {
  default = "proj1-tasks.yml"
}
#resource file will be managed by terraform editing useless
variable "ansible_hosts" {
  default = "hosts"
}
# private key that matches the pub key used above in def_pub_key
variable "ansible_privkey" {
  default = "/Users/mpenners/.aws/id_proj1"
}
# only while the EC2 instance is active tf keeps last ansible log here
variable "ansible_log" {
  default = "current_ansible.log"
}
# supposed to show output status to terraform tfstatfile but isnt working
variable "ansible_tf_statfile" {
  default = "ansible_tf_stat.json"
}
