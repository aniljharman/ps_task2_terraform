variable "aws_region"         { default = "us-east-1" }
variable "vpc_cidr"           { default = "10.50.0.0/16" }
variable "public_subnet_cidrs" {
  default = ["10.50.1.0/24", "10.50.2.0/24"]
}
variable "instance_type"      { default = "t3.micro" }
variable "allowed_ssh_cidr"   { default = "203.0.113.0/32" } # Change to your IP
variable "state_bucket"       { type = string }
variable "lock_table"         { type = string }
