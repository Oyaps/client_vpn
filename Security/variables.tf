variable "vpc_id" {
  type        = string
  description = "The VPC for security groups"

}

variable "subnet_map" {
  type        = map(any)
  description = "The subnet ID for security"
}

