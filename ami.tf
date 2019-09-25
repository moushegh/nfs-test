data aws_ami image {
  most_recent      = true
  owners           = ["self", "309956199498"]

  filter {
    name   = "name"
    values = ["RHEL-7*"]
  }
}

output ami_used {
  value =  data.aws_ami.image.id
}
