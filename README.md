# NeoConf

## Configuration for neovim


## Installation

1. On Windows from zero

    1.1. Install Latest Microsoft Visual C++

    1.2. Create directory `%USERPROFILE%\bin`

    1.3. Download neovim https://github.com/neovim/neovim/releases/tag/v0.9.5 (no installer)

    1.4. Extract archive to `%USERPROFILE%\bin`

    1.5. Add `%USERPROFILE%\bin` and `%USERPROFILE%\bin\nvim-win64` to PATH

    1.6. Create directory `%USERPROFILE%\repos`

    1.7. Install git for Windows https://git-scm.com/download/win

    1.8. Clone repository `git clone git@github.com:dmarov/neoconf.git`

    1.9. copy config dir to `:echo stdpath('config')` (`%LOCALAPPDATA%\nvim`)
    ```
    Copy-Item -Path ".\config-dir\*" -Destination "$env:LOCALAPPDATA\nvim" -Recurse
    ```

    1.10. create registry entry
    ```
    HKEY_CURRENT_USER\Software\Classes\directory\Background\shell\nvim-qt\command
    ```
    with value
    ```
    Default="%USERPROFILE%\bin\nvim-win64\bin\nvim-qt.exe"
    ```

    1.11. create registry entry
    ```
    Computer\HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\nvim-qt
    ```
    with value
    ```
    Icon=""%USERPROFILE%\bin\nvim-qt.exe",0
    ```

    1.12. Install font https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Hack.zip

    1.13. Install color theme

    ```
    %USERPROFILE%\AppData\Local\nvim\autoload\onedark.vim
    https://raw.githubusercontent.com/joshdick/onedark.vim/main/autoload/onedark.vim

    %USERPROFILE%\AppData\Local\nvim\colors\onedark.vim
    https://raw.githubusercontent.com/joshdick/onedark.vim/main/colors/onedark.vim
    ```

    1.14. Install packer
    ```
    git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
    ```

    1.15. Install packages inside neovim:
    ```
    :source .\lua\plugins.lua
    :PackerSync
    ```

    1.16. `:checkhealth`

    1.17. Install Python https://www.python.org/ , add python.exe to path
    ```
    pip install neovim
    ```

    1.18. Install nodejs https://nodejs.org/en/download to PATH

    set variable
    ```
    LOCAL_NODE_PATH = %USERPROFILE%\bin\node-v20.11.1-win-x64
    LOCAL_NODE_MODULES_PATH = %USERPROFILE%\bin\node-v20.11.1-win-x64\node_modules
    ```

    1.19.
    Install pt https://github.com/monochromegane/the_platinum_searcher

    1.20. Install nodejs packages
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

    1.21. Install lua-language-server https://github.com/LuaLS/lua-language-server/releases 

2. On Arch Linux

    2.1. set environment variables

    ```
    export LOCAL_NODE_PATH=~/.nvm/versions/node/v18.19.0/bin/
    export LOCAL_NODE_MODULES_PATH=~/.nvm/versions/node/v18.19.0/lib/node_modules/
    ```

    2.2. install packages
    ```
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
    ```
