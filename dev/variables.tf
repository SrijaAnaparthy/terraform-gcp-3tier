variable "gcp_project" {}
variable "gcp_region" {}
variable "vpc_network_name" {}
variable "subnet1_name" {}
variable "subnet1_cidr_range" {}
variable "subnet1_region" {}
variable "firewall_rules_name" {}
variable "protocol_to_allow" {}
variable "array_of_ports" {}
variable "subnet2_name" {}
variable "subnet2_cidr_range" {}
variable "subnet2_region" {}
variable "subnet3_name" {}
variable "subnet3_cidr_range" {}
variable "subnet3_region" {}
variable "source_ranges" {}
variable "nginx_webserver_name" {}
variable "nginx_webserver_machine_type" {}
variable "nginx_webserver_image" {}
variable "service_account_id" {}
variable "service_account_name" {}
variable "compute_instance_username" {}
variable "nginx_webserver_disk_name" {}
variable "nginx_webserver_disk_type" {}
variable "nginx_webserver_disk_size" {}
variable "private_key_path" {}
variable "public_key_path" {}


#mongodb vars
variable "atlas_public_key" {
  type        = string
  description = "MongoDB Atlas Public Key"
}
variable "atlas_private_key" {
  type        = string
  description = "MongoDB Atlas Private Key"
}
# Atlas Organization ID 
variable "atlas_org_id" {
  type        = string
  description = "Atlas organization id"
}
# Atlas Project Name
variable "atlas_project_name" {
  type        = string
  description = "Atlas project name"
}
# Atlas Project environment
variable "environment" {
  type        = string
  description = "The environment to be built"
}
# Cluster instance size name 
variable "cluster_instance_size_name" {
  type        = string
  description = "Cluster instance size name"
  default     = "M10"
}
# Atlas region
variable "atlas_region" {
  type        = string
  description = "GCP region where resources will be created"
  default     = "WESTERN_EUROPE"
}
variable "cidr_block_atlas" {}   