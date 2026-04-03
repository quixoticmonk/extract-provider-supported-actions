#!/usr/bin/env python3
import json
import os
import sys

def main(path=None):
    if path is None:
        base = os.path.dirname(os.path.abspath(__file__))
        path = os.path.join(base, 'actions-report.json')
    try:
        with open(path, 'r') as f:
            data = json.load(f)
    except Exception as e:
        print(f"Error reading {path}: {e}", file=sys.stderr)
        return 2

    total_providers = 0
    total_actions = 0

    if isinstance(data, dict):
        for provider, actions in sorted(data.items()):
            if isinstance(actions, list):
                count = len(actions)
            elif actions is None:
                count = 0
            else:
                try:
                    count = int(actions)
                except Exception:
                    count = 1
            if count > 0:
                total_providers += 1
                total_actions += count
                print(f"{provider}: {count}")
    else:
        print("JSON root is not an object with providers.")
        return 3

    print()
    print(f"Total providers: {total_providers}")
    print(f"Total actions: {total_actions}")
    return 0

if __name__ == '__main__':
    exit_code = main(sys.argv[1] if len(sys.argv) > 1 else None)
    sys.exit(exit_code)
