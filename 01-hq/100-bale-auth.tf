# https://registry.terraform.io/providers/hashicorp/google/latest/docs

# Balerica Auth
  # Create seperate project for Baleerica INC HQ resources
provider "google" {
  project     = "gcp-02-466519"
  region      = "sao-paulo"
  credentials = "keys.json"
  alias = "balerica"
}

