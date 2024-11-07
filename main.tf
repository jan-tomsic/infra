locals {
  project = var.project_id
  region = "europe-west3"
  zone = "europe-west3-a"
}

provider "google" {
  project = local.project
  region  = local.region
  zone    = local.zone
}

# Enable GCP services

resource "google_project_service" "gcp_services" {
  for_each = toset(var.gcp_services)
  project = var.project_id
  service = each.key
}

# Configure Docker repository

resource "google_artifact_registry_repository" "my_repo" {
  location      = local.region
  repository_id = "my-repo"
  description   = "My repository"
  format        = "DOCKER"
}

#resource "google_cloud_run_v2_service" "cts" {
#  name = "cts"
#  location = local.region
#  
#}