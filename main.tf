variable "resource_group_name" {
  description = "Name of the Azure Resource Group"
  type        = string
  # default     = "rg-ach-demo"
  default = "rg-terraform-state"
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
  default     = "centralus"
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default = {
    Environment = "Demo"
    Purpose     = "ACH File Processing"
    ManagedBy   = "Terraform"
  }
}

variable "target_principal_id" {
  description = "The Principal ID (Object ID) of the user, group, or service principal to assign the User Access Administrator role to."
  type        = string
}
