variable "resourcegroup_name" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Resource group name"
}

variable "virtual_machine_password" {
  type        = string
  description = "VM password"
  default     = ""
}

variable "virtual_machine_name" {
  type        = string
  description = "VM Name"
}

variable "vm_network_interface_name_subnet_id" {
  type        = string
  description = "Name of the NIC Subnet"
}

variable "private_ip_address_allocation" {
  type        = string
  description = "IP Allocation (Dynamic or static)"
  default     = "Dynamic"
}

variable "vm_public_ip_address" {
  type        = bool
  description = "Public IP address boolean, leave it to false if not needed"
  default     = false
}

variable "vm_network_interface_primary" {
  type        = bool
  description = "Primary NIC or not"
  default     = true
}

variable "vm_size" {
  type        = string
  description = "VM Size"
  default     = "Standard_B2s"
}

variable "os_disk_caching" {
  type        = string
  description = "OS Disk cache"
  default     = "ReadWrite"
}

variable "os_disk_type" {
  type        = string
  description = "OS Disk type, can be : 'Standard_LRS', 'StandardSSD_LRS', 'Premium_LRS', 'StandardSSD_ZRS', 'Premium_ZRS' "
  default     = "Standard_LRS"
}

variable "identity_type" {
  type        = string
  description = "VM Identity type, can be : 'SystemAssigned', 'UserAssigned' or 'SystemAssigned, UserAssigned'"
  default     = "SystemAssigned"
}

variable "vm_image" {
  type        = map(any)
  description = "Image reference"
  default = {
    "publisher" : "MicrosoftWindowsServer"
    "offer" : "WindowsServer"
    "sku" : "2019-Datacenter"
    "version" : "latest"
  }
}

variable "custom_image_name" {
  type        = string
  description = "Nom de l'image customisée si besoin."
  default     = ""
}

variable "custom_image_gallery_name" {
  type        = string
  description = "Nom de la galerie de l'image customisée si besoin."
  default     = ""
}


variable "custom_image_name_resource_group" {
  description = "resource group de l'image customisée si besoin."
  type        = string
  default     = ""
}