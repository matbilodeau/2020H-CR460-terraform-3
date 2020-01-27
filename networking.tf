resource "google_compute_network" "cr460demo" {
  name                    = "cr460demo"
  auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "mtl-dmz" {
  name          = "mtl-dmz"
  ip_cidr_range = "172.16.1.0/24"
  region        = "northamerica-northeast1"
  network       = google_compute_network.cr460demo.self_link
}

resource "google_compute_subnetwork" "mtl-internal" {
  name          = "mtl-internal"
  ip_cidr_range = "10.0.1.0/24"
  region        = "northamerica-northeast1"
  network       = google_compute_network.cr460demo.self_link
}

resource "google_compute_firewall" "ssh" {
  name    = "ssh"
  network = google_compute_network.cr460demo.name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

}

resource "google_compute_firewall" "http" {
  name    = "http"
  network = google_compute_network.cr460demo.name
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

}
