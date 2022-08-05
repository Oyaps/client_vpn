


variable "region" {
  default     = "ap-southeast-2"
  type        = string
  description = "Region of the VPC"
}

variable "vpc_id" {
  default     = "aws_vpc.canditude_vpc.id"
  type        = string
  description = "My VPC ID"

}

variable "vpc_cidr_block" {
  default     = "10.76.0.0/16"
  type        = string
  description = "CIDR block for the VPC"
}

variable "web_subnet_cidr_map" {
  type        = map(any)
  description = "Map of availability zones with their cidr blocks in the web tier"

}

variable "app_subnet_cidr_map" {
  type        = map(any)
  description = "Map of availability zones with their cidr blocks in the app tier"

}
