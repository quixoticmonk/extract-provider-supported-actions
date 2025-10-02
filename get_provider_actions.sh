#!/bin/bash

PROVIDER=${1:-aws}

cat > main.tf << EOF
terraform {
  required_providers {
    ${PROVIDER} = {
      source = "hashicorp/${PROVIDER}"
    }
  }
}
EOF

terraform init -upgrade > /dev/null 2>&1
terraform providers schema -json | jq -r ".provider_schemas.\"registry.terraform.io/hashicorp/${PROVIDER}\" | .action_schemas // {} | keys[]" | sort
rm -f main.tf .terraform.lock.hcl
rm -rf .terraform
