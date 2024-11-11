# Infrastructure Repository

This repository contains the infrastructure code and configurations for our project. It includes resources necessary to set up and manage the infrastructure.

## Contents

- **Terraform**: Infrastructure as Code (IaC) scripts for configuring GCP.


## Getting Started

To get started with this repository, follow the steps below:

1. **Clone the repository**:
  ```sh
  git clone https://github.com/jan-tomsic/infra.git
  cd infra
  ```

2. **Set up environment variables**:
  Ensure you have the necessary environment variables set up (`GOOGLE_CREDENTIALS`, `project_id`)	
  Google credentials is a JSON file with your GCP Service Account Key.

3. **Provision infrastructure**:
  Navigate to the `terraform` directory and run the following commands:
  ```sh
  cd terraform
  terraform init
  terraform apply
  ```

5. **Deploy applications**:
  Once the infrastructure is configured, you can deploy the applications to Google Run using GitHub actions or some other CI/CD.

