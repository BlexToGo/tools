# .bashrc will be executed with each bash subshell
# use for example to set aliases (which aren't propagated automatically like environment variables are)

# print path line-by-line
alias path='echo $PATH | tr ":" "\n"'

# set common aliases
alias cls="clear"

# some more ls aliases
alias ls='ls -F'
alias ll='ls -alhF'
alias lR='ls -lhFR'
alias la='ls -A'

alias whitespace="sed 's/ /·/g;s/\t/￫/g;s/\r/§/g;s/$/¶/g'"

# Update bash history in realtime
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=5000
HISTFILESIZE=10000

# Change terminal setting to not suspend the terminal on Ctrl + S
stty -ixon


# git config
alias gitpullall="~/repos/tools/git_pull_all/git_pull_all.sh"
alias gitstashpull="git stash && git pull && git stash pop"


# kubectl config
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k


# terraform config
alias tf='terraform'
complete -C /usr/bin/terraform terraform
alias tfi='tf init'
alias tfp='tf plan'
alias tfa='tf apply'
alias tfip='tf init && tf plan'
alias tfia='tf init && tf apply'


# WSL specific

# copy kubeconfigs from Windows to WSL
# requires that the Windows user has the same name as the WSL user ($USER)
rsync -arP /mnt/c/users/$USER/.kube/ ~/.kube --exclude cache --exclude http-cache
alias repos="cd /mnt/c/git"