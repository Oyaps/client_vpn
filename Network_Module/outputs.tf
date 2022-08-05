

output "vpc_id" {
  value = aws_vpc.canditude_vpc.id
}

output "subnet_map" {
  value = {
    web = aws_subnet.web_tier
    app = aws_subnet.app_tier
  }
}

output "app_route_table_id" {
  value = aws_route_table.app_rt.id
}



