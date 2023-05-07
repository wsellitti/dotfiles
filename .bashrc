# bash
case $- in
    *i*) ;;
      *) return;;
esac
 
# History settings
#
# append to the history file, don't overwrite it
shopt -s histappend
# Protecting my history at all cost.
export HISTCONTROL=ignoreboth
export HISTFILE="$HOME/.archaeology"
export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTTIMEFORMAT="%y%b%dT%H%M%S "
# Search history with arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize
# make less more friendly for non-text input files, see lesspipe(1)
[[ -x /usr/bin/lesspipe ]] && eval "$(SHELL=/bin/sh lesspipe)"

if ! shopt -oq posix; then
  if [[ -f /usr/share/bash-completion/bash_completion ]]; then
    . /usr/share/bash-completion/bash_completion
  elif [[ -f /etc/bash_completion ]]; then
    . /etc/bash_completion
  fi
fi
#
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
alias batt="echo `cat /sys/class/power_supply/BAT0/status` \(`cat /sys/class/power_supply/BAT0/capacity`%\)"

# Prompt stuff
#
# Helper functions
ps_prompt_error_function () {
    err="${PIPESTATUS}"
    if [[ ${err} -ne 0 ]]; then
        echo "😮 ${err} "
    fi
}
# GIT PS1 Script
. ~/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto verbose"
GIT_PS1_STATESEPARATOR=" "
# GIT_PS1_COMPRESSSPARSESTATE=1
# GIT_PS1_OMITSPARSESTATE=1
GIT_PS1_SHOWCONFLICTSTATE="yes"
GIT_PS1_DESCRIBE_STYLE="default"
GIT_PS1_SHOWCOLORHINTS="1"
# GIT_PS1_HIDE_IF_PWD_IGNORED=1
# Prompt components
ps_sh_title="\[\e]0;\h:\w\a\]"
ps_username="\[\e[34m\]\u\[\e[m\]"
ps_hostname="\[\e[33m\]\h\[\e[m\]"
ps_work_dir="\[\e[31m\]\w\[\e[m\]"
ps_hist_num="\[\e[36m\]\!\[\e[m\]"
ps_sh_delim="\[\e[32m\]>>\[\e[m\]"
ps_git="\[\e[95m\]\$(__git_ps1 \"\n(%s)\")\[\e[m\]"
ps_err="\[\e[1;31m\]\$(ps_prompt_error_function)\[\e[m\]"
# Correct for ssh
if [[ -n $SSH_CONNECTION ]]; then
    ps_sh_title="\[\e]0;\u@\h:\w \a\]"
    ps_hostname="\[\e[5;7;93m\]\h\[\e[m\]"
fi
# Correct for root user
if [[ $(id -u) -eq 0 ]] ; then
    ps_username="\[\e[5;7;34m\]\u\[\e[m\]"
fi
# Wrapping these escape sequences in '[]' tries to print some weird characters
PS0="\e[1;4;37m\d \t\e[m\n"
PS1="${ps_sh_title}\n${ps_username} ${ps_hostname} ${ps_work_dir} ${ps_git}\n${ps_err}${ps_hist_num} ${ps_sh_delim} "
PS2=" \[\e[32m\]>>\[\e[m\] "
PS3=" \[\e[32m\]++\[\e[m\] "
PS4=" \[\e[32m\]<<\[\e[m\] "
#
export PROMPT_COMMAND=" history -a ; "
# Unset these things
unset ps_sh_title
unset ps_username
unset ps_hostname
unset ps_work_dir
unset ps_hist_num
unset ps_sh_delim
unset ps_git
unset ps_err
