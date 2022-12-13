output "subnet1_id" {
  value = google_compute_subnetwork.subnet1.id
}

output "subnet2_id" {
  value = google_compute_subnetwork.subnet2.id
}

output "subnet3_id" {
  value = google_compute_subnetwork.subnet3.id
}

output "public_ip" {
  value = google_compute_address.static_public_ip.address
}