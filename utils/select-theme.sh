#!/bin/bash

# Get all .omp.json files in the current directory
themes=(*.omp.json)

echo "Let's start"

# Check if there are any theme files
if [ ${#themes[@]} -eq 0 ]; then
    echo "No .omp.json theme files found in the current directory"
    exit 1
fi

# Print header
echo "Available Oh My Posh themes:"
echo "-------------------------"

# Create selection menu
select theme in "${themes[@]}"; do
    if [ -n "$theme" ]; then
        # Remove existing symlink if it exists
        if [ -L "_in-use-simlink.json" ]; then
            rm "_in-use-simlink.json"
        fi

        # Create new symlink
        ln -s "$theme" "_in-use-simlink.json"
        echo "Theme switched to: $theme"
        break
    else
        echo "Invalid selection. Please try again."
    fi
done 