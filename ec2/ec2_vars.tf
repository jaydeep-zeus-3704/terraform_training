variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "project" {
   type = string
}
variable "key_name" {
   type = string
}



variable "ami" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "vpc_security_group_ids" {
  type = list(string)
}

variable "env" {
  type = string
}