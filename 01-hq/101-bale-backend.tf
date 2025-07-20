# https://www.terraform.io/language/settings/backends/gcs

# Balerica Team Backend
  # Create seperate project for Baleerica INC HQ resources
terraform {
  backend "gcs" {
    bucket      = "wave-terraform-state-02"
    prefix      = "terraform/balehq-state"
    credentials = "keys.json"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 6.0"
    }
  }
}