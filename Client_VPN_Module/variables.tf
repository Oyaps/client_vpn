variable "server_certificate_arn" {
  type        = string
  description = "Server Certificate ARN. Get it from ACM or create one if it is not available."
}

variable "client_certificate_arn" {
  type        = string
  description = "Client Certificate ARN. Get it from ACM or create one if it is not available."
}

variable "vpc_id" {
  type = string
  description = "VPC ID"
}

variable "security_groups" {
  type = list
}

variable "subnet_id" {
  type = string
  description = "Subnet ID"
}

variable "target_vpc_subnet_id" {
  type = string
  description = "Target VPC Subnet ID"
}

variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR Block"
}

variable "internet_cidr_block" {
  type = string
  description = "Internet CIDR Block"
}

variable "client_cidr_block" {
  type = string
  description = "Client CIDR Block"
}