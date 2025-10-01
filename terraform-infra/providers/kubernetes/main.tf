provider "kubernetes" {
  config_path = var.kubeconfig
}

resource "kubernetes_namespace" "sample" {
  metadata {
    name = var.namespace
  }
}
