output "cluster_id" {
  value = aws_eks_cluster.main.id
}

output "cluster_endpoint" {
  value = aws_eks_cluster.main.endpoint
}

output "kubeconfig_cmd" {
  value = "aws eks update-kubeconfig --name ${aws_eks_cluster.main.name} --region us-east-1"
}
