terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    azapi = {
      source = "Azure/azapi"
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
    ansible = {
      source = "ansible/ansible"
    }
    local = {
      source = "hashicorp/local"
    }
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
    mittwald = {
      source = "mittwald/mittwald"
    }
    panos = {
      source = "PaloAltoNetworks/panos"
    }
    scaleway = {
      source = "scaleway/scaleway"
    }
    foxcon = {
      source = "fox-md/foxcon"
    }
  }
}
