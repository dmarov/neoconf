#!/bin/sh 

pacman -Sy\
 xclip\
 neovim\
 python\
 python-pip\
 ttf-hack\
 lua-language-server

sudo pip install neovim
sudo pip install neovim-remote

cp -a ./config-dir/. ~/.config/nvim/

npm i -g typescript-language-server\
 vscode-langservers-extracted\
 stylelint-lsp\
 yaml-language-server\
 dockerfile-language-server-nodejs\
 emmet-ls\
 @fsouza/prettierd\
 @angular/language-server\
 @angular/language-service\
 @angular/cli\
 neovim\
 typescript
