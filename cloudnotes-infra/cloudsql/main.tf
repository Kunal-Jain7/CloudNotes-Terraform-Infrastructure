resource "google_sql_database_instance" "postgres" {
  name             = "cloudnotes-db"
  database_version = "POSTGRES_14"
  region           = var.region

  deletion_protection = false

  settings {
    tier              = "db-f1-micro"
    disk_size         = 20
    disk_type         = "PD_HDD"
    availability_type = "ZONAL"

    backup_configuration {
      enabled = false
    }
  }
}
