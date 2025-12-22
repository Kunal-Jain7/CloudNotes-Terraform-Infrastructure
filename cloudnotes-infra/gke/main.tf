resource "google_container_cluster" "cloudnotes-gke-cluster" {
  name     = "cloudnotes-cluster"
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1

  network    = var.network
  subnetwork = var.subnetwork
}

resource "google_container_node_pool" "primary-node-pool" {
  name     = "primary-node-pool"
  cluster  = google_container_cluster.cloudnotes-gke-cluster.name
  location = var.region

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }

  initial_node_count = 2
}
