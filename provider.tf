provider "google" {
  project = var.project_id
  credentials = "account.json"
  region  = "us-east1"
  zone    = var.zone
}
