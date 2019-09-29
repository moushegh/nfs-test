data aws_ami image {
  most_recent      = true
  owners           = ["self", "309956199498", "aws-marketplace"]

  filter {
    name   = "product-code"
    values = ["aw0evgkw8e5c1q413zgy5pjce"]
  }
}

output ami_used {
  value =  data.aws_ami.image.id
}
