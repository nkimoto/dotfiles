
# encoding
set LANG ja_JP.UTF-8
set LANGUAGE ja_JP.UTF-8
set LC_ALL ja_JP.UTF-8
set LC_MESSAGES ja_JP.UTF-8

# set alias
. ~/.config/fish/alias.fish

# Path to Oh My Fish install.
set -gx OMF_PATH $HOME/.local/share/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

# Use agoster theme
set fish_theme agnoster

# set peco find history
set fish_plugins theme peco
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
end

# export path
set PATH /usr/local/bin /usr/sbin $PATH

# set z script path
set -gx Z_SCRIPT_PATH /usr/local/bin/z.sh

# set encoding
set -gx LANG ja_JP.UTF-8
set -gx LANGUAGE ja_JP.UTF-8

# set docker host
set -gx DOCKER_HOST tcp://0.0.0.0:2375


# set pyenv
set -gx PYENV_ROOT "$HOME/.pyenv"
set -x PATH $PATH "$PYENV_ROOT/bin"
status --is-interactive; and . (pyenv init - | psub)
