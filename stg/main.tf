module "networking" {
  source           = "../modules/networking"
  gcp_project      = var.gcp_project
  vpc_network_name = var.vpc_network_name
}
