variable "myawsconf" {
  default = "/Users/mpenners/.aws/config"
}
variable "myawscreds" {
  default = "/Users/mpenners/.aws/credentials"
}
variable "myawsprof" {
  default = "pennersm"
}
variable "def_key_path" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDTSQgnwos67EGuts4Cv4dLusCdoTcg21HQRSay3qn62ERdfBiq2JKUgf+zj/q+n9YnheY06ioE7jmtln3Cyspk/hFMPvTjphoj7Y8Wt2ftpw6yfszowUIZhhHynixJfnty/QVVUyBXi/w1qmwfeBSB5xvilRgHSrrYQRop2zOiyi24js9O+t9BvEjO1JdbpV2FogI11i5ayNhPgvrzSIdkG/HNLmSzfABFPcQdzFC/LfRQdGh0m80Y3JyR0cOau5eGitrIQd9YnPYbF/2/k0PMgbIhLPRqXATC43fFWXKNSWreFm/gMmUIJpdBYvPxTV6aiQ8F+QrpFD+oPrY6h6ov mpenners@AMSMAC10FNHTDG"
}
variable "myawsregion" {
  default = "eu-south-1"
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
