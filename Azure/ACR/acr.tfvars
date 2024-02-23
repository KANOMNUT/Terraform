acr_name = "kanomnuttacr"
rg = "rg-sea-kanomnutt"
location = "southeastasia"
sku = "Basic"
admin_enabled = false
acr_scope_map = [ {
    name = "repo1"
    actions = [ 
      "repositories/repo1/metadata/read",
      "repositories/repo1/metadata/write",
      "repositories/repo1/content/read",
      "repositories/repo1/content/write",
      "repositories/repo1/content/delete"
    ]
  },
  {
    name = "repo2"
    actions = [ 
      "repositories/repo2/metadata/read",
      "repositories/repo2/metadata/write",
      "repositories/repo2/content/read",
      "repositories/repo2/content/write",
      "repositories/repo2/content/delete"
    ]
  } 
]
tags = {
  "name" = "ACR"
}