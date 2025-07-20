# Team Admin Xavier VPC
resource "google_compute_network" "team-admin" {
  name                            = "team-admin"
  routing_mode                    = "REGIONAL"
  auto_create_subnetworks         = false
  mtu                             = 1460
  delete_default_routes_on_create = false
  provider                        = google.team
}

# Team Admin Subnet
resource "google_compute_subnetwork" "team-admin-subnet" {
  name                     = "team-admin-subnet"
  ip_cidr_range            = "10.80.0.0/24"
  region                   = "us-west1"
  network                  = google_compute_network.team-admin.id 
  private_ip_google_access = true
  provider                 = google.team
}

# Team Admin Firewall
resource "google_compute_firewall" "team-admin-allow-ssh" {
  name     = "team-admin-allow-ssh"
  network  = google_compute_network.team-admin.name 
  provider = google.team

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "team-admin-allow-icmp" {
  name     = "team-admin-allow-icmp"
  network  = google_compute_network.team-admin.name 
  provider = google.team

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}
