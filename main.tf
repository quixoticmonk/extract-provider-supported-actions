terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    google = {
      source = "hashicorp/google"
    }
    tfe = {
      source = "hashicorp/tfe"
    }
    awscc = {
      source = "hashicorp/awscc"
    }
        bufo = {
      source = "austinvalle/bufo"
    }
    aap = {
      source = "ansible/aap"
      version = "1.4.0-devpreview1"
    }
    external = {
      source = "registry.terraform.io/hashicorp/external"
    }
  }
}
