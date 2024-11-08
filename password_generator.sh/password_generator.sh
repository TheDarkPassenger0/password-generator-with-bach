#!/bin/bash

# Function to generate a random password
generate_password() {
  # Set default password length
  LENGTH=12

  # If a length is passed as an argument, use it instead of the default
  if [[ $# -eq 1 ]]; then
    LENGTH=$1
  fi

  # Use /dev/urandom to generate random characters and filter them
  PASSWORD=$(tr -dc 'A-Za-z0-9_@#$%&' < /dev/urandom | head -c $LENGTH)

  echo "Generated Password: $PASSWORD"
}

# Main execution
if [[ $# -gt 0 ]]; then
  generate_password $1  # Generate password based on user-provided length
else
  generate_password 12  # Default password length is 12
fi
