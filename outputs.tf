
output "instance-private-ip" {
  value = aws_instance.project1_inst.private_ip
}

output "instance-public-ip" {
  value = aws_instance.project1_inst.public_ip
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

output "region_selected" {
  value = data.aws_region.current.name
}
output "EC2_selected" {
  value = data.aws_region.current.endpoint
}
#---------------------------------------------------
