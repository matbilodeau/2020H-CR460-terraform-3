resource "google_compute_instance" "instance1" {
  name         = "instance1"
  machine_type = "n1-standard-1"
  zone = var.zone
#  zone         = "northamerica-northeast1-a"
  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    subnetwork = google_compute_subnetwork.mtl-internal.name
    access_config {
      # Assigne une IP externe temporaire
    }
  }
}
