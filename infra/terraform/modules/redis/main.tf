resource  "aws_elasticache_subnet_group" "main" {
  name       = "${var.environment}-redis-subnet"
  subnet_ids = var.subnet_ids
}

resource "aws_elasticache_cluster" "main" {
  cluster_id           = var.name
  engine               = "redis"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  subnet_group_name    = aws_elasticache_subnet_group.main.name
}

output "redis_endpoint" { value = aws_elasticache_cluster.main.cache_nodes.0.address }
