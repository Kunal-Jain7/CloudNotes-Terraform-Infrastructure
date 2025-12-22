resource "google_artifact_registry_repository" "docker_repo" {
  repository_id = "cloudnotes-docker"
  location      = var.region
  format        = "DOCKER"
}
