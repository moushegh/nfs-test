variable server2_type {}
variable server2_ami {}
variable server2_name {}


module "nfs_server2" {
  source = "./modules/aws-ec2/"
  ec2_type = var.server2_type
  ec2_ami  = var.server2_ami
  ec2_name = var.server2_name
  ec2_public_subnet_id  = "${element(data.aws_subnet_ids.public.ids.*, 0)}"
  ec2_private_subnet_id = "${element(data.aws_subnet_ids.private.ids.*,0)}"
  ec2_public_subnet_cidrs = data.aws_subnet.private_subnets.*.cidr_block
  ec2_ssh_key_name = var.ssh_key_name

}
