#Create a Virtual Private Cloud(VPC) network
resource "google_compute_network" "gcp_vpc_network" {
  name    = var.vpc_network_name
  project = var.gcp_project
}

#Create the cloud firewall rules
resource "google_compute_firewall" "firewall_rules" {
  name    = var.firewall_rules_name
  network = google_compute_network.gcp_vpc_network.name
  allow {
    protocol = var.protocol_to_allow
    ports    = var.array_of_ports
  }
  source_ranges = [ var.source_ranges ]
}

#Create a subnet in VPC
resource "google_compute_subnetwork" "subnet1" {
  name          = var.subnet1_name
  ip_cidr_range = var.subnet1_cidr_range
  region        = var.subnet1_region
  network       = google_compute_network.gcp_vpc_network.id
}

#Create a subnet in VPC
resource "google_compute_subnetwork" "subnet2" {
  name          = var.subnet2_name
  ip_cidr_range = var.subnet2_cidr_range
  region        = var.subnet2_region
  network       = google_compute_network.gcp_vpc_network.id
}

#Create a subnet in VPC
resource "google_compute_subnetwork" "subnet3" {
  name          = var.subnet3_name
  ip_cidr_range = var.subnet3_cidr_range
  region        = var.subnet3_region
  network       = google_compute_network.gcp_vpc_network.id
}

#Create a Public IP address for public compute instance to utilize
resource "google_compute_address" "static_public_ip" {
  name    = var.static_public_ip_name
  project = var.gcp_project
  region  = var.subnet1_region
  depends_on = [
    google_compute_firewall.firewall_rules
  ]
}
