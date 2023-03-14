# .bashrc will be executed with each bash subshell
# Use for example to set aliases (which aren't propagated automatically like environment variables are)

# print path line-by-line
alias path='echo $PATH | tr ":" "\n"'

# set common aliases
alias cls="clear"
alias repos="cd /mnt/c/git"

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -F'

# Add alias to use the git_pull_all.sh script everywhere
alias gitpullall="/mnt/c/git/blex-tools/git_pull_all/git_pull_all.sh"

# copy kubeconfigs from Windows to WSL
#rsync -ar /mnt/c/Users/<WINDOWS_USER>/.kube/ ~/.kube --exclude cache --exclude cache --exclude http-cache