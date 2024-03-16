# NeoConf

## Configuration for neovim


## Installation

1. On Windows from zero

1.1. Install Latest Microsoft Visual C++

1.2. Download neovim-qt https://github.com/equalsraf/neovim-qt/releases (no installer)

1.3. Create directory %USERPROFILE%\bin

1.4. Download neovim https://github.com/neovim/neovim/releases (no installer)

1.5. Extract archive to %USERPROFILE%\bin

1.6. Add %USERPROFILE%\bin and %USERPROFILE%\bin\nvim-win64 to PATH

1.7. Computer\HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\nvim-qt\command

1.8. Create directory %USERPROFILE%\repos

1.9. Install git for Windows https://git-scm.com/download/win

1.10. Clone repository git clone git@github.com:dmarov/neoconf.git

1.11. copy config dir to `:echo stdpath('config')` (`%LOCALAPPDATA%\nvim`)

1.12. create registry entry
```
HKEY_CURRENT_USER\Software\Classes\directory\Background\shell
"%USERPROFILE%\bin\nvim-win64\bin\nvim-qt.exe"
```

1.13. create registry entry
```
Computer\HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\nvim-qt
Icon=""%USERPROFILE%\bin\nvim-qt.exe",0
```

1.14. Install font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip

1.15. Install color theme

```
%USERPROFILE%\AppData\Local\nvim\autoload
https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim

%USERPROFILE%\AppData\Local\nvim\colors
https://raw.githubusercontent.com/joshdick/onedark.vim/main/colors/onedark.vim
```

1.16. Install packer
```
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```


1.18. Install packages inside neovim:
```
:source .\plugins.lua
:PackerSync
```

1.19. `:checkhealth`

1.20. Install Python https://www.python.org/ , add python.exe to path
```
pip install neovim
```

1.21. Install nodejs to PATH

set variable
```
LOCAL_NODE_PATH = %USERPROFILE%\bin\node-v20.11.1-win-x64
```

1.22.
Install pt https://github.com/monochromegane/the_platinum_searcher


1.23. Install nodejs packages
```
npm i -g typescript-language-server `
 vscode-langservers-extracted `
 stylelint-lsp `
 yaml-language-server `
 dockerfile-language-server-nodejs `
 emmet-ls `
 @fsouza/prettierd `
 @angular/language-server `
 @angular/language-service `
 @angular/cli `
 neovim `
 typescript
```

1.24. Install lua-language-server https://github.com/LuaLS/lua-language-server/releases 


2. On Arch Linux

Run sh script `./install-arch-linux.sh`

## TODO:
- fix angularls rename
- figure out import autofix on rename
- eslint config detection for windows
- lua_ls 'require' and 'vim'
- refactor lua config
- test in docker
