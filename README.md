# Andr0id88 dotfiles


## Table of Contents

+ [Screenshots](#screenshots)
+ [Introduction](#introduction)
+ [Scripts](#scripts)
+ [Setup Repository](#setup-repository)
+ [Files](#track-files)
+ [Restore Configurations](#restore-configurations)
+ [Additional Commands](#additional-commands)
+ [Insipration](#inspiration)

## Screenshots
### i3-gaps, ranger & firefox with custom interactive startpage
![I3-gaps](https://github.com/Andr0id88/kalivoidrice/blob/master/i3.png "i3-gaps")

### Tmux with powerline
![Tmux](https://github.com/Andr0id88/kalivoidrice/blob/master/tmux.png "Tmux")


## Introduction
These are my dotfiles used for my Arch Linux OS, this repo contain configs for:

* htop (prosess inspector tool)
* i3wm/i3-gaps (window manager)
* i3blocks (status bar)
* newsboat (rss reader)
* nvim (text editor)
* ranger (file manager)
* surfraw (bookmark manager)
* sxhkd (general key binder)
* tmux (terminal multiplexer)
* vifm (file manager)
* zathura (pdf viewer)
* zsh (shell)
* Also other config files, for example xdg default programs, inputrc and more.

#### Who is it aimed for?
For the most part myself, but if anyone else see any use of any of this, please feel free to help yourself. I am only using i3wm, so if you are a GUI person some of the config files wont be of much use to you.

### Scripts
There are numerous custom scripts located [here](https://github.com/Andr0id88/dotfiles/tree/master/.local/bin/tools), most of the scripts are self explanatory and contains comments for further explanations.
Some of the scripts are used for making the dmenu\rofi workflow abit more streamlined, they are all called rofi-?

### Github
There is also some custom github scripts called [gapush](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/gapush), [gapull](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/gapull) and [gastat](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/gastat). These are used for looping over many subfolders from my githubrepo folder were i keep my projects for easy management.

They can be used as a systemd service to have all git repo's push when you turn on the pc, and pull when you turn it on, to easily sync betwen stationary and laptop for e.g. If you use the dotfile alias to sync your dotfiles these scripts will also include that command aswell.

### Shortcuts
It contains 2 files called [bmdirs](https://github.com/Andr0id88/dotfiles/blob/master/.config/bmdirs) and a file called [bmfiles](https://github.com/Andr0id88/dotfiles/blob/master/.config/bmfiles).
In these 2 files you can write down high traffic folders or files. These will automaticly sync to bashrc, zshrc, fish, ranger, vifm and more using [this](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/shortcuts) script.

### Alias
Most of the usefull aliases can be found in the [getkeys](https://github.com/Andr0id88/dotfiles/tree/master/.config/getkeys) folder, and invoked and watched from the CLI by simply typing getkeys. There are also built in [cheatsheets](https://github.com/Andr0id88/dotfiles/tree/master/.config/getvimkeys) for vim plugins that also can be invoked from the cli with the command getvimkeys.

### Custom startpage
There is also a [dockerfile script](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/hpage) that starts a local web-server with a [Tilde Enhanced](https://github.com/Andr0id88/devops/tree/master/docker/homepage/website) website. I did this to be able to have my own *new tab* custom page, due to the fact that you cant change tab page in firefox.

## Setup Repository
#### **Warning**: **If you want to give these dotfiles a try, you should first fork or clone this repo, review the code, and remove things you don't want or need. Don't blindly use my settings unless you know what that entails. Use at your own risk.**


Setup a bare git repository in your home directory. Bare repositories have no
working directory, so setup an alias to avoid typing the long command. Add the
git directory `~/.dotfiles/` to the gitignore as a security measure. Setup
remote and push. Hide untracked files when querying the status.

```bash
git init --bare "$HOME/.cfg"

echo 'alias dotfiles="/usr/bin/env git --git-dir=$HOME/.cfg/ --work-tree=$HOME"' \
    >> "$HOME/.zshrc"
source "$HOME/.zshrc"

echo '.cfg' >> "$HOME/.gitignore"
dotfiles add "$HOME/.gitignore"
dotfiles commit -m 'Git: Add gitignore'

dotfiles remote add origin git@github.com:Andr0id88/dotfiles.git
dotfiles push --set-upstream origin master
dotfiles config --local status.showUntrackedFiles no
```

## Track Files

Use the default git subcommands to track, update and remove files. You can
obviously also use branches and all other features of git.

```bash
dotfiles status
dotfiles add .zshrc
dotfiles commit -m 'Zsh: Add zshrc'
dotfiles add .vimrc
dotfiles commit -m 'Vim: Add vimrc'
dotfiles push
```

To remove a file from the repository while keeping it locally you can use:

```bash
dotfiles rm --cached ~/.some_file
```

## Restore Configurations

First clone dependent repositories, in this case for example `oh-my-zsh`. Clone
your dotfiles repository as bare repository. Setup temporary alias and then
checkout. If there exist files that collide with your repository (like a default
`.bashrc`), the files will be moved to `~/.dotfiles.bak/`. Then update all
submodules and again hide untracked files when querying the status.

```bash
git clone https://github.com/robbyrussell/oh-my-zsh \
    "$HOME/.oh-my-zsh"

git clone --bare --recursive git@github.com:Andr0id88/dotfiles \
    "$HOME/.cfg"

function dotfiles() {
    /usr/bin/env git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
}

dotfiles checkout
if [ "$?" -ne 0 ]; then
    mkdir -p "$HOME/.dotfiles.bak"
    dotfiles checkout 2>&1 \
        | grep -P '^\s+[\w.]' \
        | awk {'print $1'} \
        | xargs -I{} sh -c 'cp -r --parents "{}" "$HOME/.dotfiles.bak/" && rm -rf "{}"'
    dotfiles checkout
fi

dotfiles submodule update --recursive --remote
dotfiles config --local status.showUntrackedFiles no
```

Note that the automatic moving of already existing (thus conflicting) files
fails if there are too many of them (git cuts the message at some point).

## Additional Commands

Instead of the alias provided above, you can use following function. `listall`
will show all tracked files, `listtree` will show those files in a tree format
(requires the package `treeify`). You may need to use a pager for these
commands.

```bash
dotfiles() {
    case "$1" in
        listall)
            shift
            dotfiles ls-tree --full-tree -r --name-only HEAD "$@"
            ;;
        listtree)
            shift
            if hash treeify 2>/dev/null; then
                dotfiles ls-tree --full-tree -r --name-only HEAD "$@" | treeify
            else
                dotfiles listall
            fi
            ;;
        *)
            /usr/bin/env git --git-dir="$HOME/.cfg/" --work-tree="$HOME" "$@"
            ;;
    esac
}
```

`compdef` can provide `zsh` autocompletion of the `git` command for your
equivalent `dotfiles` command.

```bash
compdef dotfiles='git'
```

## Insipration

Many of dotfiles were directly forked from:
* [Luke Smith](https://github.com/lukesmithxyz)
* [Gotbletu](https://github.com/gotbletu)
And many others...
