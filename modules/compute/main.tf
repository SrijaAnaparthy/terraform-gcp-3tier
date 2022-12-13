#Get the service account email ID to provision for the Compute instance
resource "google_service_account" "service_account" {
  account_id   = var.service_account_id
  display_name = var.service_account_name
}

#Create a persistent ssd disk for the nginx webserver
resource "google_compute_disk" "nginx_webserver_attached_disk" {
  project = var.gcp_project
  name    = var.nginx_webserver_disk_name
  type    = var.nginx_webserver_disk_type
  zone    = "${var.subnet1_region}-a"
  size    = var.nginx_webserver_disk_size
}

#Create a public instance for nginx webserver
resource "google_compute_instance" "nginx_webserver" {
  name         = var.nginx_webserver_name
  machine_type = var.nginx_webserver_machine_type
  zone         = "${var.subnet1_region}-a"

  boot_disk {
    initialize_params {
      image = var.nginx_webserver_image
    }
  }

  attached_disk {
    source = google_compute_disk.nginx_webserver_attached_disk.id
  }

  network_interface {
    subnetwork = var.subnet1_id
    access_config {
      nat_ip = var.public_ip
    }
  }

  service_account {
    email  = google_service_account.service_account.email
    scopes = ["cloud-platform"]
  }

  provisioner "remote-exec" {
    connection {
      host        = var.public_ip
      type        = "ssh"
      timeout     = "500s"
      user        = var.compute_instance_username
      private_key = file(var.private_key_path)
    }

    inline = [
      "sudo apt update",
      "sudo apt install nginx"
    ]
  }

  metadata = {
    ssh-keys = "${var.compute_instance_username}:${file(var.public_key_path)}"
  }
}
