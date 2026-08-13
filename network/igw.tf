resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-%s-igw",var.project,var.env)
  }
}