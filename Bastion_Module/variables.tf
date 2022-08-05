variable "ami" {
  default     = "ami-0646b10ec20a40c81"
  type        = string
  description = "AMI ID"
}

variable "instance_type" {
  default     = "t2.micro"
  type        = string
  description = "Instance type"
}

variable "subnet_id" {
  type        = string
  description = "subnet id for bastion host"
}

variable "security_group_id_list" {
  type        = list(string)
  description = "security group for bastion host"
}
