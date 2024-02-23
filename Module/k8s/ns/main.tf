resource "kubernetes_namespace" "k8s_ns" {
  count = length(var.k8s_ns)
  metadata {
    name = var.k8s_ns[count.index].name
    labels = var.k8s_ns[count.index].labels
  }
}