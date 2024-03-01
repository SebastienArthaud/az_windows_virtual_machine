locals {
  vm_network_interface_name = "nic-${var.virtual_machine_name}"
  ip_name                   = var.vm_public_ip_address == true ? "${var.virtual_machine_name}-public-ip" : null
}
resource "random_password" "virtual_machine_password" {
  length           = 16
  special          = false
  min_upper        = 2
  min_numeric      = 2
  min_special      = 2
  override_special = "_%@"
}

module "vm_network_interface" {
  count                       = var.custom_image_name == "" || var.custom_image_name_resource_group == "" ? 1 : data.azurerm_shared_image.custom_image[0].specialized == true ? 0 : 1
  source                      = "git::https://gitlab.devolab.cloud/m_cloud_lyon/az-module-tf/az_network-interface.git"
  resourcegroup_name          = var.resourcegroup_name
  location                    = var.location
  ip_name                     = local.ip_name
  network_interface_name      = local.vm_network_interface_name
  network_interface_subnet_id = var.vm_network_interface_name_subnet_id
  public_ip_address           = var.vm_public_ip_address
  network_interface_primary   = var.vm_network_interface_primary

}

resource "azurerm_windows_virtual_machine" "virtual_machine" {
  count               = var.custom_image_name == "" || var.custom_image_name_resource_group == "" ? 1 : data.azurerm_shared_image.custom_image[0].specialized == true ? 0 : 1
  name                = var.virtual_machine_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "DevoAdmin"
  admin_password      = var.virtual_machine_password == "" ? resource.random_password.virtual_machine_password.result : var.virtual_machine_password
  network_interface_ids = var.custom_image_name == "" || var.custom_image_name_resource_group == "" ? [module.vm_network_interface[0].network_interface_id, ] : data.azurerm_shared_image.custom_image[0].specialized == true ? [] : [
    module.vm_network_interface[0].network_interface_id,
  ]

  os_disk {
    caching              = var.os_disk_caching #"ReadWrite"
    storage_account_type = var.os_disk_type    #"Standard_LRS"
  }

  dynamic "source_image_reference" {
    for_each = var.custom_image_name == "" || var.custom_image_name_resource_group == "" ? var.vm_image : {}
    content {
      publisher = source_image_reference["publisher"]
      offer     = source_image_reference["offer"]
      sku       = source_image_reference["sku"]
      version   = source_image_reference["version"]
    }

  }
  source_image_id = var.custom_image_name != "" && var.custom_image_name_resource_group != "" ? data.azurerm_shared_image.custom_image[0].id : null

  identity {
    type = var.identity_type
  }
}



