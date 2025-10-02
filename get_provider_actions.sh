#!/bin/bash

PROVIDER=${1:-all}

if [ ! -f ".terraform.lock.hcl" ]; then
  terraform init -upgrade > /dev/null 2>&1
fi

if [ "$PROVIDER" = "all" ]; then
  # Get actions from all providers
  terraform providers schema -json | jq -r '.provider_schemas | to_entries[] | .key as $provider | .value.action_schemas // {} | keys[] | "\($provider | split("/")[-1])_\(.)"' | sort
else
  # Get all provider schema keys and find the one matching our provider
  provider_key=$(terraform providers schema -json | jq -r '.provider_schemas | keys[]' | grep "/${PROVIDER}$")
  
  if [ -n "$provider_key" ]; then
    terraform providers schema -json | jq -r ".provider_schemas.\"${provider_key}\" | .action_schemas // {} | keys[]" | sort
  fi
fi
