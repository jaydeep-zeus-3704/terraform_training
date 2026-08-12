# key pair (login)
resource "aws_key_pair" "terraform_key_pair" {
  key_name   = "terra_key_ec2"
  public_key = file("terra-key-ec2.pub")
}




# eC2 instance
resource "aws_instance" "my_instance" {
  subnet_id = aws_subnet.terraform_public_subnet.id
  key_name        = aws_key_pair.terraform_key_pair.key_name
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  instance_type   = var.instance_type
  ami             = "ami-01a00762f46d584a1"
  user_data       = file("install_nginx.sh")
  root_block_device {
    volume_size = 15
    volume_type = "gp3"
  }
  tags = {
    Name = format("%s-%s-ec2",var.project,var.env)
  }
}
