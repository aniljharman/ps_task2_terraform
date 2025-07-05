variable "instance_type"   { default = "t3.micro" }
variable "vpc_cidr"        { default = "10.50.0.0/16" }
variable "public_subnets"  { default = ["10.50.1.0/24", "10.50.2.0/24"] }
variable "ssh_cidr"        { default = "203.0.113.0/32" } # ← replace with your IP
