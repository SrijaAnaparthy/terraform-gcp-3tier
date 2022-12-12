module "networking" {
  source              = "../modules/networking"
  gcp_project         = var.gcp_project
  vpc_network_name    = var.vpc_network_name
  subnsubnet1_name    = var.subnet1_name
  subnet1_cidr_range  = var.subnet1_cidr_range
  subnet1_region      = var.subnet1_region
  firewall_rules_name = var.firewall_rules_name
  protocol_to_allow   = var.protocol_to_allow
  array_of_ports      = var.array_of_ports
}
