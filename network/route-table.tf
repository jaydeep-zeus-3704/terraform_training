resource "aws_route_table" "terraform_route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  
  tags = {
    Name = format("%s-%s-%s-rt", var.project, var.env, aws_subnet.terraform_public_subnet.id)
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.terraform_public_subnet.id
  route_table_id = aws_route_table.terraform_route_table.id
}