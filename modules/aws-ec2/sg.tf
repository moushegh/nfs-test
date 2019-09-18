resource aws_security_group public {
  name        = "${var.ec2_name} public"
  description = "security group for var.ec2_name public interface"
}

resource aws_security_group_rule allow_all_out_ec2 {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource aws_security_group_rule allow_ssh_in_ec2 {
  type              = "ingress"
  to_port           = 22
  protocol          = "tcp"
  from_port         = 22
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

##allow 443 since i reconfigured ssh to run under 443, thanks to corporate network
resource aws_security_group_rule allow_https_in_ec2 {
  type              = "ingress"
  to_port           = 443
  protocol          = "tcp"
  from_port         = 443
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.public.id
}

resource aws_security_group private {
  name        = "${var.ec2_name} private"
  description = "security group for var.ec2_name private interface"
}

resource aws_security_group_rule allow_all_out_internal {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = var.ec2_public_subnet_cidrs
  security_group_id = aws_security_group.private.id
}

resource aws_security_group_rule allow_all_in_internal {
  type              = "ingress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = var.ec2_public_subnet_cidrs
  security_group_id = aws_security_group.private.id
}
