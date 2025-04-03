module "network" {
  source = "./modules/network"
}

module "ecs" {
  source = "./modules/ecs"
}

module "rds" {
  source     = "./modules/rds"
  db_username = var.db_username
  db_password = var.db_password
  subnet_ids  = module.network.subnet_ids  # ✅ Passing subnet_ids correctly
}

module "s3" {
  source      = "../../modules/s3"
  bucket_name = "terraform-state-dev"
}