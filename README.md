# Wordock: WordPress Docker Environment

Wordock is a Docker-based environment for running and managing a WordPress site. It includes services for WordPress, MariaDB, phpMyAdmin, and WP-CLI, making it easy to develop, test, and manage WordPress projects.

## Features

- **WordPress, MariaDB, and phpMyAdmin**: A complete WordPress stack with a user-friendly interface for database management.    
- **Backup and Restore**: Scripts to back up and restore the WordPress database.

## Prerequisites

- Docker and Docker Compose must be installed on your system.
- Copy `.env.dist` to `.env` and customize the environment variables as needed.

## Getting Started

### Starting the Environment

Run the following command to start the WordPress environment:

```bash
./run.sh
```

- WordPress will be available at [http://localhost:8080](http://localhost:8080).
- phpMyAdmin will be available at [http://localhost:8081](http://localhost:8081).

### Stopping the Environment

To stop the environment, run:

```bash
./stop.sh
```

## Database Backup and Restore

### Backup

To create a backup of the WordPress database, run:

```bash
./backup.sh
```

The backup file will be saved in the `backups` directory with a timestamped filename.

### Restore

To restore the database from a backup file, run:

```bash
./restore.sh path/to/backup/file.sql [new-domain.com]
```

- Replace `path/to/backup/file.sql` with the path to your backup file.
- Optionally, specify a new domain (e.g., `http://new-domain.com`) to update URLs in the database.

## Customization

- Add your custom themes to `wp-content/themes/custom-theme/`.
- Add your custom plugins to `wp-content/plugins/custom-plugin/`.

## License

This project is licensed under the MIT License. See the `LICENSE` file for details.