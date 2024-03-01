variable "vm_resourcegroup_name" {
  description = "Resource group de la vm créée"
  type        = string
}

variable "virtual_machine_name" {
  description = "Nom de vm créée"
  type        = string
}

variable "subnet_name" {
  description = "nom du subnet associé"
  type        = string
}

variable "vnet_name" {
  description = "nom du vnet associé"
  type        = string
}
variable "vm_public_ip_address" {
  type        = bool
  description = "Public IP address boolean, leave it to false if not needed"
}


variable "location" {
  type        = string
  description = "Resource group name"
}

variable "custom_image_name" {
  type        = string
  description = "Nom de l'image customisée si besoin. (La variable vm_image devient alors nulle)"
  default     = ""
}

variable "custom_image_gallery_name" {
  type        = string
  description = "Nom de la galerie de l'image customisée si besoin."
  default     = ""
}