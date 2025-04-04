#!/bin/bash

if [ "$1" = "" ]; then
    echo "Usage: $0 path/to/backup/file.sql [new-domain.com]"
    echo
    echo "Note: The new domain is optional. If specified, it will update the URLs in the database."
    echo "The domain must also include the port if necessary (e.g., 'http://localhost:8080')."
    exit 1
fi

BACKUP_FILE=/$1
NEW_DOMAIN=$2

echo "Restoring from $BACKUP_FILE..."

echo "Restoring database in progress..."
docker-compose run --rm wpcli db import "$BACKUP_FILE" --allow-root --skip-ssl

# Update URLs in the database if necessary
if [ ! -z "$NEW_DOMAIN" ]; then
    echo "Updating URLs in the database with the new domain: $NEW_DOMAIN"
    OLD_DOMAIN=$(docker-compose run --rm wpcli option get siteurl --allow-root | tr -d '\r')

    if [ -z "$OLD_DOMAIN" ]; then
        echo "Error: unable to retrieve the old domain from the database."
        exit 1
    fi

    echo "Detected old domain: $OLD_DOMAIN"
    docker-compose run --rm wpcli search-replace "$OLD_DOMAIN" "$NEW_DOMAIN" --all-tables --allow-root
fi

echo "Restore completed!"