terraform {
  backend "remote" {
    organization = "jantomsic"

    workspaces {
      name = "infra"
    }
  }
}

