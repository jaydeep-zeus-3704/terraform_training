

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

variable "outbound_rules" {
    type = map(object({
       from_port =number
       to_port=number
       protocol=string
       cidr_blocks=list(string) 
    }))
}


variable "project" {
  type = string
}

variable "env" {
  type = string
}