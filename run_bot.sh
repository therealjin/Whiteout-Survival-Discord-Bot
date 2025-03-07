#!/bin/bash

# Check if BOT_TOKEN is set
if [ -z "$BOT_TOKEN" ]; then
  echo "Error: BOT_TOKEN environment variable is not set."
  exit 1
fi

# Create a temporary file to simulate user input
echo "$BOT_TOKEN" > /app/token_input.txt
echo "y" >> /app/token_input.txt  # Automatically answer "n" to the update prompt

# Run the bot and pass the token and update prompt response as input
python3 main.py < /app/token_input.txt

# Clean up the temporary file
rm /app/token_input.txt
