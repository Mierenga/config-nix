#########################################
## run this file to complete the setup ##
#########################################

# create a backup of the current bash and vim configurations
[ -f ~/.bashrc ] && mv ~/.bashrc ./.bashrc.original
[ -f ~/.bash_profile ] && mv ~/.bash_profile ./.bash_profile.original
[ -f ~/.vimrc ] && mv ~/.vimrc ./.vimrc.original

# point the ~/*rc files to this repo
echo "source ~/rc/.vimrc" > ~/.vimrc
echo "source ~/rc/.bashrc" > ~/.bashrc
echo "source ~/rc/.bash_profile" > ~/.bash_profile

# move our .vim directory into the home directory
cp -r ./.vim ~/.vim

# setup Vundle for vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
