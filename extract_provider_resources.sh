#!/bin/bash

# Usage: ./extract_provider_resources.sh [actions|list] [provider_name]
# Examples:
#   ./extract_provider_resources.sh actions aws
#   ./extract_provider_resources.sh list
#   ./extract_provider_resources.sh actions

TYPE=${1:-actions}
PROVIDER=$2

if [[ "$TYPE" != "actions" && "$TYPE" != "list" ]]; then
  echo "Usage: $0 [actions|list] [provider_name]"
  exit 1
fi

SCHEMA_KEY=$([ "$TYPE" = "actions" ] && echo "action_schemas" || echo "list_resource_schemas")

terraform init -upgrade > /dev/null 2>&1

# Handle specific provider
if [ -n "$PROVIDER" ]; then
  provider_key=$(terraform providers schema -json | jq -r '.provider_schemas | keys[]' | grep "/${PROVIDER}$")
  if [ -n "$provider_key" ]; then
    terraform providers schema -json | jq -r "{\"$PROVIDER\": (.provider_schemas.\"${provider_key}\" | .${SCHEMA_KEY} // {} | keys | sort)}"
  else
    echo "{\"$PROVIDER\": []}"
  fi
  exit 0
fi

# Handle all providers (default)
terraform providers schema -json | jq -r "
  .provider_schemas | 
  to_entries | 
  map({key: (.key | split(\"/\")[-1]), value: (.value.${SCHEMA_KEY} // {} | keys | sort)}) | 
  from_entries
"
