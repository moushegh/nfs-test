resource aws_ebs_volume sec_ebs {
  count             = var.sec_ebs ? 1 : 0
  availability_zone = aws_instance.ec2.availability_zone
  encrypted         = true
  size              = 10

  tags = {
    Name = var.ec2_name
  }
}

resource "aws_volume_attachment" "ebs_ec2" {
  count       = var.sec_ebs ? 1 : 0
  device_name = "/dev/sdx"
  volume_id   = aws_ebs_volume.sec_ebs.0.id
  instance_id = aws_instance.ec2.id
}
