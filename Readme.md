# Project 1
Automating infrastructure using Terraform

## Deliverables
  1. Launches an EC2 instance using Terraform
  2. Connects to the instance (ansible)
  3. Install Jenkins, Java and Python in the instance (ansible)

## Execution Steps
To get Deliverables, proceed as follows:

1. Create local directory and clone the repo
2. Edit the variables.tf file to suit your requirements
3. call terraform init
3. call terraform plan
4. call terraform apply

## Explanation
All deployment specific information can be centrally set in variables.tf
only terraform states to maintain the entire flow including the install
  - AWS provider to build the EC2 resources
  - required SW packages are installed via ansible to EC2
  - terraform should manage ansible calls from its variables.tf setting
  - terraform should manage ansible files and track status


### 3. calling terraform init
You should expect a similar output:

`[19:04:18][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]# terraform init`
``
`Initializing the backend...`
`Initializing provider plugins...`
`- Reusing previous version of hashicorp/aws from the dependency lock file`
`- Reusing previous version of scottwinkler/shell from the dependency lock file`
`- Reusing previous version of hashicorp/local from the dependency lock file`
`- Using previously-installed hashicorp/local v2.2.2`
`- Using previously-installed hashicorp/aws v4.7.0`
`- Using previously-installed scottwinkler/shell v1.7.10`
``
`Terraform has been successfully initialized!`
``
`You may now begin working with Terraform. Try running "terraform plan" to see`
`any changes that are required for your infrastructure. All Terraform commands`
`should now work.`
``
`If you ever set or change modules or backend configuration for Terraform,`
`rerun this command to reinitialize your working directory. If you forget, other`
`commands will detect it and remind you to do so if necessary.`
`[19:04:54][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]#`

### calling terraform plan

`[19:04:54][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]# terraform plan`
``
`Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:`
`  + create`
``
`Terraform will perform the following actions:`
``
`  # aws_instance.project1_inst will be created`
`  + resource "aws_instance" "project1_inst" {`
`      + ami                                  = "ami-0f8ce9c417115413d"`
`      + arn                                  = (known after apply)`
`      + associate_public_ip_address          = true`
`      + availability_zone                    = "eu-south-1a"`
`      + cpu_core_count                       = (known after apply)`
`      + cpu_threads_per_core                 = (known after apply)`
`      + disable_api_termination              = (known after apply)`
`      + ebs_optimized                        = (known after apply)`
`      + get_password_data                    = false`
`      + host_id                              = (known after apply)`
`      + id                                   = (known after apply)`
`      + instance_initiated_shutdown_behavior = (known after apply)`
`      + instance_state                       = (known after apply)`
`      + instance_type                        = "t3.micro"`
`      + ipv6_address_count                   = (known after apply)`
`      + ipv6_addresses                       = (known after apply)`
`      + key_name                             = (known after apply)`
`      + monitoring                           = (known after apply)`
`      + outpost_arn                          = (known after apply)`
`      + password_data                        = (known after apply)`
`      + placement_group                      = (known after apply)`
`      + placement_partition_number           = (known after apply)`
`      + primary_network_interface_id         = (known after apply)`
`      + private_dns                          = (known after apply)`
`      + private_ip                           = (known after apply)`
`      + public_dns                           = (known after apply)`
`      + public_ip                            = (known after apply)`
`      + secondary_private_ips                = (known after apply)`
`      + security_groups                      = (known after apply)`
`      + source_dest_check                    = true`
`      + subnet_id                            = (known after apply)`
`      + tags_all                             = (known after apply)`
`      + tenancy                              = (known after apply)`
`      + user_data                            = (known after apply)`
`      + user_data_base64                     = (known after apply)`
`      + user_data_replace_on_change          = false`
`      + vpc_security_group_ids               = (known after apply)`
``
`      + capacity_reservation_specification {`
`          + capacity_reservation_preference = (known after apply)`
``
`          + capacity_reservation_target {`
`              + capacity_reservation_id = (known after apply)`
`            }`
`        }`
``
`      + ebs_block_device {`
`          + delete_on_termination = (known after apply)`
`          + device_name           = (known after apply)`
`          + encrypted             = (known after apply)`
`          + iops                  = (known after apply)`
`          + kms_key_id            = (known after apply)`
`          + snapshot_id           = (known after apply)`
`          + tags                  = (known after apply)`
`          + throughput            = (known after apply)`
`          + volume_id             = (known after apply)`
`          + volume_size           = (known after apply)`
`          + volume_type           = (known after apply)`
`        }`
``
`      + enclave_options {`
`          + enabled = (known after apply)`
`        }`
``
`      + ephemeral_block_device {`
`          + device_name  = (known after apply)`
`          + no_device    = (known after apply)`
`          + virtual_name = (known after apply)`
`        }`
``
`      + metadata_options {`
`          + http_endpoint               = (known after apply)`
`          + http_put_response_hop_limit = (known after apply)`
`          + http_tokens                 = (known after apply)`
`          + instance_metadata_tags      = (known after apply)`
`        }`
``
`      + network_interface {`
`          + delete_on_termination = (known after apply)`
`          + device_index          = (known after apply)`
`          + network_interface_id  = (known after apply)`
`        }`
``
`      + root_block_device {`
`          + delete_on_termination = (known after apply)`
`          + device_name           = (known after apply)`
`          + encrypted             = (known after apply)`
`          + iops                  = (known after apply)`
`          + kms_key_id            = (known after apply)`
`          + tags                  = (known after apply)`
`          + throughput            = (known after apply)`
`          + volume_id             = (known after apply)`
`          + volume_size           = (known after apply)`
`          + volume_type           = (known after apply)`
`        }`
`    }`
``
`  # aws_internet_gateway.proj1_igw will be created`
`  + resource "aws_internet_gateway" "proj1_igw" {`
`      + arn      = (known after apply)`
`      + id       = (known after apply)`
`      + owner_id = (known after apply)`
`      + tags_all = (known after apply)`
`      + vpc_id   = (known after apply)`
`    }`
``
`  # aws_key_pair.proj1_key will be created`
`  + resource "aws_key_pair" "proj1_key" {`
`      + arn             = (known after apply)`
`      + fingerprint     = (known after apply)`
`      + id              = (known after apply)`
`      + key_name        = "id_proj1"`
`      + key_name_prefix = (known after apply)`
`      + key_pair_id     = (known after apply)`
`      + public_key      = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC6Fvt5RoVlb+/w+fS38iDG6kvZoT84nbMCNwnL+3jbTrU5F0PY0fYG+DVwMdJuiuLONe9VjqvEwkiinGqyRJGmcc60g3krhPcVSXTP6dtNsAPplmVC9SrrZAyVtdyj3B+CvrWDjFxCsFjzWV2Py0C2j2rioaRZh6JhDCimJBiKEuXZxjh6R8toXut6njOAVoJPfmpBN6TJIY/YZRpw21HCjy7m86kNMb2+laeEBzmqu5Nbw01z5OyNDi9fA0DFlSfahWZ2F1Tx7fWIPILj8pUZnYWofV2lHDAtjEonKDcRdTBOwXg5suJq4JqZIUCWAy52skh0VK2WNpkdM7KUEtlv mpenners@M-C02W10FNHTDG"`
`      + tags_all        = {`
`          + "Name"     = "proj1"`
`          + "Pipeline" = "devopsTrain-exe1-cipipe"`
`          + "Source"   = "devopsTrain-exe1-awstf"`
`        }`
`    }`
``
`  # aws_route_table.proj1_routes will be created`
`  + resource "aws_route_table" "proj1_routes" {`
`      + arn              = (known after apply)`
`      + id               = (known after apply)`
`      + owner_id         = (known after apply)`
`      + propagating_vgws = (known after apply)`
`      + route            = [`
`          + {`
`              + carrier_gateway_id         = ""`
`              + cidr_block                 = "0.0.0.0/0"`
`              + destination_prefix_list_id = ""`
`              + egress_only_gateway_id     = ""`
`              + gateway_id                 = (known after apply)`
`              + instance_id                = ""`
`              + ipv6_cidr_block            = ""`
`              + local_gateway_id           = ""`
`              + nat_gateway_id             = ""`
`              + network_interface_id       = ""`
`              + transit_gateway_id         = ""`
`              + vpc_endpoint_id            = ""`
`              + vpc_peering_connection_id  = ""`
`            },`
`        ]`
`      + tags_all         = (known after apply)`
`      + vpc_id           = (known after apply)`
`    }`
``
`  # aws_route_table_association.proj1_public will be created`
`  + resource "aws_route_table_association" "proj1_public" {`
`      + id             = (known after apply)`
`      + route_table_id = (known after apply)`
`      + subnet_id      = (known after apply)`
`    }`
``
`  # aws_security_group.proj1_sg will be created`
`  + resource "aws_security_group" "proj1_sg" {`
`      + arn                    = (known after apply)`
`      + description            = "To get access to EC2 instance"`
`      + egress                 = [`
`          + {`
`              + cidr_blocks      = [`
`                  + "0.0.0.0/0",`
`                ]`
`              + description      = ""`
`              + from_port        = 0`
`              + ipv6_cidr_blocks = []`
`              + prefix_list_ids  = []`
`              + protocol         = "-1"`
`              + security_groups  = []`
`              + self             = false`
`              + to_port          = 0`
`            },`
`        ]`
`      + id                     = (known after apply)`
`      + ingress                = [`
`          + {`
`              + cidr_blocks      = [`
`                  + "0.0.0.0/0",`
`                ]`
`              + description      = ""`
`              + from_port        = 22`
`              + ipv6_cidr_blocks = []`
`              + prefix_list_ids  = []`
`              + protocol         = "tcp"`
`              + security_groups  = []`
`              + self             = false`
`              + to_port          = 22`
`            },`
`          + {`
`              + cidr_blocks      = [`
`                  + "0.0.0.0/0",`
`                ]`
`              + description      = ""`
`              + from_port        = 8080`
`              + ipv6_cidr_blocks = []`
`              + prefix_list_ids  = []`
`              + protocol         = "tcp"`
`              + security_groups  = []`
`              + self             = false`
`              + to_port          = 8080`
`            },`
`          + {`
`              + cidr_blocks      = [`
`                  + "0.0.0.0/0",`
`                ]`
`              + description      = ""`
`              + from_port        = 80`
`              + ipv6_cidr_blocks = []`
`              + prefix_list_ids  = []`
`              + protocol         = "tcp"`
`              + security_groups  = []`
`              + self             = false`
`              + to_port          = 80`
`            },`
`        ]`
`      + name                   = "Project-1-EC2-SG"`
`      + name_prefix            = (known after apply)`
`      + owner_id               = (known after apply)`
`      + revoke_rules_on_delete = false`
`      + tags_all               = (known after apply)`
`      + vpc_id                 = (known after apply)`
`    }`
``
`  # aws_subnet.proj1_subnet will be created`
`  + resource "aws_subnet" "proj1_subnet" {`
`      + arn                                            = (known after apply)`
`      + assign_ipv6_address_on_creation                = false`
`      + availability_zone                              = "eu-south-1a"`
`      + availability_zone_id                           = (known after apply)`
`      + cidr_block                                     = "10.0.2.0/24"`
`      + enable_dns64                                   = false`
`      + enable_resource_name_dns_a_record_on_launch    = false`
`      + enable_resource_name_dns_aaaa_record_on_launch = false`
`      + id                                             = (known after apply)`
`      + ipv6_cidr_block_association_id                 = (known after apply)`
`      + ipv6_native                                    = false`
`      + map_public_ip_on_launch                        = false`
`      + owner_id                                       = (known after apply)`
`      + private_dns_hostname_type_on_launch            = (known after apply)`
`      + tags                                           = {`
`          + "Name" = "aws:subnet-10.0.2.0/24"`
`        }`
`      + tags_all                                       = {`
`          + "Name" = "aws:subnet-10.0.2.0/24"`
`        }`
`      + vpc_id                                         = (known after apply)`
`    }`
``
`  # aws_vpc.proj1_vpc will be created`
`  + resource "aws_vpc" "proj1_vpc" {`
`      + arn                                  = (known after apply)`
`      + cidr_block                           = "10.0.2.0/23"`
`      + default_network_acl_id               = (known after apply)`
`      + default_route_table_id               = (known after apply)`
`      + default_security_group_id            = (known after apply)`
`      + dhcp_options_id                      = (known after apply)`
`      + enable_classiclink                   = false`
`      + enable_classiclink_dns_support       = (known after apply)`
`      + enable_dns_hostnames                 = true`
`      + enable_dns_support                   = true`
`      + id                                   = (known after apply)`
`      + instance_tenancy                     = "default"`
`      + ipv6_association_id                  = (known after apply)`
`      + ipv6_cidr_block                      = (known after apply)`
`      + ipv6_cidr_block_network_border_group = (known after apply)`
`      + main_route_table_id                  = (known after apply)`
`      + owner_id                             = (known after apply)`
`      + tags                                 = {`
`          + "Name" = "aws:vpc-10.0.2.0/23"`
`        }`
`      + tags_all                             = {`
`          + "Name"     = "aws:vpc-10.0.2.0/23"`
`          + "Pipeline" = "devopsTrain-exe1-cipipe"`
`          + "Source"   = "devopsTrain-exe1-awstf"`
`        }`
`    }`
``
`  # local_file.ansible_inventory will be created`
`  + resource "local_file" "ansible_inventory" {`
`      + content              = (known after apply)`
`      + directory_permission = "0777"`
`      + file_permission      = "0644"`
`      + filename             = "./ansible/hosts"`
`      + id                   = (known after apply)`
`    }`
``
`  # shell_script.call_ansible will be created`
`  + resource "shell_script" "call_ansible" {`
`      + dirty             = false`
`      + environment       = {`
`          + "ANSIBLE_HOST_KEY_CHECKING" = "False"`
`          + "ANSIBLE_INVENTORY"         = "hosts"`
`          + "ANSIBLE_LOG_PATH"          = "current_ansible.log"`
`          + "ANSIBLE_PRIVATE_KEY_FILE"  = "/Users/mpenners/.aws/id_proj1"`
`          + "ANSIBLE_REMOTE_USER"       = "ubuntu"`
`        }`
`      + id                = (known after apply)`
`      + output            = (known after apply)`
`      + working_directory = "."`
``
`      + lifecycle_commands {`
`          + create = <<-EOT`
`                cd "./ansible/"`
`                rc="$(ansible-playbook ./proj1-tasks.yml >/dev/null 2>&1)$?"`
`                echo "{\"ansible_playbook_exit_status\": \"$rc\"}" > ./ansible_tf_stat.json`
`            EOT`
`          + delete = <<-EOT`
`                rm -f "ansible/current_ansible.log"`
`                rm -f "ansible/ansible_tf_stat.json"`
`            EOT`
`        }`
`    }`
``
`Plan: 10 to add, 0 to change, 0 to destroy.`
``
`Changes to Outputs:`
`  + ANSIBLE_INVENTORY        = "hosts"`
`  + ANSIBLE_LOG_PATH         = "current_ansible.log"`
`  + ANSIBLE_PRIVATE_KEY_FILE = "/Users/mpenners/.aws/id_proj1"`
`  + ANSIBLE_REMOTE_USER      = "ubuntu"`
`  + EC2_selected             = "ec2.eu-south-1.amazonaws.com"`
`  + account_id               = "350377495939"`
`  + ansible_tf_statfile      = "ansible_tf_stat.json"`
`  + caller_arn               = "arn:aws:iam::350377495939:root"`
`  + caller_user              = "350377495939"`
`  + instance-private-ip      = (known after apply)`
`  + instance-public-ip       = (known after apply)`
`  + region_selected          = "eu-south-1"`
``
`─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────`
``
`Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.`
`[19:05:05][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]# `


### calling terraform apply
when you apply the same plan will be presented as in the terraform plan step, because resources have not changed. After the plan is shown, you confirm again with yes to see how it is applied:

```
...
Plan: 10 to add, 0 to change, 0 to destroy.

Changes to Outputs:
  + ANSIBLE_INVENTORY        = "hosts"
  + ANSIBLE_LOG_PATH         = "current_ansible.log"
  + ANSIBLE_PRIVATE_KEY_FILE = "/Users/mpenners/.aws/id_proj1"
  + ANSIBLE_REMOTE_USER      = "ubuntu"
  + EC2_selected             = "ec2.eu-south-1.amazonaws.com"
  + account_id               = "350377495939"
  + ansible_tf_statfile      = "ansible_tf_stat.json"
  + caller_arn               = "arn:aws:iam::350377495939:root"
  + caller_user              = "350377495939"
  + instance-private-ip      = (known after apply)
  + instance-public-ip       = (known after apply)
  + region_selected          = "eu-south-1"

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

aws_key_pair.proj1_key: Creating...
aws_vpc.proj1_vpc: Creating...
aws_key_pair.proj1_key: Creation complete after 1s [id=id_proj1]
aws_vpc.proj1_vpc: Still creating... [10s elapsed]
aws_vpc.proj1_vpc: Creation complete after 13s [id=vpc-05612df4c222d694d]
aws_internet_gateway.proj1_igw: Creating...
aws_subnet.proj1_subnet: Creating...
aws_security_group.proj1_sg: Creating...
aws_subnet.proj1_subnet: Creation complete after 1s [id=subnet-070b4b78b5c6cef7b]
aws_internet_gateway.proj1_igw: Creation complete after 2s [id=igw-0785e46a6329d63ca]
aws_route_table.proj1_routes: Creating...
aws_route_table.proj1_routes: Creation complete after 1s [id=rtb-03d55edd00954bf79]
aws_route_table_association.proj1_public: Creating...
aws_security_group.proj1_sg: Creation complete after 3s [id=sg-086425972361b6ded]
aws_instance.project1_inst: Creating...
aws_route_table_association.proj1_public: Creation complete after 1s [id=rtbassoc-052688acf112be82e]
aws_instance.project1_inst: Still creating... [10s elapsed]
aws_instance.project1_inst: Creation complete after 13s [id=i-028fd83911b6fd05c]
local_file.ansible_inventory: Creating...
local_file.ansible_inventory: Creation complete after 0s [id=25837c83dc3c384ffdb5fe78b05b91186a9ab070]
shell_script.call_ansible: Creating...
shell_script.call_ansible: Still creating... [10s elapsed]
shell_script.call_ansible: Still creating... [20s elapsed]
shell_script.call_ansible: Still creating... [30s elapsed]
shell_script.call_ansible: Still creating... [40s elapsed]
shell_script.call_ansible: Still creating... [50s elapsed]
shell_script.call_ansible: Still creating... [1m0s elapsed]
shell_script.call_ansible: Still creating... [1m10s elapsed]
shell_script.call_ansible: Still creating... [1m20s elapsed]
shell_script.call_ansible: Still creating... [1m30s elapsed]
shell_script.call_ansible: Still creating... [1m40s elapsed]
shell_script.call_ansible: Still creating... [1m50s elapsed]
shell_script.call_ansible: Still creating... [2m0s elapsed]
shell_script.call_ansible: Still creating... [2m10s elapsed]
shell_script.call_ansible: Still creating... [2m20s elapsed]
shell_script.call_ansible: Still creating... [2m30s elapsed]
shell_script.call_ansible: Still creating... [2m40s elapsed]
shell_script.call_ansible: Creation complete after 2m44s [id=c92u6q2sahsnmsmhfpn0]

Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

ANSIBLE_INVENTORY = "hosts"
ANSIBLE_LOG_PATH = "current_ansible.log"
ANSIBLE_PRIVATE_KEY_FILE = "/Users/mpenners/.aws/id_proj1"
ANSIBLE_REMOTE_USER = "ubuntu"
EC2_selected = "ec2.eu-south-1.amazonaws.com"
account_id = "350377495939"
ansible_tf_statfile = "ansible_tf_stat.json"
caller_arn = "arn:aws:iam::350377495939:root"
caller_user = "350377495939"
instance-private-ip = "10.0.2.239"
instance-public-ip = "15.160.179.89"
region_selected = "eu-south-1"
```
`[19:22:48][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]`

### destroying the deployment
Due to our "loosely hooked" state synchronisation tf with ansible I suggest you try a few init-to-destroy cycles and check that no nods are created. At the end it should be like this:

```

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

shell_script.call_ansible: Destroying... [id=c92u6q2sahsnmsmhfpn0]
shell_script.call_ansible: Destruction complete after 0s
local_file.ansible_inventory: Destroying... [id=25837c83dc3c384ffdb5fe78b05b91186a9ab070]
local_file.ansible_inventory: Destruction complete after 0s
aws_route_table_association.proj1_public: Destroying... [id=rtbassoc-052688acf112be82e]
aws_instance.project1_inst: Destroying... [id=i-028fd83911b6fd05c]
aws_route_table_association.proj1_public: Destruction complete after 0s
aws_route_table.proj1_routes: Destroying... [id=rtb-03d55edd00954bf79]
aws_route_table.proj1_routes: Destruction complete after 1s
aws_internet_gateway.proj1_igw: Destroying... [id=igw-0785e46a6329d63ca]
aws_instance.project1_inst: Still destroying... [id=i-028fd83911b6fd05c, 10s elapsed]
aws_internet_gateway.proj1_igw: Still destroying... [id=igw-0785e46a6329d63ca, 10s elapsed]
aws_instance.project1_inst: Still destroying... [id=i-028fd83911b6fd05c, 20s elapsed]
aws_internet_gateway.proj1_igw: Still destroying... [id=igw-0785e46a6329d63ca, 20s elapsed]
aws_internet_gateway.proj1_igw: Destruction complete after 27s
aws_instance.project1_inst: Still destroying... [id=i-028fd83911b6fd05c, 30s elapsed]
aws_instance.project1_inst: Destruction complete after 30s
aws_key_pair.proj1_key: Destroying... [id=id_proj1]
aws_subnet.proj1_subnet: Destroying... [id=subnet-070b4b78b5c6cef7b]
aws_security_group.proj1_sg: Destroying... [id=sg-086425972361b6ded]
aws_key_pair.proj1_key: Destruction complete after 1s
aws_security_group.proj1_sg: Destruction complete after 1s
aws_subnet.proj1_subnet: Destruction complete after 1s
aws_vpc.proj1_vpc: Destroying... [id=vpc-05612df4c222d694d]
aws_vpc.proj1_vpc: Destruction complete after 0s

Destroy complete! Resources: 10 destroyed.
``

### verify the result

#### connect to the EC2 instance
Following information is required to connect to the EC2:
* You have the public IP of the EC2 instance in `ansible/hosts` or form the output of your apply Outputs.
* The public key for `ANSIBLE_PRIVATE_KEY_FILE` is the same key as pasted into `variables.tf` with `def_pub_key` variable
* The login name to connect with ssh depends on your AMI and is defined within `variables.tf`

##### connect via ssh
```
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

ANSIBLE_INVENTORY = "hosts"
ANSIBLE_LOG_PATH = "current_ansible.log"
ANSIBLE_PRIVATE_KEY_FILE = "/Users/mpenners/.aws/id_proj1"
ANSIBLE_REMOTE_USER = "ubuntu"
EC2_selected = "ec2.eu-south-1.amazonaws.com"
account_id = "350377495939"
ansible_tf_statfile = "ansible_tf_stat.json"
caller_arn = "arn:aws:iam::350377495939:root"
caller_user = "350377495939"
instance-private-ip = "10.0.2.239"
instance-public-ip = "15.160.179.89"
region_selected = "eu-south-1"
[19:22:48][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]# ssh ubuntu@15.160.179.89 -i /Users/mpenners/.aws/id_proj1
Welcome to Ubuntu 20.04.3 LTS (GNU/Linux 5.11.0-1020-aws x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Thu Mar 31 17:34:52 UTC 2022

  System load:  0.0               Processes:             105
  Usage of /:   30.3% of 7.69GB   Users logged in:       0
  Memory usage: 46%               IPv4 address for ens5: 10.0.2.239
  Swap usage:   0%


114 updates can be applied immediately.
69 of these updates are standard security updates.
To see these additional updates run: apt list --upgradable


*** System restart required ***
Last login: Thu Mar 31 17:22:47 2022 from 90.174.217.88
ubuntu@ip-10-0-2-239:~$
```

##### Check that SW is installed
```
ubuntu@ip-10-0-2-239:~$ java --version
openjdk 11.0.14.1 2022-02-08
OpenJDK Runtime Environment (build 11.0.14.1+1-Ubuntu-0ubuntu1.20.04)
OpenJDK 64-Bit Server VM (build 11.0.14.1+1-Ubuntu-0ubuntu1.20.04, mixed mode, sharing)
ubuntu@ip-10-0-2-239:~$ systemctl status jenkins
● jenkins.service - Jenkins Continuous Integration Server
     Loaded: loaded (/lib/systemd/system/jenkins.service; enabled; vendor preset: enabled)
     Active: active (running) since Thu 2022-03-31 17:22:38 UTC; 12min ago
   Main PID: 12020 (java)
      Tasks: 35 (limit: 1124)
     Memory: 304.9M
     CGroup: /system.slice/jenkins.service
             └─12020 /usr/bin/java -Djava.awt.headless=true -jar /usr/share/java/jenkins.war --webroot=/var/cache/jenkins/war --httpPort=8080

Mar 31 17:22:08 ip-10-0-2-239 jenkins[12020]: This may also be found at: /var/lib/jenkins/secrets/initialAdminPassword
Mar 31 17:22:08 ip-10-0-2-239 jenkins[12020]: *************************************************************
Mar 31 17:22:08 ip-10-0-2-239 jenkins[12020]: *************************************************************
Mar 31 17:22:08 ip-10-0-2-239 jenkins[12020]: *************************************************************
Mar 31 17:22:38 ip-10-0-2-239 jenkins[12020]: 2022-03-31 17:22:38.248+0000 [id=30]        INFO        jenkins.InitReactorRunner$1#onAttained: Completed initialization
Mar 31 17:22:38 ip-10-0-2-239 jenkins[12020]: 2022-03-31 17:22:38.264+0000 [id=22]        INFO        hudson.lifecycle.Lifecycle#onReady: Jenkins is fully up and running
Mar 31 17:22:38 ip-10-0-2-239 systemd[1]: Started Jenkins Continuous Integration Server.
Mar 31 17:22:38 ip-10-0-2-239 jenkins[12020]: 2022-03-31 17:22:38.567+0000 [id=46]        INFO        h.m.DownloadService$Downloadable#load: Obtained the updated data file for hudson.ta>
Mar 31 17:22:38 ip-10-0-2-239 jenkins[12020]: 2022-03-31 17:22:38.568+0000 [id=46]        INFO        hudson.util.Retrier#start: Performed the action check updates server successfully a>
Mar 31 17:22:38 ip-10-0-2-239 jenkins[12020]: 2022-03-31 17:22:38.574+0000 [id=46]        INFO        hudson.model.AsyncPeriodicWork#lambda$doRun$1: Finished Download metadata. 30,920 ms
ubuntu@ip-10-0-2-239:~$  
```
##### Verify jenkins is reachable

Connect the EC2 public IP with your browser on port 8080


##### look into the ansible log
under the ansible directory you find a current ansible installation log (filename from variables.tf ansible_log). This file will remain until terraform destroy removes the shell_script resource, hence it represents a status of where tf expects this to be installed or not. This seems a very loose hook.

```
[19:43:31][mpenners@M-C02W10FNHTDG][devopsTrain-exe1-awstf]# cd ansible
[19:43:37][mpenners@M-C02W10FNHTDG][ansible]# ll
total 48
8 -rw-r--r--@  1 mpenners  192360288    26 Mar 29 15:22 inventory.tmpl
8 -rw-r--r--@  1 mpenners  192360288   119 Mar 31 17:07 ansible.cfg
8 -rw-r--r--@  1 mpenners  192360288  1494 Mar 31 17:13 proj1-tasks.yml
8 -rw-r--r--@  1 mpenners  192360288    28 Mar 31 19:20 hosts
8 -rw-r--r--@  1 mpenners  192360288  2685 Mar 31 19:22 current_ansible.log
0 drwxr-xr-x@  8 mpenners  192360288   256 Mar 31 19:22 .
8 -rw-r--r--@  1 mpenners  192360288    38 Mar 31 19:22 ansible_tf_stat.json
0 drwxr-xr-x@ 16 mpenners  192360288   512 Mar 31 19:22 ..
[19:43:39][mpenners@M-C02W10FNHTDG][ansible]# cat current_ansible.log
2022-03-31 19:20:05,355 p=97159 u=mpenners n=ansible | PLAY [Install proj1 requirements] **********************************************
2022-03-31 19:20:05,378 p=97159 u=mpenners n=ansible | TASK [Wait timeout seconds for EC2 to have SSH up] *****************************
2022-03-31 19:20:15,066 p=97159 u=mpenners n=ansible | ok: [15.160.179.89]
2022-03-31 19:20:15,075 p=97159 u=mpenners n=ansible | TASK [install ubuntu repo packages] ********************************************
2022-03-31 19:20:32,423 p=97159 u=mpenners n=ansible | changed: [15.160.179.89] => (item=net-tools)
2022-03-31 19:20:47,123 p=97159 u=mpenners n=ansible | changed: [15.160.179.89] => (item=openjdk-11-jre-headless)
2022-03-31 19:20:52,313 p=97159 u=mpenners n=ansible | ok: [15.160.179.89] => (item=python3)
2022-03-31 19:21:24,948 p=97159 u=mpenners n=ansible | changed: [15.160.179.89] => (item=pip)
2022-03-31 19:21:24,964 p=97159 u=mpenners n=ansible | TASK [Configure FW add TCP] ****************************************************
2022-03-31 19:21:27,989 p=97159 u=mpenners n=ansible | changed: [15.160.179.89] => (item=22)
2022-03-31 19:21:30,198 p=97159 u=mpenners n=ansible | changed: [15.160.179.89] => (item=80)
2022-03-31 19:21:33,234 p=97159 u=mpenners n=ansible | changed: [15.160.179.89] => (item=8080)
2022-03-31 19:21:33,247 p=97159 u=mpenners n=ansible | TASK [Set FW logging] **********************************************************
2022-03-31 19:21:37,326 p=97159 u=mpenners n=ansible | changed: [15.160.179.89]
2022-03-31 19:21:37,333 p=97159 u=mpenners n=ansible | TASK [verify existing Jenkins apt key] *****************************************
2022-03-31 19:21:40,578 p=97159 u=mpenners n=ansible | changed: [15.160.179.89]
2022-03-31 19:21:40,585 p=97159 u=mpenners n=ansible | TASK [verify Jenkins Repo is added] ********************************************
2022-03-31 19:21:51,677 p=97159 u=mpenners n=ansible | changed: [15.160.179.89]
2022-03-31 19:21:51,684 p=97159 u=mpenners n=ansible | TASK [verify jenkins is installed] *********************************************
2022-03-31 19:22:42,472 p=97159 u=mpenners n=ansible | changed: [15.160.179.89]
2022-03-31 19:22:42,480 p=97159 u=mpenners n=ansible | TASK [ensure jenkins is running] ***********************************************
2022-03-31 19:22:48,299 p=97159 u=mpenners n=ansible | ok: [15.160.179.89]
2022-03-31 19:22:48,314 p=97159 u=mpenners n=ansible | PLAY RECAP *********************************************************************
2022-03-31 19:22:48,314 p=97159 u=mpenners n=ansible | 15.160.179.89              : ok=8    changed=6    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
[19:43:52][mpenners@M-C02W10FNHTDG][ansible]#
```
