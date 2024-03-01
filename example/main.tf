module "az_windows_virtual_machine" {
  source                              = "../../az_windows_virtual_machine"
  resourcegroup_name                  = var.vm_resourcegroup_name
  virtual_machine_name                = var.virtual_machine_name
  vm_network_interface_name_subnet_id = data.azurerm_subnet.subnet.id
  vm_public_ip_address                = var.vm_public_ip_address
  location                            = var.location
  custom_image_name                   = var.custom_image_name
  custom_image_name_resource_group    = var.vm_resourcegroup_name
  custom_image_gallery_name           = var.custom_image_gallery_name
}