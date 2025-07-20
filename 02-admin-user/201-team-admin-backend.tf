# # https://www.terraform.io/language/settings/backends/gcs
# # Balerica Team Admin Backend

# terraform {
#   backend "gcs" {
#     bucket      = "wave-terraform-state-01"
#     prefix      = "terraform/team-state"
#     credentials = "key.json"
#   }
#   required_providers {
#     google = {
#       source  = "hashicorp/google"
#       version = "~> 6.0"
#     }
#   }
# }