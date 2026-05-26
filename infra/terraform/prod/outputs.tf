# ==============================================
# us-east-1
# ==============================================
output "vpc_id_east" {
  value = module.vpc_east.vpc_id
}

output "eks_cluster_name_east" {
  value = module.eks_east.cluster_id
}

output "eks_login_east" {
  value = "aws eks update-kubeconfig --name ${module.eks_east.cluster_id} --region us-east-1"
}

# ==============================================
# us-west-2
# ==============================================
output "vpc_id_west" {
  value = module.vpc_west.vpc_id
}

output "eks_cluster_name_west" {
  value = module.eks_west.cluster_id
}

output "eks_login_west" {
  value = "aws eks update-kubeconfig --name ${module.eks_west.cluster_id} --region us-west-2"
}


