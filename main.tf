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
      version = "1.0.12-beta.5"
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
# tfcoremock isn't visible from registry.hashicorp.io but there are 2 actions
    tfcoremock = {
      source = "hashicorp/tfcoremock"
    }
  }
}
