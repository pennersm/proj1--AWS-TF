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
variable "myawsregion" {
  default = "eu-south-1"
}
variable "sourcerepo" {
  default = "devopsTrain-exe1-awstf"
}
variable "CIPipeline" {
  default = "devopsTrain-exe1-cipipe"
}
#-----------------------------------
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
variable "aws_instype" {
  default = "t3.micro"
}
variable "bucket_acl" {
  default = "private"
}
variable "bucket_name" {
  default = "project1_bucket"
}
