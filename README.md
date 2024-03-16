# NeoConf

## Configuration for neovim


## Installation

1. On Windows from zero

Install Latest Microsoft Visual C++

Download neovim-qt https://github.com/equalsraf/neovim-qt/releases (no installer)

Create directory %USERPROFILE%\bin

Download neovim https://github.com/neovim/neovim/releases (no installer)

Extract archive to %USERPROFILE%\bin

Add %USERPROFILE%\bin and %USERPROFILE%\bin\nvim-win64 to PATH

Computer\HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\nvim-qt\command

Create directory %USERPROFILE%\repos

Install git for Windows https://git-scm.com/download/win

Clone repository git clone git@github.com:dmarov/neoconf.git

copy config dir to :echo stdpath('config')
%LOCALAPPDATA%\nvim

HKEY_CURRENT_USER\Software\Classes\directory\Background\shell
"%USERPROFILE%\bin\nvim-win64\bin\nvim-qt.exe"

Computer\HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\nvim-qt
Icon=""%USERPROFILE%\bin\nvim-qt.exe",0

Install font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip

%USERPROFILE%\AppData\Local\nvim\autoload
https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim

%USERPROFILE%\AppData\Local\nvim\colors
https://raw.githubusercontent.com/joshdick/onedark.vim/main/colors/onedark.vim

git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

:source .\plugins-install.lua
:PackerSync

#Run powershell script `.\install-windows.ps1`

2. On Arch Linux

Run sh script `./install-arch-linux.sh`

## TODO:
- eslint config detection for windows
- lua_ls 'require' and 'vim'
- fix angularls rename
- refactor lua config
- test in docker
