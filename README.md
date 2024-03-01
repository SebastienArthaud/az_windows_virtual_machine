# az_windows-virtual-machine

## Usage

Ce module terraform permet de deployer une VM Azure,

## Example usage 

Pour voir un exemple d'utilisation de ce module ce réferer au dossier "example".
Cloner le repot et effectuer un terraform init/plan/apply afin de voir un exemple de déploiement.

> ne pas oublier de faire un terraform destroy après avoir fait des tests


## Providers

| Name | Version |
|------|---------|
| [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs) | >= 3.11, < 4.0 |


## Resources provisionés

| Name | Type |
|------|------|
| [azurerm_windows_virtual_machine](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine) | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resourcegroup_name | Resource group de la VM | `string` | null | yes |
| location | Localisation de la ressource (région azure) | `string` | null | yes |
| virtual_machine_password | Mot de passe de la VM créée | `string` | "" | no |
| virtual_machine_name | Nom de la VM créée | `string` | null | yes |
| vm_network_interface_ip_config | Nom de la configuration IP | `string` | "ipconfig1" | no |
| vm_network_interface_name_subnet_id | Subnet associé à la carte réseau | `string` | null | yes |
| private_ip_address_allocation | Allocation dynamique ou statique | `string` | "Dynamic" | no |
| public_ip_address | Ajout d'une adresse Ip publique ou non | `bool` | false | no |
| vm_network_interface_name_primary | carte réseau primaire ou non (doit l'être si c'est la première) | `bool` | true | no |
| vm_size | Taille de la VM | `string` | "Standard_B2s" | no |
| os_disk_caching | Cache du disque OS | `string` | "ReadWrite" | no |
| os_disk_type | Type de disque OS | `string` | "Standard_LRS" | no |
| identity_type | Identité de la machine | `string` | "SystemAssigned" | no |
| [vm_image](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cli-ps-findimage) | Image OS de la machine créée | `map(any)` | <pre>{<br>  "publisher": "MicrosoftWindowsServer",<br>  "offer": "WindowsServer",<br>  "sku": "2019-Datacenter",<br>  "version": "latest"<br>}</pre> | no |
| custom_image_name | Nom de l'image customisée si besoin. (La variable vm_image devient alors nulle) | `string` | "" | no |
| custom_image_gallery_name | Nom de la galerie de l'image customisée si besoin. | `string` | "" | no |
| custom_image_name_resource_group | resource group de l'image customisée si besoin. (La variable vm_image devient alors nulle) | `string` | "" | no |


## Outputs

| Name | Description |
|------|-------------|
| created_virtual_machine_id | ID de la machine créée |

