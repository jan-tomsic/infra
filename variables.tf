variable "GOOGLE_CREDENTIALS" {
  description = "GCP credentials json"
}

variable "project_id" {
  description = "GCP project ID"
}

variable "app_version" {
  description = "Version of the app to deploy"
  default     = "latest"
}

variable "gcp_services" {
  description = "List of necessary APIs for the project"
  type = list(string)
  default = [
    "run.googleapis.com",
    "cloudresourcemanager.googleapis.com"
  ]
}