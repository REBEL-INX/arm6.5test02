# The Team admin Network Connectivity Center for Vito's team

resource "google_network_connectivity_hub" "team-mesh" {
  name        = "team-mesh"
  description = "Team mesh for user vpcs"
  provider    = google.team
}