resource "google_service_account" "jenkins" {
  account_id   = "jenkins-ci"
  display_name = "Jenkins CI Service Account"
}
