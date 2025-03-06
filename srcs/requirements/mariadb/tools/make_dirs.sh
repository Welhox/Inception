#!/bin/bash

# Define base data directory
DATA_DIR="/home/$(whoami)/data"

# Create base directory if missing
if [ ! -d "$DATA_DIR" ]; then
    mkdir -p "$DATA_DIR"
fi

# Create MariaDB and WordPress directories if missing
for dir in "mariadb" "wordpress"; do
    if [ ! -d "$DATA_DIR/$dir" ]; then
        mkdir -p "$DATA_DIR/$dir"
    fi
done

# Set correct permissions for MariaDB
sudo chown -R 999:999 "$DATA_DIR/mariadb"
sudo chmod -R 750 "$DATA_DIR/mariadb"

echo "Directories set up successfully!"
