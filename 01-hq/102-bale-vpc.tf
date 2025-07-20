# Create seperate project for Baleerica INC HQ resources

# Vito Balerica HQ VPC
# Bale VPC
resource "google_compute_network" "balerica_inc_main" {
  name                            = "balerica-inc-main"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false
  provider                        = google.balerica
}

# Bale Subnet
resource "google_compute_subnetwork" "balerica_inc_private" {
  name                     = "balerica-inc-private"
  ip_cidr_range            = "10.40.0.0/24"
  region                   = "southamerica-east1"
  network                  = google_compute_network.balerica_inc_main.id 
  private_ip_google_access = true
  provider                 = google.balerica
}

# Bale Firewall
resource "google_compute_firewall" "balerica_inc_allow-ssh" {
  name     = "balerica-inc-allow-ssh"
  network  = google_compute_network.balerica_inc_main.name 
  provider = google.balerica

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "balerica_inc_allow-icmp" {
  name     = "balerica-inc-allow-icmp"
  network  = google_compute_network.balerica_inc_main.name 
  provider = google.balerica

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}