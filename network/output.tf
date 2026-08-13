output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.terraform_public_subnet.id
}

output "public_security_group_id" {
  value = aws_security_group.my_security_group.id
}