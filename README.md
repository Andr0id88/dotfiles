# Kali's GNU/Linux Dotfiles

These are my dotfiles! It is a sort of collection from alot of users, heavily inspired by:
* LukeSmithxyz *
* Gotbletu *

## Programs whose configs can be found here

+ i3 (i3-gaps)
+ ~~Xresourses/Xdefaults settings~~ Now moved to [my terminal (st) build](https://github.com/Andr0id88/st) (forked from LukeSmithxyz) which uses them
+ python-neovim
+ bash
+ zsh
+ vifm
+ ranger
+ calcurse
+ ncmpcpp and mpd (my main music player)
+ mpv
+ And many little scripts I use filed in the `~/.local/bin/` directory

## More documentation

The command `getkeys` will also show basic key binds for different programs.
The text files this script uses can be found in ~/.config/getkeys

## Dynamic Configuration Files

Store your favorite or high-traffic directories in `~/.config/bmdirs` or your most
important config files in `~/.config/bmfiles` with keyboard shortcuts. When you add
things to theses files my vimrc will automatically run `shortcuts` which will
dynamically generate shortcuts for these in bash, zsh, ranger and optionally
qutebrowser and fish.

# "Dependencies" and programs used

The programs I use here are always changing, but luckily you can just look at the list of programs installed here:

+ [List of programs installed by KARBS, including optional packages](https://github.com/Andr0id88/KARBS/blob/master/progs.csv)

`A` marks programs in the AUR, `G` marks git repositories.
