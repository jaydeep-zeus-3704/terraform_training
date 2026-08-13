module "network" {
  source = "./network"
  inbound_rules = {
    "http" = {
      to_port     = 80
      from_port   = 80
      cidr_blocks = ["172.17.224.1/32", "192.168.10.64/32", "192.168.17.89/32"]
      protocol    = "tcp"
    }
    "ssh" = {
      to_port     = 22
      from_port   = 22
      cidr_blocks = ["172.17.224.1/32", "125.99.53.122/32", "136.232.247.226/32", "152.52.54.98/32", "27.107.114.198/32"]
      protocol    = "tcp"
    }
  }
  outbound_rules = {
    "-1" = {
      to_port=0
      from_port=0
      cidr_blocks=["0.0.0.0/0"]
      protocol="tcp"
    }
  }
  vpc_cidr    = "10.0.0.0/16"
  project     = var.project
  env         = var.env
}