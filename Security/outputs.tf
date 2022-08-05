
output "SG_map" {
  value = {
    web = aws_security_group.WebSG
    app = aws_security_group.AppSG
  }

}

