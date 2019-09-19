data aws_vpc main {
  id = var.vpc_id
}

data aws_subnet_ids public {
  vpc_id = var.vpc_id
  tags = {
    Role = "Public*"
  }
}

data aws_subnet_ids private {
  vpc_id = var.vpc_id
  tags = {
    Role = "Private*"
  }
}

data aws_route53_zone selected  {
  name         = "virtyhost.com."
}

data  aws_subnet public_subnets {
  count = length(data.aws_subnet_ids.public.ids)
  id    = tolist(data.aws_subnet_ids.public.ids)[count.index]
}

data aws_subnet private_subnets {
  count = length(data.aws_subnet_ids.private.ids)
  id    = tolist(data.aws_subnet_ids.private.ids)[count.index]
}

output subnet_public_cidr_blocks {
  value = [data.aws_subnet.public_subnets.*.cidr_block]
}

output subnet_private_cidr_blocks {
  value = [data.aws_subnet.private_subnets.*.cidr_block]
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

output zone_id {
  value = data.aws_route53_zone.selected.id
}

output zone_name {
  value = data.aws_route53_zone.selected.name
}