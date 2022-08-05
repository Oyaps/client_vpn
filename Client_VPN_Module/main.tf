resource "aws_ec2_client_vpn_endpoint" "mars_vpn_endpoint" {
  description            = "project mars client vpn endpoint"
  server_certificate_arn = var.server_certificate_arn
  client_cidr_block      = var.client_cidr_block
  vpc_id     = var.vpc_id
  connection_log_options {
    enabled = false
  }

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = var.server_certificate_arn
  }
    
}

resource "aws_ec2_client_vpn_network_association" "mars_vpn_association" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.mars_vpn_endpoint.id
  subnet_id = var.subnet_id

    timeouts {
    create = "20m"
    delete = "20m"
  }
}

resource "aws_ec2_client_vpn_route" "mars_vpn_endpoint_rt" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.mars_vpn_endpoint.id
  destination_cidr_block = var.internet_cidr_block
  target_vpc_subnet_id   = var.target_vpc_subnet_id
    timeouts {
    create = "20m"
    delete = "20m"
  }
  
}

resource "aws_ec2_client_vpn_authorization_rule" "client_vpn_vpc_authorization" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.mars_vpn_endpoint.id
  target_network_cidr    = var.vpc_cidr_block
  authorize_all_groups   = true

    timeouts {
    create = "20m"
    delete = "20m"
  }
}

resource "aws_ec2_client_vpn_authorization_rule" "client_vpn_internet_authorization" {
  client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.mars_vpn_endpoint.id
  target_network_cidr    = var.internet_cidr_block
  authorize_all_groups   = true

    timeouts {
    create = "20m"
    delete = "20m"
  }
}