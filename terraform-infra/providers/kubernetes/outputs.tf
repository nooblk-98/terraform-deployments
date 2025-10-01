output "namespace_name" {
  value = kubernetes_namespace.sample.metadata[0].name
}
