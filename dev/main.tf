module "networking" {
  source              = "../modules/networking"
  gcp_project         = var.gcp_project
  vpc_network_name    = var.vpc_network_name
  subnet1_name        = var.subnet1_name
  subnet1_cidr_range  = var.subnet1_cidr_range
  subnet1_region      = var.subnet1_region
  firewall_rules_name = var.firewall_rules_name
  protocol_to_allow   = var.protocol_to_allow
  array_of_ports      = var.array_of_ports
  subnet2_name        = var.subnet2_name
  subnet2_cidr_range  = var.subnet2_cidr_range
  subnet2_region      = var.subnet2_region
  subnet3_name        = var.subnet3_name
  subnet3_cidr_range  = var.subnet3_cidr_range
  subnet3_region      = var.subnet3_region
  source_ranges       = var.source_ranges
}

module "compute" {
  source                       = "../modules/compute"
  gcp_project                  = var.gcp_project
  subnet1_id                   = module.networking.subnet1_id
  subnet2_id                   = module.networking.subnet2_id
  subnet3_id                   = module.networking.subnet3_id
  public_ip                    = module.networking.public_ip
  subnet1_region               = var.subnet1_region
  nginx_webserver_name         = var.nginx_webserver_name
  nginx_webserver_machine_type = var.nginx_webserver_machine_type
  nginx_webserver_image        = var.nginx_webserver_image
  service_account_id           = var.service_account_id
  service_account_name         = var.service_account_name
  compute_instance_username    = var.compute_instance_username
  nginx_webserver_disk_name    = var.nginx_webserver_disk_name
  nginx_webserver_disk_type    = var.nginx_webserver_disk_type
  nginx_webserver_disk_size    = var.nginx_webserver_disk_size
  private_key_path             = var.private_key_path
  public_key_path              = var.public_key_path
}

module "mongo-atlas" {
  source                       = "../modules/mongo-atlas"
  gcp_project                  = var.gcp_project
  atlas_org_id                 = var.atlas_org_id
  atlas_project_name           = var.atlas_project_name
  environment                  = var.environment
  cluster_instance_size_name   = var.cluster_instance_size_name
  atlas_region                 = var.atlas_region
  cidr_block_atlas             = var.cidr_block_atlas
}
