#
# ~/.bash_profile
#
#source ~/.git-completion.bash No worky 

#[[ -f ~/.bashrc ]] && . ~/.bashrc
PATH=$PATH:~/scripts:/usr/local/bin:$(ruby -e 'puts Gem.user_dir')/bin:~/.local/bin
#$LFS=/mnt/lfs 
