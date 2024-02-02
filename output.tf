output "created_virtual_machine_id" {
  description = "VM créée"
  value       = resource.azurerm_windows_virtual_machine.virtual_machine.id
}