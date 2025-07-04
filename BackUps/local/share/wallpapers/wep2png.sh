#!/bin/bash

# Initialize a counter
counter=1

# Function to generate a 4-character alphanumeric name
generate_name() {
    printf "%04s" "$(echo "obase=36; $1" | bc)"
}

# Process all .webp, .jpeg, and .jpg files
for file in *.webp *.jpeg *.jpg; do
    # Check if there are no matching files
    [ -e "$file" ] || continue

    # Generate a 4-character name
    name=$(generate_name "$counter")

    # Convert to PNG
    convert "$file" "${name}.png"

    # Increment counter
    ((counter++))
done
