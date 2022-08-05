
resource "aws_instance" "bastion_host" {
  ami             = var.ami
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_group_id_list

  key_name = "canditude"
  tags = {
    "Name" = "bastionhost"
  }
}
