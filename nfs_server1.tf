variable server1_type {}
variable server1_ami {}
variable server1_name {}


module "nfs_server1" {
  source = "./modules/aws-ec2/"
  ec2_type = var.server1_type
  ec2_ami  = var.server1_ami
  ec2_name = var.server1_name
  ec2_subnet_id  = "${element(data.aws_subnet_ids.public.ids.*, 0)}"
  ec2_public_subnet_cidrs = data.aws_subnet.private_subnets.*.cidr_block
  ec2_ssh_key_name = var.ssh_key_name

}
