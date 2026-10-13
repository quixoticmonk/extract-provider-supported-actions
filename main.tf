terraform {
  required_providers {
    aap = {
      source = "ansible/aap"
    }
    akamai = {
      source = "akamai/akamai"
    }
    ansible = {
      source = "ansible/ansible"
    }
    aws = {
      source = "hashicorp/aws"
    }
    awscc = {
      source = "hashicorp/awscc"
    }
    azapi = {
      source = "Azure/azapi"
    }
    azurerm = {
      source = "hashicorp/azurerm"
    }
    bufo = {
      source = "austinvalle/bufo"
    }
    clumio = {
      source = "clumio-code/clumio"
    }
    docker = {
      source = "kreuzwerker/docker"
    }
    elastic = {
      source = "elastic/elasticstack"
    }
    fivetran = {
      source = "fivetran/fivetran"
    }
    foxcon = {
      source = "fox-md/foxcon"
    }
    google = {
      source = "hashicorp/google"
    }
    google-beta = {
      source = "hashicorp/google-beta"
    }
    hcloud = {
      source = "hetznercloud/hcloud"
    }
    ibm = {
      source = "IBM-Cloud/ibm"
    }
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
    juju = {
      source = "juju/juju"
    }
    latitudesh = {
      source = "latitudesh/latitudesh"
    }
    local = {
      source = "hashicorp/local"
    }
    meraki = {
      source = "CiscoDevNet/meraki"
    }
    mittwald = {
      source = "mittwald/mittwald"
    }
    nxos = {
      source = "CiscoDevNet/nxos"
    }
    panos = {
      source = "PaloAltoNetworks/panos"
    }
    scaleway = {
      source = "scaleway/scaleway"
    }
    scm = {
      source  = "PaloAltoNetworks/scm"
    }
    stripe = {
      source = "stripe/stripe"
    }
    tencentcloud = {
      source = "tencentcloudstack/tencentcloud"
    }
    terracurl = {
      source = "devops-rob/terracurl"
    }
    tfe = {
      source = "hashicorp/tfe"
    }
    tfcoremock = {
      source = "hashicorp/tfcoremock"
      version = "0.6.0-beta2"
    }
  }
}
