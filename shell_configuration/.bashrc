# .bashrc will be executed with each bash subshell
# use for example to set aliases (which aren't propagated automatically like environment variables are)

# print path line-by-line
alias path='echo $PATH | tr ":" "\n"'

# set common aliases
alias cls="clear"

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -F'

# add alias to use the git_pull_all.sh script everywhere
alias gitpullall="~/repos/tools/git_pull_all/git_pull_all.sh"

# Update bash history in realtime
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# Change terminal setting to not suspend the terminal on Ctrl + S
stty -ixon


# WSL specific

# copy kubeconfigs from Windows to WSL
# requires that the Windows user has the same name as the WSL user ($USER)
rsync -arP /mnt/c/users/$USER/.kube/ ~/.kube --exclude cache --exclude http-cache

alias repos="cd /mnt/c/git"