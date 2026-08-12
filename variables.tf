variable "instance_type"{
    type = string
}

variable "vpc_name" {
   type = string
}



variable "route_table_name"{
    type = string
}

variable "ingress_ssh_cidr"{
    type = list(string )
}

variable "ingress_http_cidr" {
  type = list(string )
}

variable "subnet_name" {
  type = string
}

variable "env" {
  type = string
}

variable "project" {
  type = string
}

variable "vpc_cidr" {
  type = string
}