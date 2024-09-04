import json
import os
from datetime import datetime, timedelta

KEY_FILE = 'keys.txt'

def load_keys():
    if os.path.exists(KEY_FILE):
        with open(KEY_FILE, 'r') as f:
            try:
                return json.load(f)
            except json.JSONDecodeError:
                return []
    return []

def save_keys(keys):
    with open(KEY_FILE, 'w') as f:
        json.dump(keys, f, indent=4)

def cleanup_expired_keys():
    keys = load_keys()
    now = datetime.now()
    new_keys = []

    for key in keys:
        if key['taken_at']:
            taken_at = datetime.fromtimestamp(key['taken_at'])
            if now - taken_at < timedelta(days=1):
                new_keys.append(key)

    save_keys(new_keys)

if __name__ == "__main__":
    cleanup_expired_keys()
