output "vpc_id" {
  value = module.vpc.vpc_id
}

output "eks_cluster_id" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "kubeconfig_command" {
  value = module.eks.kubeconfig_cmd
}

output "rds_endpoint" {
  value = module.rds.db_endpoint
}

output "redis_endpoint" {
  value = module.redis.redis_endpoint
}
