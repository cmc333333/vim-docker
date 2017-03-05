#!/bin/sh

# Core packages
apt-get update
apt-get install -y curl \
                   git \
                   patch \
                   sudo \
                   vim

locale-gen en_US.UTF-8
update-locale

# @todo - Dev Packages

# Install nvm
mkdir /nvm
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.0/nvm.sh > /nvm/nvm.sh
curl https://raw.githubusercontent.com/creationix/nvm/v0.33.0/nvm-exec > /nvm/nvm-exec
chmod a+x /nvm/*

# Directory setup
mkdir -p /home/.vim/autoload /home/.vim/bundle /workdir

# Plugins
curl -Lo /home/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd /home/.vim/bundle
git clone --depth=1 https://github.com/bling/vim-airline.git
git clone --depth=1 https://github.com/ervandew/supertab.git
git clone --depth=1 https://github.com/jwhitley/vim-matchit.git
git clone --depth=1 https://github.com/scrooloose/nerdtree.git
git clone --depth=1 https://github.com/scrooloose/syntastic.git
git clone --depth=1 https://github.com/tpope/vim-commentary.git
git clone --depth=1 https://github.com/tpope/vim-fugitive.git
git clone --depth=1 https://github.com/tpope/vim-repeat.git
git clone --depth=1 https://github.com/tpope/vim-speeddating.git
git clone --depth=1 https://github.com/tpope/vim-surround.git
git clone --depth=1 https://github.com/ternjs/tern_for_vim.git

# Tern needs npm for installation. We'll use the nvm version later
apt-get install -y npm
cd tern_for_vim
npm install
apt-get remove -y npm

apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
rm -rf /var/cache/apt/*