resource "aws_subnet" "terraform_public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.subnet_id
  map_public_ip_on_launch = true
  tags = {
    Name = format("%s-%s-subnet",var.project,var.env)
  }
}

