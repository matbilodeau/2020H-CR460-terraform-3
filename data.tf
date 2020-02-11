/*data "google_project" "project" {
}*/
data "google_compute_network" "default-network" {
  name = "default"
  project = data.google_project.project.name
}

data "google_project" "project" {
  project_id = var.project_id
}

data "google_compute_network" "cr460demo" {
  name = "cr460demo"
  project = data.google_project.project.name
}
