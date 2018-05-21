# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
    tmux
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin
export PATH
#eval "$(pyenv init -)"
