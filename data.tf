data "azurerm_shared_image" "custom_image" {
  count               = var.custom_image_name != "" && var.custom_image_name_resource_group != "" && var.custom_image_gallery_name != "" ? 1 : 0
  gallery_name        = var.custom_image_gallery_name
  name                = var.custom_image_name
  resource_group_name = var.custom_image_name_resource_group
}