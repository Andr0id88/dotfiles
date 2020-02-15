# Not even close to finished, need to make a script to check battery charging status if it is not charging i need to check if it is below 25%
# Maybe even a 2th check to see if it is below 10%.
# Plan is to get a picture of Bender from futurama to go along with the msg, that says "Charge me up baby im low on juice, or something similar"

[ "$(cat /sys/class/power_supply/BAT0/status)" = "Charging" ] && exit
[ "$(cat /sys/class/power_supply/BAT0/capacity)" -lt 25 ] &&
notify-send -u critical "Battery critically low."
