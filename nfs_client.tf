variable client_type {}
variable client_ami {}
variable client_name {}

module "nfs_client" {
  source                  = "./modules/aws-ec2/"
  ec2_type                = var.client_type
  ec2_ami                 = var.client_ami
  ec2_name                = var.client_name
  ec2_public_subnet_id    = "${element(data.aws_subnet_ids.public.ids.*, 0)}"
  ec2_private_subnet_id   = "${element(data.aws_subnet_ids.private.ids.*, 0)}"
  ec2_public_subnet_cidrs = data.aws_subnet.private_subnets.*.cidr_block
  ec2_ssh_key_name        = var.ssh_key_name
  zone_name               = data.aws_route53_zone.selected.name
  zone_id                 = data.aws_route53_zone.selected.id
  source_security_group_id = aws_security_group.gluster.id

}
