
# encoding
set LANG C.UTF-8
set LANGUAGE ja_JP.UTF-8
set LC_ALL C.UTF-8
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

# set z script path
set -gx Z_SCRIPT_PATH /usr/local/bin/z.sh

# set pyenv
set -q PYENV_ROOT; or set -gx PYENV_ROOT $HOME/.pyenv

# set anaconda
# source (conda info --root)/etc/fish/conf.d/conda.fish

# Pipenv
set -x PIPENV_VENV_IN_PROJECT 1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/kimoton/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
