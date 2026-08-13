

output "ec2_instance_public_ip" {
  value = {
       for key in toset(["nonprod","prod"]):
            key=>module.ec2[key].ec2_instance_public_ip
  }
}

output "ec2_instance_private_ip" {
  value = {
       for key in toset(["nonprod","prod"]):
            key=>module.ec2[key].ec2_instance_private_ip
  }
}