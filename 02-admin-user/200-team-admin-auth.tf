# https://registry.terraform.io/providers/hashicorp/google/latest/docs

# Balerica Team Auth
provider "google" {
  project     = "gcp-01-453500"
  region      = "us-west1"
  credentials = "key.json"
  alias = "team"
}