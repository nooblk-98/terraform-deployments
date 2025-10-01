provider "kubernetes" {
  config_path = var.kubeconfig
}

resource "kubernetes_namespace" "sample" {
  metadata {
    name = var.namespace
  }
}

# Uncomment resources below as needed:

# resource "kubernetes_deployment" "nginx" {
#   metadata {
#     name = "nginx-deployment"
#     namespace = kubernetes_namespace.sample.metadata[0].name
#   }
#   spec {
#     replicas = 1
#     selector {
#       match_labels = {
#         app = "nginx"
#       }
#     }
#     template {
#       metadata {
#         labels = {
#           app = "nginx"
#         }
#       }
#       spec {
#         container {
#           image = "nginx:latest"
#           name  = "nginx"
#           ports {
#             container_port = 80
#           }
#         }
#       }
#     }
#   }
# }

# resource "kubernetes_service" "nginx" {
#   metadata {
#     name = "nginx-service"
#     namespace = kubernetes_namespace.sample.metadata[0].name
#   }
#   spec {
#     selector = {
#       app = "nginx"
#     }
#     port {
#       port        = 80
#       target_port = 80
#     }
#     type = "LoadBalancer"
#   }
# }

# resource "kubernetes_config_map" "example" {
#   metadata {
#     name      = "example-config"
#     namespace = kubernetes_namespace.sample.metadata[0].name
#   }
#   data = {
#     key = "value"
#   }
# }

# resource "kubernetes_secret" "example" {
#   metadata {
#     name      = "example-secret"
#     namespace = kubernetes_namespace.sample.metadata[0].name
#   }
#   data = {
#     password = base64encode("supersecret")
#   }
# }
