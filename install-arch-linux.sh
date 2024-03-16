# DEPRECATED

#!/usr/bin/sh 

# requirements
# sudo pacman -S --needed \
#     xclip \
#     neovim \
#     python3 \
#     python-pip \
#     python2-pip \
#     ctags \
#     ttf-hack

pacman -Sy\
 xclip\
 neovim\
 python\
 python-pip\
 ttf-hack\
 lua-language-server

sudo pip install neovim
sudo pip install neovim-remote

cp -r ./config-dir ~/.config/nvim

npm i -g typescript-language-server\
 vscode-langservers-extracted\
 stylelint-lsp yaml-language-server\
 dockerfile-language-server-nodejs\
 emmet-ls\
 @fsouza/prettierd\
 @angular/language-server
cd ~
