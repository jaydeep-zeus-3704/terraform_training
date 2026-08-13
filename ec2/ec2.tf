
# EC2 instance
resource "aws_instance" "my_instance" {
  subnet_id              = var.subnet_id
  key_name               = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  instance_type          = var.instance_type
  ami                    = var.ami
  user_data              = file("${path.module}/install_nginx.sh")
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
  tags = {
    Name = format("%s-%s-ec2", var.project,var.env)
  }
}
