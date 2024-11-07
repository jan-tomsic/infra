terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  
  backend "remote" {
    organization = "jantomsic"

    workspaces {
      name = "infra"
    }
  }
}