#!/bin/bash

# Check if BOT_TOKEN is set
if [ -z "$BOT_TOKEN" ]; then
  echo "Error: BOT_TOKEN environment variable is not set."
  exit 1
fi

# Function to log messages
log_message() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# Function to handle updates
handle_updates() {
  log_message "Checking for updates..."
  # Use 'yes' to automatically send 'y' as input when prompted
  if ! yes | python3 update_checker.py; then
    log_message "Update check failed. Check the logs for details."
    exit 1
  fi
  log_message "Update check completed successfully."
}

# Handle updates
handle_updates

# Run the bot and pass the token as input
log_message "Starting the bot..."
if ! (echo "$BOT_TOKEN" && yes) | python3 main.py; then
  log_message "Bot failed to start. Check the logs for details."
  exit 1
fi

log_message "Bot started successfully."
