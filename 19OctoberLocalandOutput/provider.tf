terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.8.0"
    }
  }
}

provider "azurerm" {
  features {
    
  }
  subscription_id = "b806f439-4e29-426a-8a67-4ed653958018"
}