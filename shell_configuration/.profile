# .profile will be executed once per session
# Use for example to load environment variables

# Add ssh identity to pull git repos via ssh
eval "$(ssh-agent)"
ssh-add ~/.ssh/*_rsa

# Add $GIT_REPOSITORIES_PATH for use in git_pull_all\git_pull_all.sh
export GIT_REPOSITORIES_PATH="/mnt/c/git"

# Add the paths of all kubeconfig files to the $KUBECONFIG env variable
export KUBECONFIG=$(find ~/.kube -type f | sed ':a;N;s/\n/:/;ba')