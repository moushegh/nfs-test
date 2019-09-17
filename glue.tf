data "aws_vpc" "main" {
  id = var.vpc_id
}

data "aws_subnet_ids" "public" {
  vpc_id = var.vpc_id
  tags = {
    Role = "Public*"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = var.vpc_id
  tags = {
    Role = "Private*"
  }
}

output default_vpc {
  value = data.aws_vpc.main.id
}

output public_subs {
  value = data.aws_subnet_ids.public.ids
}

output private_subs {
  value = data.aws_subnet_ids.private.ids
}