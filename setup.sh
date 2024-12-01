#!/bin/bash

# Variables
SCRIPT_NAME="mansplain.py"
SCRIPT_DIR="$(pwd)" 
SYMLINK_DIR="/usr/local/bin"
SYMLINK_PATH="$SYMLINK_DIR/mansplain"

# Check if the script exists
if [ ! -f "$SCRIPT_NAME" ]; then
    echo "Error: $SCRIPT_NAME not found in the current directory."
    exit 1
fi

# Create the scripts directory if it doesn't exist
if [ ! -d "$SCRIPT_DIR" ]; then
    echo "Creating directory $SCRIPT_DIR..."
    mkdir -p "$SCRIPT_DIR"
fi

# Make the script executable
echo "Making $SCRIPT_NAME executable..."
chmod +x "$SCRIPT_DIR/$SCRIPT_NAME"
if [ $? -ne 0 ]; then
    echo "Error: Failed to make $SCRIPT_NAME executable."
    exit 1
else
    echo "$SCRIPT_NAME is now executable."
fi

# Create a symbolic link in /usr/local/bin
echo "Creating symbolic link at $SYMLINK_PATH..."
if [ ! -d "$SYMLINK_DIR" ]; then
    echo "Error: Directory $SYMLINK_DIR does not exist. Please create it or choose another directory in your PATH."
    exit 1
fi

ln -sf "$SCRIPT_DIR/$SCRIPT_NAME" "$SYMLINK_PATH"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create symbolic link at $SYMLINK_PATH."
    exit 1
else
    echo "Symbolic link created successfully at $SYMLINK_PATH."
fi

# Ensure /usr/local/bin is in PATH
if [[ ":$PATH:" != *":$SYMLINK_DIR:"* ]]; then
    echo "Adding $SYMLINK_DIR to PATH..."
    echo "export PATH=\"$SYMLINK_DIR:\$PATH\"" >> "$HOME/.bashrc"
    source "$HOME/.bashrc"
    echo "$SYMLINK_DIR added to PATH."
else
    echo "$SYMLINK_DIR is already in PATH."
fi

echo "Setup complete! You can now use the 'mansplain' command from the terminal."
