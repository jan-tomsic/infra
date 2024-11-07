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

# Enable GCP APIs

resource "google_project_service" "cloudrun_api" {
  project = var.project_id
  service = "run.googleapis.com"
}

resource "google_project_service" "cloudresourcemanager_api" {
  project = var.project_id
  service = "cloudresourcemanager.googleapis.com"
}


# Configure Docker repository

#resource "google_artifact_registry_repository" "my_repo" {
#  location      = local.region
#  repository_id = "my-repo"
#  description   = "My repository"
#  format        = "DOCKER"
#}

#resource "google_cloud_run_v2_service" "cts" {
#  name = "cts"
#  location = local.region
#  
#}