IAC/id/user_assigned/id_nodepool/prod/

=====================================

2.53.0

======================
deploy

update tag to script
git pull https://dev.azure.com/centralgroup/_git/IAC
git push https://dev.azure.com/centralgroup/_git/IAC
git clone git@ssh.dev.azure.com:v3/centralgroup/IAC/azure-module

====create ssh key====
#ssh-keygen -t rsa
#cat C:\Users\Supakit_S/.ssh/id_rsa.pub
#ssh-add ~/.ssh/id_rsa
======================

apply role and role binding

kubectl config use-context cg-aks-nonprd-admin

terraform apply -var-file=non-prod/non-prod.tfvars -state=non-prod/non-prod.tfstate

terraform apply -var-file=pmp/pmp-dev.tfvars -state=pmp/pmp-dev.tfstate

===refresh state terraform===
terraform plan -refresh-only -var-file=non-prod/non-prod.tfvars -state=non-prod/non-prod.tfstate
terraform apply -refresh-only -var-file=non-prod/non-prod.tfvars -state=non-prod/non-prod.tfstate

Register Resource providers
- ContainerService
- ManagedIdentity

done1. ~/.code-workspace/centralgroup/IAC/id/user_assigned/id_nodepool
done2. grant consent at sp-system-aks-nonprd by IC-Team [AAD --> App registrations --> sp-system-aks-nonprd --> API permissions --> Grant admin consent for Default Directory]
done3. ~/.code-workspace/centralgroup/IAC/aks/cluster
done4. ~/.code-workspace/centralgroup/IAC/id/role_assignment/id_agentpool
done4.1 replace principal_id from resource group MC_xxx to non-prod.tfvars
done5. ~/.code-workspace/centralgroup/IAC/id/role_assignment/id_nodepool
done5.1 replace principal_id from resource group MC_xxx to non-prod.tfvars
done6. ~/.code-workspace/centralgroup/IAC/aks/node-pool/cg-statefulpool
done7. ~/.code-workspace/centralgroup/IAC/aks/node-pool/cg-statelesspool
done8. ~/.code-workspace/centralgroup/IAC/aks/acr
done9. ~/.code-workspace/centralgroup/IAC/network/private-endpoint/acr
done9.1 need to disable network policy before create privite endpoint on subnet by az network vnet subnet update --name snet-cg-sea-data-prd --resource-group rg-cg-sea-spoke-prd --vnet-name vnet-cg-sea-spoke-prd --disable-private-endpoint-network-policies true
done10. ~/.code-workspace/centralgroup/IAC/dns/private-dns/zone/acr   (config private dns)
done11. ~/.code-workspace/centralgroup/IAC/dns/private-dns/a-record/acr
done12. ~/.code-workspace/centralgroup/IAC/network/public-ip/application/gateway
done13. ~/.code-workspace/centralgroup/IAC/id/user_assigned/id_agw
done	13.1 Manual add id_agw to key vault (Secret Permissions ,Certificate Permissions)
done14. ~/.code-workspace/centralgroup/IAC/security/waf-policy/application/gateway/
done15. ~/.code-workspace/centralgroup/IAC/application/gateway
done16. ~/.code-workspace/centralgroup/IAC/monitor/application/gateway
done17. ~/.code-workspace/centralgroup/IAC/network/private-endpoint/storage_account/application/gateway
done18. ~/.code-workspace/centralgroup/IAC/dns/private-dns/a-record/storage-account
done17. ~/.code-workspace/centralgroup/IAC/id/user_assigned/id_microservice
done18. ~/.code-workspace/centralgroup/IAC/id/user_assigned/id_agic
done19. ~/.code-workspace/centralgroup/IAC/id/role_assignment/id_agic
done	19.1 add principle_id id_agic
done20. ~/.code-workspace/centralgroup/IAC/id/role_assignment/id_agw
done	20.1 add principle_id id_agic
done21. ~/.code-workspace/centralgroup/IAC/id/role_assignment/ris
done22. ~/.code-workspace/centralgroup/IAC/aks/helm/aadpodidentity
done	22.1 run az aks get-credentials --name cg-aks-nonprd --resource-group rg-cg-sea-aks-nonprd --admin
done	22.2 run kubectl config use-context cg-aks-nonprd-admin
done23. ~/.code-workspace/centralgroup/IAC/aks/helm/application/gateway
done	23.1 add client_id id_agic
done24. ~/.code-workspace/centralgroup/IAC/aks/namespace
done	24.1 Need to get credential before run it. az aks get-credentials --name cg-aks-nonprd --resource-group rg-cg-sea-aks-nonprd --admin
done25. ~/.code-workspace/centralgroup/IAC/aks/helm/prometheus
	25.1 kubectl config use-context cg-aks-nonprd-admin  
	25.2 kubectl taint node CriticalAddonsOnly=true:NoSchedule- -l Nodepool=agent
		 kubectl taint node StatefulOnly=true:NoSchedule- -l Nodepool=stateful
		 kubectl taint node StatelessOnly=true:NoSchedule- -l Nodepool=stateless
		 ==== work aroud from Azure support====
		 kubectl --as "system:serviceaccount:kube-system:node-controller" taint node StatelessOnly=true:NoSchedule- -l Nodepool=stateless
	###for first time
	25.3 age-keygen -o key.txt
	25.4 create keys.txt to C:\Users\<username>\AppData\Roaming\sops\age and place key

	###for encrypt or edit value
	25.5 sops --age "age15dcw9hp5rmnamfqxzaxddqvyyc34kt5n7slwlesef0984j4m9dhqnzsjwx" --input-type value "non-prod.enc.tfvars"

	###for decrypt
	25.6 sops -d non-prod.enc.tfvars > non-prod.tfvars
	25.7 run terraform apply -var-file=non-prod/non-prod.tfvars -state=non-prod/non-prod.tfstate (for deploy helm)
	25.8 kubectl taint node CriticalAddonsOnly=true:NoSchedule -l Nodepool=agent
		 kubectl taint node StatefulOnly=true:NoSchedule -l Nodepool=stateful
		 kubectl taint node StatelessOnly=true:NoSchedule -l Nodepool=stateless

done25. ~/.code-workspace/centralgroup/IAC/aks/helm/msi-acrpull
done	25.1 change identityClientID at yaml file
done26. ~/.code-workspace/centralgroup/IAC/
done	26.1 kubectl apply -f examples/acr-nonprd.yaml
27. ~/.code-workspace/centralgroup/IAC/aks/role/ris/* (all sub folder)
28. deploy corendssms.yaml
====================================================================================
az aks get-credentials --name cg-aks-nonprd --resource-group rg-cg-sea-aks-nonprd --admin
kubectl config use-context cg-aks-nonprd-admin

kubectl get po -n kube-system
kubectl delete po <mic pod name> -n kube-system
kubectl delete po -l app.kubernetes.io/component=nmi -n kube-system

===for import state terrafrom====
terraform import -var-file=prod/prod.tfvars -state=prod/prod.tfstate module.private-dns-zone-acr-vnet-link.azurerm_private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link "/subscriptions/5748fbf6-e421-45f1-9df6-d3656bc00760/resourceGroups/rg-cg-sea-hub-prd/providers/Microsoft.Network/privateDnsZones/privatelink.azurecr.io/virtualNetworkLinks/vnet-cg-sea-spoke-nonprd-private-dns"


helm delete agic-prd


commit git
push git
