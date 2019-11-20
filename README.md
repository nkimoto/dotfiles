# settings

## .config

fish config file

Installation
```
$ curl -L https://get.oh-my.fish | fish
$ omf install peco
$ omf install z
$ omf install agnoster
```

## .tmux.conf

Read conf 
```
tmux source-file ~/.tmux.conf
```

## .vimrc

### Install NeoBundle
1. Make `.vim/bundle` directory  

        $ mkdir -p ~/.vim/bundle


1. clone `neobundle.vim` to `.vim/bundle`

        $ git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

1. Start up vim

        $ vim

## Others
### pyenv
`fish.config`
```fish.config
set -q PYENV_ROOT; or set -gx PYENV_ROOT $HOME/.pyenv
```

### nodebrew
```
curl -L git.io/nodebrew | perl - setup
set -U fish_user_paths /home/kimoton/.nodebrew/current/bin $fish_user_paths
```


### Jupyterlab extensions
```
jupyter labextension install jupyterlab_vim
jupyter labextension install @jupyterlab/toc
jupyter labextension install @lckr/jupyterlab_variableinspector
```
