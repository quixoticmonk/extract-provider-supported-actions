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

# Capture schema once to a temp file; terraform provider schemas are deeply
# nested and exceed jq's default recursion depth limit (jq < 1.8 has no flag
# to raise it, so we use Python's json module which has no such limit).
SCHEMA_FILE=$(mktemp)
trap 'rm -f "$SCHEMA_FILE"' EXIT
terraform providers schema -json > "$SCHEMA_FILE"

# Handle specific provider
if [ -n "$PROVIDER" ]; then
  python3 - "$SCHEMA_FILE" "$PROVIDER" "$SCHEMA_KEY" <<'EOF'
import sys, json
schema = json.load(open(sys.argv[1]))
provider = sys.argv[2]
schema_key = sys.argv[3]
match = next((k for k in schema["provider_schemas"] if k.endswith("/" + provider)), None)
if match:
    keys = sorted(schema["provider_schemas"][match].get(schema_key, {}).keys())
    print(json.dumps({provider: keys}))
else:
    print(json.dumps({provider: []}))
EOF
  exit 0
fi

# Handle all providers (default)
python3 - "$SCHEMA_FILE" "$SCHEMA_KEY" <<'EOF'
import sys, json
schema = json.load(open(sys.argv[1]))
schema_key = sys.argv[2]
result = {}
for full_key, pschema in schema["provider_schemas"].items():
    short = full_key.split("/")[-1]
    result[short] = sorted(pschema.get(schema_key, {}).keys())
print(json.dumps(result, indent=2))
EOF
