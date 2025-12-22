module "network" {
  source = "./network"

  project_id = var.project_id
  region     = var.region
}

module "artifact_registry" {
  source = "./artifact-registry"

  project_id = var.project_id
  region     = var.region
}

module "gke" {
  source = "./gke"

  project_id = var.project_id
  region     = var.region
  network    = module.network.vpc_name
  subnetwork = module.network.subnet_name
}

module "cloudsql" {
  source = "./cloudsql"

  project_id = var.project_id
  region     = var.region
}
