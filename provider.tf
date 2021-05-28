provider "google" {
  project     = var.project_id
  credentials = "maison_act.json"
  region      = "us-east1"
  zone        = var.zone
}
