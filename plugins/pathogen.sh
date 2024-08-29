#!/bin/bash

# Remove existing ~/.vim/bundle
echo "Removing existing $HOME/.vim/bundle directory..."
rm -rf $HOME/.vim/bundle

# Create necessary directories for Pathogen
echo "Creating directories for Pathogen..."
mkdir -p $HOME/.vim/autoload $HOME/.vim/bundle $HOME/.vim/undodir

# Download and install Pathogen
echo "Downloading and installing Pathogen..."
curl -LSso $HOME/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Clone plugins into the $HOME/.vim/bundle directory
echo "Cloning Vim plugins..."

# vim-lsp
git clone https://github.com/prabirshrestha/vim-lsp.git $HOME/.vim/bundle/vim-lsp

# vim-lsp-settings
git clone https://github.com/mattn/vim-lsp-settings.git $HOME/.vim/bundle/vim-lsp-settings

# vim-polyglot
git clone https://github.com/sheerun/vim-polyglot.git $HOME/.vim/bundle/vim-polyglot

# lightline.vim
git clone https://github.com/itchyny/lightline.vim.git $HOME/.vim/bundle/lightline.vim

# vim-unimpaired
git clone https://github.com/tpope/vim-unimpaired.git $HOME/.vim/bundle/vim-unimpaired

# fugitive.vim
git clone https://github.com/tpope/vim-fugitive.git $HOME/.vim/bundle/fugitive.vim

# vim-commentary
git clone https://github.com/tpope/vim-commentary.git $HOME/.vim/bundle/vim-commentary

# asyncomplete.vim
git clone https://github.com/prabirshrestha/asyncomplete.vim.git $HOME/.vim/bundle/asyncomplete.vim

# asyncomplete-lsp.vim
git clone https://github.com/prabirshrestha/asyncomplete-lsp.vim.git $HOME/.vim/bundle/asyncomplete-lsp.vim

# rose-pine colorscheme
git clone --depth=1 https://github.com/rose-pine/vim $HOME/.vim/bundle/rosepine

# undo tree 
git clone https://github.com/mbbill/undotree.git $HOME/.vim/bundle/undotree

# ctrlp
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git $HOME/.vim/bundle/ctrlp.vim

# # java lsp
# git clone https://github.com/lgranie/vim-lsp-java.git $HOME/.vim/bundle/vim-lsp-java

# Confirmation message
echo "Vim environment setup complete!"
