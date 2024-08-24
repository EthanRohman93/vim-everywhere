#!/bin/bash

# Create necessary directories for Pathogen
echo "Creating directories for Pathogen..."
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/undodir

# Download and install Pathogen
echo "Downloading and installing Pathogen..."
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Clone plugins into the ~/.vim/bundle directory
echo "Cloning Vim plugins..."

# vim-lsp
git clone https://github.com/prabirshrestha/vim-lsp.git ~/.vim/bundle/vim-lsp

# vim-lsp-settings
git clone https://github.com/mattn/vim-lsp-settings.git ~/.vim/bundle/vim-lsp-settings

# vim-polyglot
git clone https://github.com/sheerun/vim-polyglot.git ~/.vim/bundle/vim-polyglot

# fzf.vim
git clone https://github.com/junegunn/fzf.vim.git ~/.vim/bundle/fzf.vim

# lightline.vim
git clone https://github.com/itchyny/lightline.vim.git ~/.vim/bundle/lightline.vim

# vim-unimpaired
git clone https://github.com/tpope/vim-unimpaired.git ~/.vim/bundle/vim-unimpaired

# fugitive.vim
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive.vim

# vim-commentary
git clone https://github.com/tpope/vim-commentary.git ~/.vim/bundle/vim-commentary

# syntastic
git clone https://github.com/vim-syntastic/syntastic.git ~/.vim/bundle/syntastic

# asyncomplete.vim
git clone https://github.com/prabirshrestha/asyncomplete.vim.git ~/.vim/bundle/asyncomplete.vim

# asyncomplete-lsp.vim
git clone https://github.com/prabirshrestha/asyncomplete-lsp.vim.git ~/.vim/bundle/asyncomplete-lsp.vim

# rose-pine colorscheme
git clone --depth=1 https://github.com/rose-pine/vim $HOME/.vim/bundle/rosepine
git clone https://github.com/mbbill/undotree.git ~/.vim/bundle/undotree
git clone --depth=1 https://github.com/ctrlpvim/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
# # java lsp
# git clone https://github.com/lgranie/vim-lsp-java.git $HOME/.vim/bundle/vim-lsp-java

# Confirmation message
echo "Vim environment setup complete!"

