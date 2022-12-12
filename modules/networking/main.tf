resource "google_compute_network" "gcp_vpc_network" {
  name    = var.vpc_network_name
  project = var.gcp_project
}

resource "google_compute_firewall" "firewall_rules" {
  name    = var.firewall_rules_name
  network = google_compute_network.gcp_vpc_network.name
  allow {
    protocol = var.protocol_to_allow
    ports    = var.array_of_ports
  }
}

resource "google_compute_subnetwork" "subnet1" {
  name          = var.subnet1_name
  ip_cidr_range = var.subnet1_cidr_range
  region        = var.subnet1_region
  network       = google_compute_network.gcp_vpc_network.id
}
