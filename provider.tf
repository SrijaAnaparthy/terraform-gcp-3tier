provider "google" {
  credentials = file("<gcp_svc_key.json>")
  project     = var.gcp_project
  region      = var.gcp_region
}

# Define Terraform provider
terraform {
  required_version = ">= 0.12"
}

# Define the MongoDB Atlas Provider
provider "mongodbatlas" {
  public_key  = var.atlas_public_key
  private_key = var.atlas_private_key
}