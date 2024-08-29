#!/bin/bash

# run pathogen get
./plugins/pathogen.sh

# copy vimrc
cp ./.vimrc $HOME/.vimrc

# run server install

./servers/detect_languages.sh
