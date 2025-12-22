terraform {
  backend "gcs" {
    bucket = "cloudnotes-terraform-state"
    prefix = "prod"
  }
}
