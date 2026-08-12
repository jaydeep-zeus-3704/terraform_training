resource "aws_security_group" "my_security_group" {
  name        = format("%s-%s-sg1",var.project,var.env)
  description = "this will add a tf generated security group"
  region = "ap-south-1"
  vpc_id      = aws_vpc.main.id
  #inbound rules
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ingress_ssh_cidr
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.ingress_http_cidr
  }

  #outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    #zeus outogoing ips
  }
}
