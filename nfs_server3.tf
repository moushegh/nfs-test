variable server3_type {}
variable server3_ami {}
variable server3_name {}


module "nfs_server3" {
  source = "./modules/aws-ec2/"
  ec2_type = var.server3_type
  ec2_ami  = var.server3_ami
  ec2_name = var.server3_name
  ec2_subnet_id  = "${element(data.aws_subnet_ids.public.ids.*, 0)}"
  ec2_public_subnet_cidrs = data.aws_subnet.private_subnets.*.cidr_block
  ec2_ssh_key_name = var.ssh_key_name

}
