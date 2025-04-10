#!/bin/bash

echo "Stopping WordPress environment..."
cd "$(dirname "$0")"
docker compose down
echo "Services stopped successfully!"
