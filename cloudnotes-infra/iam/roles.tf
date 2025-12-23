resource "google_project_iam_member" "jenkins_artifact_registry" {
  role    = "roles/artifactregistry.writer"
  member  = "serviceAccount:${google_service_account.jenkins.email}"
  project = var.project_id
}

resource "google_project_iam_member" "jenkins_gke" {
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.jenkins.email}"
  project = var.project_id
}
