resource "google_compute_instance" "chien" {
  name         = "chien"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["public"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"
    }

  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-dmz.name
    access_config {

    }


  }
  metadata_startup_script = "apt-get -y update && apt-get -y install apache2 && systemctl start apache2"
}

resource "google_compute_instance" "chat" {
  name         = "chat"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["interne"]

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-interne.name
    access_config {

    }
  }
}



resource "google_compute_instance" "hamster" {
  name         = "hamster"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["traitement"]

  boot_disk {
    initialize_params {
      image = "fedora-coreos-cloud/fedora-coreos-stable"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-traitement.name
    access_config {

    }
  }
}


resource "google_compute_instance_template" "worker-template" {
  name           = "worker-template"
  tags           = ["traitement"]
  machine_type   = "n1-standard-1"
  region         = "us-east1"
  can_ip_forward = true

  disk {
    source_image = "fedora-coreos-cloud/fedora-coreos-stable"
    auto_delete  = true
    boot         = false
  }

  network_interface {
    subnetwork = google_compute_subnetwork.prod-traitement.name
    access_config {

    }
  }

}




resource "google_compute_instance_group_manager" "cr460-workload-group" {
  name               = "cr460-workload-group"
  base_instance_name = "worker"
  version {
    instance_template = google_compute_instance_template.worker-template.self_link
    name              = "primary"
  }
  zone = var.zone

}



resource "google_compute_autoscaler" "cr460-autoscaler" {
  name   = "cr460-autoscaler"
  zone   = var.zone
  target = google_compute_instance_group_manager.cr460-workload-group.self_link

  autoscaling_policy {
    max_replicas    = 5
    min_replicas    = 1
    cooldown_period = 180

    cpu_utilization {
      target = 0.53
    }
  }
}


resource "google_compute_instance" "perroquet" {
  name         = "perroquet"
  machine_type = "f1-micro"
  zone         = var.zone
  tags         = ["cage"]

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {

    }
  }

}

resource "google_compute_health_check" "http-health-check" {
  name        = "http-health-check"
  description = "Health check via http"

  timeout_sec         = 3
  check_interval_sec  = 4
  healthy_threshold   = 5
  unhealthy_threshold = 3

  http_health_check {
    port_name          = "health-check-port"
    port_specification = "USE_NAMED_PORT"
    host               = ""
    request_path       = "/mypath"
    proxy_header       = "NONE"
    response           = "I AM HEALTHY"
  }
