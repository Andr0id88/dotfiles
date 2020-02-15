# Custom systemd services

Simple and usefull services that can be ran using systemd.

Make the services files as root in /etc/systemd/system/yourescript.service

- Gitpushall:
Is a service that will push all git repos from a given directory including dotfiles on to github when you shutdown your computer.

- Gitpullall:
Is a service that will pull all github repos and dotfiles from github when the pc got internet connection on startup.

- Batterylow:
Sends a notification whenever battery is critically low.


