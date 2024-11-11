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

