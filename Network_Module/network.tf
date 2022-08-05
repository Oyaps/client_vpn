

# VPC
resource "aws_vpc" "canditude_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    "Name" = "canditude_vpc"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "canditude_igw" {
  vpc_id = aws_vpc.canditude_vpc.id
}

# Subnets
# Web Tier
resource "aws_subnet" "web_tier" {
  for_each = var.web_subnet_cidr_map

  vpc_id                  = aws_vpc.canditude_vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    "Name" = "webtier"
  }
}

# App Tier
resource "aws_subnet" "app_tier" {
  for_each = var.app_subnet_cidr_map

  vpc_id                  = aws_vpc.canditude_vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    "Name" = "app_tier"
  }
}



# Route Tables
# Route Table for Web Tier
resource "aws_route_table" "web_rt" {
  vpc_id = aws_vpc.canditude_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.canditude_igw.id
  }

  tags = {
    Name = "webrt"
  }
}

# Route Table for App Tier
resource "aws_route_table" "app_rt" {
  vpc_id = aws_vpc.canditude_vpc.id

  tags = {
    Name = "apprt"
  }
}

resource "aws_route_table_association" "app_rt_association" {
  for_each       = aws_subnet.app_tier
  subnet_id      = each.value.id
  route_table_id = aws_route_table.app_rt.id

}

resource "aws_route_table_association" "web_rt_association" {
  for_each       = aws_subnet.web_tier
  subnet_id      = each.value.id
  route_table_id = aws_route_table.web_rt.id

}




# # Route for Web Tier
# resource "aws_route" "web_route" {
#   count = length(var.web_tier_subnet_cidr_blocks)

#   route_table_id         = aws_route_table.web_rt[count.index].id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.canditude_igw.id
# }

# # Route Table for App Tier
# resource "aws_route_table" "app_rt" {
#   vpc_id = var.vpc_id

#   route = {
#     count          = length(var.app_tier_subnet_cidr_blocks)
#     cidr_block     = "0.0.0.0/0"
#     nat_gateway_id = aws_nat_gateway.nat_gw[count.index].id

#     tags = {
#       Name = "apprt"
#     }
#   }
# }

# # Route for App Tier
# resource "aws_route" "app_route" {
#   count = length(var.app_tier_subnet_cidr_blocks)

#   route_table_id         = aws_route_table.app_rt[count.index].id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id         = aws_nat_gateway.nat_gw[count.index].id
# }

# Route Table Associations
# RT Association for Web Tier








