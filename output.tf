
#si image customisée + image specialized, on ne peut pas créer de resource car le module windows_virtual_machine recquiert des attribut (name, admin_username et admin_password) qui ne peuvent pas être passés si l'image customisée est specialized
#Cela provoquera une erreur 400 os_profile not permitted. le module ne prend pas en charge ce genre d'image...
output "created_virtual_machine_id" {
  description = "VM créée"
  value       = resource.azurerm_windows_virtual_machine.virtual_machine != [] ? resource.azurerm_windows_virtual_machine.virtual_machine[0].id : "No VM created because a specialized custom image has been given in the inputs."
}