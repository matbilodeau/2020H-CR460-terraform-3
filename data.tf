data "google_compute_network" "default-network" {
  name    = "default"
  project = data.google_project.default-project.project_id
}

data "google_project" "default-project" {
  project_id = var.project_id
}

data "google_compute_health_check" "health_check" {
  name = "http-health-check"
}
