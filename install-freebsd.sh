# DEPRECATED
#!/bin/sh 

if [ $(uname) == 'FreeBSD' ];
then
sudo pkg install -y \
    curl \
    git \
    python36 \
    python27 \
    yarn \
    node \
    xclip \
    neovim \
    global \
    rubygem-gems \
    py27-pip \
    py36-pip \
    ctags \
    python3 \
    #    npm \
    #    ctags \
        #    the_silver_searcher \
        #    coreutils \
        #    libexo \
        #    liberation-fonts-ttf \

#sudo yarn global add postcss-cli autoprefixer
#sudo easy_install-3.5 pip
#sudo pip2 install pynvim
sudo pip-3.6 install neovim
sudo pip-2.7 install neovim
yarn global add neovim
sudo gem install neovim
#sudo pip install neovim-remote

# create folders
mkdir -p ~/.config/nvim/autoload
mkdir -p ~/.config/nvim/plugged
mkdir -p ~/.config/nvim/colors

# install plug
curl -fLo ~/.config/nvim/autoload/plug.vim \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install configs
ln -s `pwd` ~/.config/nvim

cd ~

nvim -c PlugUpgrade -c PlugInstall -c PlugUpdate -c q -c q
nvim -c UpdateRemotePlugins -c q -c q

echo done!
fi;
