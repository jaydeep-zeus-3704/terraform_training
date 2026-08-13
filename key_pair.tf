# key pair (login)
resource "aws_key_pair" "terraform_key_pair" {
  key_name   = "terra_key_ec2"
  public_key = file("terra-key-ec2.pub")
}
