resource "google_container_cluster" "cloudnotes_gke" {
  name = "cloudnotes-cluster"


  location = var.zone

  # Required when using a separate node pool
  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnetwork

  # Recommended settings
  logging_service    = "logging.googleapis.com/kubernetes"
  monitoring_service = "monitoring.googleapis.com/kubernetes"

  deletion_protection = false
}

resource "google_container_node_pool" "primary_nodes" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.cloudnotes_gke.name
  location = var.zone

  node_count = 1

  node_config {
    machine_type = "e2-small"
    disk_size_gb = 20

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = "dev"
    }

    metadata = {
      disable-legacy-endpoints = "true"
    }
  }

  management {
    auto_repair  = true
    auto_upgrade = true
  }
}
