# Terraform and Azure: Getting Started

## Prerequisites

- A machine running on Linux, macOS, or Windows.
- A command-line interface (CLI) tool such as Bash, PowerShell, or Terminal.

## Install Terraform

- Go to [the official Terraform website](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) and download the latest version of Terraform for your operating system.
- Extract the downloaded file to a directory in your system path
- Verify the installation by running the command ```terraform -v``` in your terminal. If Terraform is installed correctly, you should see the version number displayed in your terminal.

## Install Azure CLI

- Go to [The offical Microsoft website](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) and follow the instructions to install the Azure CLI.

## Running Terraform for the first time

- Navigate to the directory where your Terraform files are located by using the command line.
```powershell
terraform init
az login
terraform plan -var-file="filename.tfvars" -state="terraform.tfstate"
terraform apply -var-file="filename.tfvars" -state="terraform.tfstate" --auto-approve
```

## Updating Terraform configuration

- Navigate to the directory where your Terraform files are located by using the command line.
```powershell
az login
terraform plan -var-file="filename.tfvars" -state="terraform.tfstate"
terraform apply -var-file="filename.tfvars"-state="terraform.tfstate" --auto-approve
```

## Clean up resource

- Navigate to the directory where your Terraform files are located by using the command line.
```powershell
terraform destroy -var-file="filename.tfvars"-state="terraform.tfstate" --auto-approve
```

