# Andr0id88 dotfiles

## i3-gaps, ranger & firefox with custom interactive startpage
![I3-gaps](https://github.com/Andr0id88/kalivoidrice/blob/master/i3.png "i3-gaps")

## Tmux with powerline
![Tmux](https://github.com/Andr0id88/kalivoidrice/blob/master/tmux.png "Tmux")

## Contents
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


## Scripts:
There are numerous custom scripts located [here](https://github.com/Andr0id88/dotfiles/tree/master/.local/bin/tools), most of the scripts are self explanatory and contains comments.
Some of the scripts are used for making the dmenu\rofi workflow abit more streamlined, they are all called rofi-?

#### Github:
There is also some custom github scripts called [gapush](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/gapush), [gapull](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/gapull) and [gastat](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/gastat). These are used for looping over many subfolders from my githubrepo folder were i keep my projects for easy management.

They can be used as a systemd service to have all git repo's push when you turn on the pc, and pull when you turn it on, to easily sync betwen stationary and laptop for e.g.

#### Shortcuts:
It contains 2 files called [bmdirs](https://github.com/Andr0id88/dotfiles/blob/master/.config/bmdirs) and a file called [bmfiles](https://github.com/Andr0id88/dotfiles/blob/master/.config/bmfiles).
In these 2 files you can write down high traffic folders or files. These will automaticly sync to bashrc, zshrc, fish, ranger, vifm and more using [this](https://github.com/Andr0id88/dotfiles/blob/master/.local/bin/tools/shortcuts) script.


#### Who is it aimed for?
For the most part myself, but if anyone else see any use of any of this please feel free to help yourself. I am only using i3wm, so if you are a GUI person some of the config files wont be of any use to you.

## Installation
#### **Warning**:
If you want to give these dotfiles a try, you should first fork or clone this repo, review the code, and remove things you don't want or need. Don't blindly use my settings unless you know what that entails. Use at your own risk.

Guidelines for how to bootstrap, script, or manaully install the dotfiles will follow whenever i get the time.
