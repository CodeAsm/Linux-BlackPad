#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
alias ls='ls --color=auto'

export EDITOR="nano"
export HISTIGNORE="pwd;passwd"
# append to the history file, don't overwrite it
shopt -s histappend
export MSBuildSDKsPath="/usr/share/dotnet/sdk/3.1.103/Sdks";

# Use this when using SSH and GnuPG
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
gpgconf --launch gpg-agent

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# enlagre limited Max opened files
ulimit -n 1024

#efficient tricks and typo fixes
# a quick way to get out of current directory ##
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../../../'
#alias path='echo -e ${PATH//:/\\n}'
alias today='date +"%d-%m-%Y"'
alias todaytime='date +"%d-%m-%Y %H:%M"'

CURRENTUSER=`whoami`
if [ "$CURRENTUSER" = "root" ]; then

  PS1="\[\033[35m\]\t\[\033[m\] \`if [ \$? = 0 ]; then echo \[\e[32m\]${EMG}ツ\[\e[0m\]; else echo \[\e[31m\]${EMG}✗ \[\e[0m\]; fi\`[\[\033[1;31m\]\u\[\033[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[94m\]\w\[\e[0m\]]\\$ \[\e[m\]" 
  
else

#My personal favorite Bash PS1 with colors and bad or good last command icon.
PS1="\[\033[35m\]\t\[\033[m\] \`if [ \$? = 0 ]; then echo \[\e[32m\]${EMG}ツ\[\e[0m\]; else echo \[\e[31m\]${EMG}✗ \[\e[0m\]; fi\`[\[\e[92m\]\u\[\e[0m\]@\[\e[1;34m\]\h\[\e[0m\]:\[\e[94m\]\w\[\e[0m\]]\\$ \[\e[m\]" 

fi

#(__git_ps1 "%s")
#$(__git_ps1 "%s")
. ~/.bash_profile
