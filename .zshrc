export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export WORKON_HOME=$HOME/.venvs
export PROJECT_HOME=$HOME/code
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
source ~/.iterm2_shell_integration.zsh
source ~/.zshrc.local
