# git_pull_all
This is a small bash script which performs a git pull for all git repositories in a specified parent folder. To specify the parent folder containing your git repositories, set the environment variable `GIT_REPOSITORIES_PATH` by adding a line like
```
export GIT_REPOSITORIES_PATH="/home/<username>/repos/"
```
to your `~/.profile`.