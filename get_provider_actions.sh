#!/bin/bash

if [ ! -f ".terraform.lock.hcl" ]; then
  terraform init -upgrade > /dev/null 2>&1
fi

# Handle specific provider
if [ -n "$1" ] && [ "$1" != "all" ] && [ "$1" != "json" ]; then
  provider_key=$(terraform providers schema -json | jq -r '.provider_schemas | keys[]' | grep "/${1}$")
  if [ -n "$provider_key" ]; then
    actions=$(terraform providers schema -json | jq -r ".provider_schemas.\"${provider_key}\" | .action_schemas // {} | keys[]" 2>/dev/null | sort)
    if [ -n "$actions" ]; then
      echo "{\"$1\": [$(echo "$actions" | sed 's/.*/"&"/' | tr '\n' ',' | sed 's/,$//')]}}"
    else
      echo "{\"$1\": []}"
    fi
  else
    echo "{\"$1\": []}"
  fi
  exit 0
fi

# Handle all providers (default)
providers=$(terraform providers schema -json | jq -r '.provider_schemas | keys[]' | sed 's|.*/||')

echo "{"
first=true
for provider in $providers; do
  [ "$first" = false ] && echo ","
  echo -n "  \"$provider\": ["
  
  provider_key=$(terraform providers schema -json | jq -r '.provider_schemas | keys[]' | grep "/${provider}$")
  if [ -n "$provider_key" ]; then
    actions=$(terraform providers schema -json | jq -r ".provider_schemas.\"${provider_key}\" | .action_schemas // {} | keys[]" 2>/dev/null | sort)
    [ -n "$actions" ] && echo "$actions" | sed 's/.*/"&"/' | tr '\n' ',' | sed 's/,$//'
  fi
  
  echo "]"
  first=false
done
echo "}"
