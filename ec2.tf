# key pair (login)
resource aws_key_pair terraform_key_pair{
    key_name = "terra_key_EC2"
    public_key = file("terra-key-ec2.pub")
}

# VPC & Security Group
resource aws_default_vpc default_vpc {
    
}

resource aws_security_group my_security_group {

    name = "automatesg"
    description = "this will add a tf generated security group"
    vpc_id = aws_default_vpc.default_vpc.id #interpolation
    
    #inbound rules
    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["172.17.224.1/32","125.99.53.122/32","136.232.247.226/32","152.52.54.98/32","27.107.114.198/32"]
    }

    ingress{
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["172.17.224.1/32"]
    }

    #outbound rules
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["125.99.53.122/32","136.232.247.226/32","152.52.54.98/32","27.107.114.198/32"]
       #zeus outogoing ips
    }
}

# eC2 instance
resource aws_instance my_instance {
    key_name = aws_key_pair.terraform_key_pair.key_name
    security_groups = [aws_security_group.my_security_group.name]
    instance_type = "t2.micro"
    ami = "ami-01a00762f46d584a1"
    root_block_device {
      volume_size = 15
      volume_type = "gp3"  
    }
    tags={
        name="terra_ec2_instance"
    }
}
