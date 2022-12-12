provider "google" {
  credentials = file("<gcp_svc_key.json>")
  project     = var.gcp_project
  region      = var.gcp_region
}
