resource "aws_security_group" "my_security_group" {
  name        = format("%s-%s-sg1", var.project, var.env)
  description = "this will add a tf generated security group"
  region      = "ap-south-1"
  vpc_id      = aws_vpc.main.id
  
  #inbound rules
  dynamic "ingress" {
    for_each = var.inbound_rules
    content {
      to_port = ingress.value["to_port"]
      from_port = ingress.value["from_port"]
      cidr_blocks = ingress.value["cidr_blocks"]
      protocol = ingress.value["protocol"]
    }
  }

  #outbound rules
  dynamic "egress" {
    for_each = var.outbound_rules
    content {
      to_port = egress.value["to_port"]
      from_port = egress.value["from_port"]
      cidr_blocks = egress.value["cidr_blocks"]
      protocol = egress.value["protocol"]
    }
  }

}
