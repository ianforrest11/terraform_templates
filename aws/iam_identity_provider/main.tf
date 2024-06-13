resource "aws_iam_openid_connect_provider" "this" {
  url = var.identity_provider.provider_url
  client_id_list = var.identity_provider.client_id_list
  thumbprint_list = var.identity_provider.thumbprint_list
}