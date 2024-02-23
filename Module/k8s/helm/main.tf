resource "helm_release" "helm_release" {
  name       = var.release_name
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version
  namespace  = var.namespace
  lint       = var.lint_enabled
  atomic     = var.atomic_enabled
  max_history  = var.max_history

  values = [
    "${file(var.config_file_path)}"
  ]

  depends_on = [var.depends_resource_id]
}