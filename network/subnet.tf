resource "aws_subnet" "terraform_public_subnet" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  region                  = "ap-south-1"
  map_public_ip_on_launch = true

  tags = {
    Name = format("%s-%s-subnet",var.project,var.env)
  }
}

resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = format("%s-%s-igw",var.project,var.env)
  }
}