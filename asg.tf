resource "kubernetes_deployment" "cluster_autoscaler" {
  metadata {
    name      = "cluster-autoscaler"
    namespace = "kube-system"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "cluster-autoscaler"
      }
    }

    template {
      metadata {
        labels = {
          app = "cluster-autoscaler"
        }
      }

      spec {
        container {
          name  = "cluster-autoscaler"
          image = "k8s.gcr.io/autoscaling/cluster-autoscaler:v1.20.0"

          args = [
            "--cloud-provider=aws",
            "--nodes=1:10:your-node-group-name",
            "--scale-down-enabled=true",
          ]

          env {
            name  = "AWS_REGION"
            value = var.region
          }
        }
      }
    }
  }
}
