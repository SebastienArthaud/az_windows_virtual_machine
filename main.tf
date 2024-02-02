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
  name                = var.virtual_machine_name
  resource_group_name = var.resourcegroup_name
  location            = var.location
  size                = var.vm_size
  admin_username      = "DevoAdmin"
  admin_password      = var.virtual_machine_password == "" ? resource.random_password.virtual_machine_password.result : var.virtual_machine_password
  network_interface_ids = [
    module.vm_network_interface.network_interface_id,
  ]

  os_disk {
    caching              = var.os_disk_caching #"ReadWrite"
    storage_account_type = var.os_disk_type    #"Standard_LRS"
  }

  source_image_reference {
    publisher = var.vm_image["publisher"]
    offer     = var.vm_image["offer"]
    sku       = var.vm_image["sku"]
    version   = var.vm_image["version"]
  }

  identity {
    type = var.identity_type
  }
}



