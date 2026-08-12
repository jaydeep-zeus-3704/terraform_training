variable "instance_type" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "route_table_name" {
  type = string
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
variable "inbound_rules" {
   type = map(object({
       from_port=number
       to_port=number
       protocol=string
       cidr_blocks=list(string) 
   }))   
}