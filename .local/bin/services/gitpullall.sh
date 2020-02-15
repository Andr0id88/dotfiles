#Description:
# Pull --rebase all git repos in my repo folders and also my dotfiles

# Location of all my github projects
mygit=$HOME/github/myrepos

# My dotfile alias to my git bare repo
dotfiles="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Runs a git pull --rebase of all my git folders located in $mygit
find "$mygit" -name ".git" -type d -exec bash -c "echo '{}' && cd '{}'/.. && git pull --rebase" \;

# Runs a git pull --rebase on my dotfiles
$dotfiles pull --rebase
