output "instance_address" {
  value = google_compute_instance.chien.network_interface.0.access_config.0.nat_ip
}
