resource "google_sql_database_instance" "postgres" {
  name             = "cloudnotes-db"
  database_version = "POSTGRES_14"
  region           = var.region

  settings {
    tier = "db-f1-micro"
  }
}
