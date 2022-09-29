#
# ~/.bash_profile
#
#source ~/.git-completion.bash No worky 

[[ -f ~/.bashrc ]] && . ~/.bashrc
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
PATH=$PATH:~/scripts:/usr/local/bin:$GEM_HOME/bin:~/.local/bin
#$LFS=/mnt/lfs 
