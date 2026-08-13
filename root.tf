locals {
  environments = {
    nonprod = {
      cidr = "10.10.0.0/16"
      subnet_id="10.10.1.0/24"
    }
    prod = {
      cidr = "10.20.0.0/16"
      subnet_id="10.20.1.0/24"
    }
  }
}


module "network" {
  for_each = local.environments
  source = "./network"
  inbound_rules = var.inbound_rules
  outbound_rules = var.outbound_rules
  vpc_cidr = each.value.cidr
  project  = var.project
  env      = each.key
  subnet_id = each.value.subnet_id
}


module "ec2" {
  for_each = local.environments
  source = "./ec2"
  ami = "ami-01a00762f46d584a1"
  instance_type = "t2.micro"
  project = var.project
  env = each.key
  subnet_id = module.network[each.key].public_subnet_id
  vpc_security_group_ids=[module.network[each.key].public_security_group_id]
  key_name = aws_key_pair.terraform_key_pair.key_name
}