

variable "vpc_id" {
  type        = string
  description = "VPC ID for nat gateway"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID for Nat gateway"
}

variable "route_table_id" {
  type        = string
  description = "Route table ID for app"
}


