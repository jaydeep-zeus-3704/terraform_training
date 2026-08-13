resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = format("terraform_vpc_%s",var.env)
  }
}