resource "kubernetes_secret" "kubernetes_secret" {
  metadata {
    annotations = {
      "kubernetes.io/service-account.name" = var.sa_name
    }
    name = var.sa_name
    namespace = var.namespace
  }
  type = "kubernetes.io/service-account-token"
}

resource "kubernetes_service_account" "kubernetes_service_account" {
  metadata {
    name = var.sa_name
    namespace = var.namespace
  }
  secret {
    name = var.sa_name
  }
}

resource "kubernetes_role" "kubernetes_role" {
  metadata {
    name = var.name
    namespace = var.namespace
    labels = var.labels
  }

  dynamic "rule" {
    for_each = [for r in var.rules: {
        api_groups = r.api_groups
        resources = r.resources
        resource_names = r.resource_names
        verbs = r.verbs
    }]
    content {
       api_groups     = rule.value.api_groups
       resources      = rule.value.resources
       resource_names = rule.value.resource_names
       verbs          = rule.value.verbs
    }
  }
}

resource "kubernetes_role_binding" "kubernetes_role_binding" {
  metadata {
    name      = var.name
    namespace = var.namespace
    labels = var.labels
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = var.name
  }

  count       = length(var.group_ids)

  subject {
    kind      = var.subject_kind
    name      = var.group_ids[count.index]
    api_group = var.subject_api
    namespace = var.namespace
  }

  depends_on = [
    kubernetes_role.kubernetes_role,
    kubernetes_service_account.kubernetes_service_account
  ]

}