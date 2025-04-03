#!/bin/bash

echo "Starting WordPress environment..."
cd "$(dirname "$0")"
docker-compose up -d
echo "Services started successfully!"
echo "WordPress is available at: http://localhost:8080"
echo "phpMyAdmin is available at: http://localhost:8081"
