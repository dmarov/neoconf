# might be required for some plugins installation
#Set-ExecutionPolicy unrestricted

# to find out where config should be
# :echo stdpath('config')

# needs to be performed as admin
New-Item -Path "~/AppData/Local/nvim" -ItemType SymbolicLink -Value "~/repos/neovim-config"

# install Packer
# :source .\lua\plugins-install.lua
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

choco install python3 neovim lua-language-server nvm
# need add write permission for C:\ProgramData\chocolatey\lib\lua-language-server\tools\x64\log manually

nvm install 18.19.0
nvm use 18.19.0

pip install neovim

nvim -c :PackerSync -c :q

npm i -g typescript-language-server `
 vscode-langservers-extracted `
 stylelint-lsp `
 yaml-language-server `
 dockerfile-language-server-nodejs `
 emmet-ls `
 @fsouza/prettierd `
 @angular/language-server `
 neovim `
 typescript
