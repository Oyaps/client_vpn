
module "network" {
  source         = "../Network_Module"
  vpc_id         = "aws_vpc.canditude_vpc.id"
  vpc_cidr_block = "10.76.0.0/16"
  web_subnet_cidr_map = {
    ap-southeast-2a = "10.76.0.0/24"
    ap-southeast-2b = "10.76.64.0/24"
  }
  app_subnet_cidr_map = {
    ap-southeast-2a = "10.76.128.0/24"
    ap-southeast-2b = "10.76.192.0/24"
  }

}

module "nat" {
  source = "../Nat_Module"
  depends_on = [
    module.network
  ]
  vpc_id    = module.network.vpc_id
  subnet_id = module.network.subnet_map.web["ap-southeast-2a"].id

  route_table_id = module.network.app_route_table_id


}

module "security" {
  source = "../Security"
  depends_on = [
    module.network
  ]
  vpc_id     = module.network.vpc_id
  subnet_map = module.network.subnet_map
}

module "bastion" {
  source = "../Bastion_Module"
  depends_on = [
    module.security,
    module.network
  ]
  subnet_id              = module.network.subnet_map.web["ap-southeast-2a"].id
  security_group_id_list = [module.security.SG_map.web.id]
}
