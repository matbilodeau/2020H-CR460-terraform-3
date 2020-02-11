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

  metadata_startup_script = "apt-get -y update && apt-get -y upgrade && apt-get -y install apache2 && systemctl start apache2"
}
