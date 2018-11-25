#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until everything has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Sane OSX defaults
./.macos.sh

# Requirements for some formula into homebrew
xcode-select --install

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install applications
brew update
brew upgrade
brew install ack
brew install curl
brew install git
brew install pyenv
brew install pyenv-virtualenv
brew install pyenv-virtualenvwrapper
brew install python3
brew install vim
brew install zsh
brew cask install docker
brew cask install dropbox
brew cask install evernote
brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install postman
brew cask install pycharm
brew cask install slack 
brew cask install transmission
brew cask install visual-studio-code
brew cask install zoomus
brew cleanup

# Install prezto and set zsh as default shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# Set python 3.6.7 as default
pyenv install 3.6.7
pyenv global 3.6.7

# Upgrade pip
pip install --upgrade pip

# Create folder to projects
mkdir ~/code

# Create symlink for dotfiles
ln -si  ~/dotfiles/.zshrc ~/.zshrc

# zsh
# Source Prezto.
echo 'if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then' >> ~/.zshrc
echo '  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"' >> ~/.zshrc
echo 'fi' >> ~/.zshrch
echo 'export PYENV_ROOT="$HOME/.pyenv"'>> ~/.zshrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"'>> ~/.zshrc
echo 'export WORKON_HOME=$HOME/.venvs'>> ~/.zshrc
echo 'export PROJECT_HOME=$HOME/code'>> ~/.zshrc
echo 'eval "$(pyenv init -)"'>> ~/.zshrc
echo 'pyenv virtualenvwrapper_lazy'>> ~/.zshrc
echo 'test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"'>> ~/.zshrc
echo 'export LC_ALL=en_US.UTF-8' >> ~/.zshrc
echo 'export LANG=en_US.UTF-8' >> ~/.zshrc
echo 'source ~/.iterm2_shell_integration.zsh' >> ~/.zshrc
echo 'source ~/.zshrc.local' >> ~/.zshrc

source ~/.zshrc
