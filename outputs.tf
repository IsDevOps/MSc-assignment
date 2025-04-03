output "ecs_cluster_id" {
  value = module.ecs.ecs_cluster_id
}

output "db_endpoint" {
  value     = module.rds.db_endpoint
  sensitive = true
}
