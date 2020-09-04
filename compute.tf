resource "google_compute_instance" "instance1" {
  name         = "instance1"
  machine_type = "n1-standard-1"
  zone = var.zone
#  zone         = "us-east1-b"
  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network = data.google_compute_network.default-network.name
    access_config {
      # Assigne une IP externe temporaire
    }
  }
}
