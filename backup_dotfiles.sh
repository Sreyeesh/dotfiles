#!/bin/bash

# Set up backup directory
BACKUP_DIR=~/dotfiles_backup
DOTFILES_DIR=~/dotfiles
mkdir -p $BACKUP_DIR
mkdir -p $DOTFILES_DIR

# List of dotfiles to back up and version control
DOTFILES=(
    ".zshrc"
    ".bashrc"
    ".vimrc"
    ".tmux.conf"
    ".config/starship.toml"
)

# Backup existing dotfiles
echo "Backing up existing dotfiles..."
for file in "${DOTFILES[@]}"; do
    if [ -f ~/$file ]; then
        cp ~/$file $BACKUP_DIR/$(basename $file)_backup
        echo "Backed up $file to $BACKUP_DIR"
    fi

done

# Move dotfiles to version-controlled directory
echo "Moving dotfiles to $DOTFILES_DIR..."
for file in "${DOTFILES[@]}"; do
    if [ -f ~/$file ]; then
        mv ~/$file $DOTFILES_DIR/$(basename $file)
        echo "Moved $file to $DOTFILES_DIR"
    fi

done

# Create symlinks
echo "Creating symlinks..."
for file in "${DOTFILES[@]}"; do
    ln -s $DOTFILES_DIR/$(basename $file) ~/$file
    echo "Symlinked $file"

done

# Initialize Git and push to GitHub
cd $DOTFILES_DIR
if [ ! -d .git ]; then
    git init
    echo "Initialized Git repository for dotfiles"
fi

git add .
git commit -m "chore: backup and version-control dotfiles"

echo "Creating GitHub repository and pushing dotfiles..."
gh repo create dotfiles --public --source=. --push

echo "Dotfiles are now backed up, version-controlled, and symlinked! 🚀"

