output "instance_address" {
  value = google_compute_instance.instance1.network_interface.0.access_config.0.nat_ip
}

output "project_id" {
  value = data.google_project.project.project_id
}

output "project_number" {
  value = data.google_project.project.number
}

output "description" {
  value = data.google_compute_network.cr460demo.description
}

output "subnetworks_self_links" {
  value = data.google_compute_network.cr460demo.subnetworks_self_links
}


output "description2" {
  value = data.google_compute_network.default-network.description
}

output "subnetworks_self_links2" {
  value = data.google_compute_network.default-network.subnetworks_self_links
}
