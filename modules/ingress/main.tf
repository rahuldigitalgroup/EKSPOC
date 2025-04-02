resource "kubernetes_deployment" "nginx_ingress" {
  metadata {
    name      = "nginx-ingress-controller"
    namespace = "kube-system"
  }

  spec {
    replicas = 2

    selector {
      match_labels = { app = "nginx-ingress" }
    }

    template {
      metadata {
        labels = { app = "nginx-ingress" }
      }

      spec {
        container {
          name  = "nginx-ingress-controller"
          image = "registry.k8s.io/ingress-nginx/controller:v1.8.0"

          ports { container_port = 80 }
          ports { container_port = 443 }
        }
      }
    }
  }
}
