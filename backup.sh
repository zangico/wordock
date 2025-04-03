#!/bin/bash
mkdir -p backups

DATE=$(date +%Y-%m-%d-%H%M%S)
BACKUP_FILE="/backups/wordpress-db-backup-$DATE.sql"

echo "🕒 Creating database backup in $BACKUP_FILE..."

if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

docker-compose run --rm wpcli db export "$BACKUP_FILE" --allow-root --skip-ssl

if [ $? -eq 0 ]; then
    echo "✅ Database backup completed successfully: $BACKUP_FILE"
else
    echo "❌ Error during database backup"
    exit 1
fi