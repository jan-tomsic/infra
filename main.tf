locals {
  project = var.project_id
}

provider "google" {
  project = local.project
  region  = "europe-west3"
  zone    = "europe-west3-a"
}

resource "google_project_service" "cloud_run_api" {
    project = var.project_id
    service = "run.googleapis.com"
}
