locals {
  region = "europe-west3"
  zone = "europe-west3-a"
}

provider "google" {
  project = var.project_id
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

# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_run_v2_service
resource "google_cloud_run_v2_service" "cts" {
  name                = "cts"
  location            = local.region
  deletion_protection = false
  ingress             = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "${local.region}-docker.pkg.dev/${var.project_id}/${google_artifact_registry_repository.my_repo.repository_id}/cts:${var.app_version}"
    }
  }
}

