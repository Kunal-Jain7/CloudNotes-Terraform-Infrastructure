module "network" {
  source = "./network"

  region = var.region
}

module "artifact_registry" {
  source = "./artifact-registry"

  region = var.region
}

module "gke" {
  source = "./gke"

  region     = var.region
  network    = module.network.vpc_name
  subnetwork = module.network.subnet_name
}

module "cloudsql" {
  source = "./cloudsql"

  region = var.region
}

module "iam" {
  source     = "./iam"
  project_id = var.project_id
}

