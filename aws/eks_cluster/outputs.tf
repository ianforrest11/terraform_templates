
output "kubeconfig" {
  value = <<EOF
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.this.endpoint}
    certificate-authority-data: ${base64encode(aws_eks_cluster.this.certificate_authority.0.data)}
  name: ${var.name}
contexts:
- context:
    cluster: ${var.name}
    user: aws
  name: ${var.name}
current-context: ${var.name}
kind: Config
preferences: {}
users:
- name: aws
  user:
    exec:
      apiVersion: client.authentication.k8s.io/v1alpha1
      command: aws-iam-authenticator
      args:
        - "token"
        - "-i"
        - ${var.name}
EOF
  sensitive = true
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}