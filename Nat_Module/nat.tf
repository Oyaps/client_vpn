
# Elastic IP address for NAT Gateway
resource "aws_eip" "eip1" {

  vpc = true

  tags = {
    "Name" = "eip1"
  }
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {

  allocation_id = aws_eip.eip1.id
  subnet_id     = var.subnet_id

  tags = {
    "Name" = "natgw"
  }
}

resource "aws_route" "app_rt" {
  route_table_id         = var.route_table_id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}






