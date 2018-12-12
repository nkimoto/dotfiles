 # Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
 # Uncomment the following line if you don't like systemctl's auto-paging feature:
 ## 新しく作られたファイルのパーミッションがつねに 644 になるようにする。
umask 022
 # export SYSTEMD_PAGER=
export PATH=$HOME/miniconda3/bin:$HOME/bin:$PATH
 # User specific aliases and functions
 export LANG='ja_JP.UTF-8' 
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
 alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'shrc
 # Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
 # Uncomment the following line if you don't like systemctl's auto-paging feature:
 ## 新しく作られたファイルのパーミッションがつねに 644 になるようにする。
umask 022
 # export SYSTEMD_PAGER=
export PATH=$HOME/miniconda3/bin:$HOME/bin:$PATH
 # User specific aliases and functions
 export LANG='ja_JP.UTF-8' 
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'
 alias ls='ls -CF'
alias ll='ls -AlFh --show-control-chars --color=auto'
alias la='ls -CFal'
alias mv='mv -i'
alias rm='rm -i'
alias cp='cp -i'
alias sc='screen'
alias ps='ps --sort=start_time'


