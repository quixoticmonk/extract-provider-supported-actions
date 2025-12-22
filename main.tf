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
    google-beta = {
      source = "hashicorp/google-beta"
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
      source  = "ansible/aap"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}
