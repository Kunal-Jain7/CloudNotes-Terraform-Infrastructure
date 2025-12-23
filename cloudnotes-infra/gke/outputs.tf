output "cluster_name" {
  value = google_container_cluster.cloudnotes_gke.name
}

output "cluster_zone" {
  value = google_container_cluster.cloudnotes_gke.location
}

output "cluster_endpoint" {
  value = google_container_cluster.cloudnotes_gke.endpoint
}
