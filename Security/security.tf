
resource "aws_network_acl" "nacl" {
  vpc_id = var.vpc_id

  egress {
    # description = "Allows web traffic"
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80

  }
  egress {
    # description = "Allows web traffic"
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  egress {
    # description = "Allows SSH"
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  egress {
    # description = "Allows traffic from emphemeral ports"
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  ingress {
    # description = "Allows web traffic"
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    # description = "Allows web traffic"
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  ingress {
    # description = "Allows SSH"
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    # description = "Allows traffic from emphemeral ports"
    protocol   = "tcp"
    rule_no    = 400
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  tags = {
    Name = "nacl"
  }
}

resource "aws_network_acl_association" "naclassociation_web" {
  for_each       = var.subnet_map.web
  network_acl_id = aws_network_acl.nacl.id
  subnet_id      = each.value.id
}

resource "aws_network_acl_association" "naclassociation_app" {
  for_each       = var.subnet_map.app
  network_acl_id = aws_network_acl.nacl.id
  subnet_id      = each.value.id
}




# resource "aws_network_acl" "AppNACL" {
#   vpc_id = var.vpc_id

#   egress {
#     # description = "Allows web traffic"
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 80
#     to_port    = 80
#   }

#   egress {
#     # description = "Allows web traffic"
#     protocol   = "tcp"
#     rule_no    = 200
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 443
#     to_port    = 443
#   }

#   egress {
#     # description = "Allows traffic from emphemeral ports"
#     protocol   = "tcp"
#     rule_no    = 300
#     action     = "allow"
#     cidr_block = "0.0.0.0/0"
#     from_port  = 1024
#     to_port    = 65535
#   }

#   ingress {
#     # description = "Allows SSH"
#     protocol   = "tcp"
#     rule_no    = 100
#     action     = "allow"
#     cidr_block = "10.76.0.0/24"
#     from_port  = 22
#     to_port    = 22
#   }
#   ingress {
#     # description = "Allows SSH"
#     protocol   = "tcp"
#     rule_no    = 200
#     action     = "allow"
#     cidr_block = "10.76.64.0/24"
#     from_port  = 22
#     to_port    = 22
#   }
#   ingress {
#     # description = "Allows application traffic"
#     protocol   = "tcp"
#     rule_no    = 300
#     action     = "allow"
#     cidr_block = "10.76.0.0/24"
#     from_port  = 3000
#     to_port    = 3010
#   }
#   ingress {
#     # description = "Allows application traffic"
#     protocol   = "tcp"
#     rule_no    = 400
#     action     = "allow"
#     cidr_block = "10.76.64.0/24"
#     from_port  = 3000
#     to_port    = 3010
#   }
#   ingress {
#     # description = "Allows application traffic"
#     protocol   = "tcp"
#     rule_no    = 500
#     action     = "allow"
#     cidr_block = "10.76.0.0/24"
#     from_port  = 4000
#     to_port    = 4010
#   }
#   ingress {
#     # description = "Allows application traffic"
#     protocol   = "tcp"
#     rule_no    = 600
#     action     = "allow"
#     cidr_block = "10.76.64.0/24"
#     from_port  = 4000
#     to_port    = 4010
#   }
#   ingress {
#     # description = "Allows application traffic"
#     protocol   = "tcp"
#     rule_no    = 700
#     action     = "allow"
#     cidr_block = "10.76.0.0/24"
#     from_port  = 5000
#     to_port    = 5010
#   }
#   ingress {
#     # description = "Allows application traffic"
#     protocol   = "tcp"
#     rule_no    = 800
#     action     = "allow"
#     cidr_block = "10.76.64.0/24"
#     from_port  = 5000
#     to_port    = 5010
#   }

#   ingress {
#     # description = "Allows traffic from emphemeral ports"
#     protocol   = "tcp"
#     rule_no    = 900
#     action     = "allow"
#     cidr_block = "10.76.0.0/24"
#     from_port  = 1024
#     to_port    = 65535
#   }

#   ingress {
#     # description = "Allows traffic from emphemeral ports"
#     protocol   = "tcp"
#     rule_no    = 1000
#     action     = "allow"
#     cidr_block = "10.76.64.0/24"
#     from_port  = 1024
#     to_port    = 65535
#   }

#   tags = {
#     Name = "AppNACL"
#   }
# }

# resource "aws_network_acl_association" "AppNACLAssociation1" {
#   network_acl_id = aws_network_acl.AppNACL.id
#   subnet_id      = var.subnet_map.app.id
# }


resource "aws_security_group" "WebSG" {
  name        = "Web SG"
  description = "Web Tier Security Group"
  vpc_id      = var.vpc_id

  ingress {
    # description = "Allows web traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # description = "Allows web traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    # description = "Allows SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    # description = "Allows SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    # description = "Allows web traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    # description = "Allows web traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSG"
  }
}

resource "aws_security_group" "AppSG" {
  name        = "App SG"
  description = "App Tier Security Group"
  vpc_id      = var.vpc_id

  ingress {
    # description = "Allows application traffic"
    from_port   = 3000
    to_port     = 3010
    protocol    = "tcp"
    cidr_blocks = ["10.76.0.0/24", "10.76.64.0/24"]
  }
  ingress {
    # description = "Allows application traffic"
    from_port   = 4000
    to_port     = 4010
    protocol    = "tcp"
    cidr_blocks = ["10.76.0.0/24", "10.76.64.0/24"]
  }
  ingress {
    # description = "Allows application traffic"
    from_port   = 5000
    to_port     = 5010
    protocol    = "tcp"
    cidr_blocks = ["10.76.0.0/24", "10.76.64.0/24"]
  }
  ingress {
    # description = "Allows SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.76.0.0/16"]
  }

  egress {
    # description = "Allows web traffic"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.76.0.0/24", "10.76.64.0/24"]
  }
  egress {
    # description = "Allows web traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.76.0.0/24", "10.76.64.0/24"]
  }

  tags = {
    Name = "AppSG"
  }
}
