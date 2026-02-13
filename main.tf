terraform {
  required_version = ">= 1.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
  use_oidc = true
}

# Resource Group
resource "azurerm_resource_group" "rg-meghankulkarni-testpoc" {
  name     = var.resource_group_name
  location = var.location

  tags = var.tags
}

resource "azurerm_role_assignment" "user_access_admin" {
  scope                = azurerm_resource_group.rg-meghankulkarni-testpoc.id
  role_definition_name = "User Access Administrator"
  principal_id         = var.target_principal_id
}

data "azurerm_client_config" "current" {}

import {
  to = azurerm_resource_group.rg-meghankulkarni-testpoc
  id = "/subscriptions/${data.azurerm_client_config.current.subscription_id}/resourceGroups/${var.resource_group_name}"
}
