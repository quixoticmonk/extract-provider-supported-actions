#!/bin/bash

if [ ! -f ".terraform.lock.hcl" ]; then
  terraform init -upgrade > /dev/null 2>&1
fi

# Handle specific provider
if [ -n "$1" ] && [ "$1" != "all" ] && [ "$1" != "json" ]; then
  provider_key=$(terraform providers schema -json | jq -r '.provider_schemas | keys[]' | grep "/${1}$")
  if [ -n "$provider_key" ]; then
    terraform providers schema -json | jq -r "{\"$1\": (.provider_schemas.\"${provider_key}\" | .action_schemas // {} | keys | sort)}"
  else
    echo "{\"$1\": []}"
  fi
  exit 0
fi

# Handle all providers (default)
terraform providers schema -json | jq -r '
  .provider_schemas | 
  to_entries | 
  map({key: (.key | split("/")[-1]), value: (.value.action_schemas // {} | keys | sort)}) | 
  from_entries
'
