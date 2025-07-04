#!/usr/bin/env bash

# Load Global Variable
source $HOME/.config/bspwm/.bspwm

# Brightness handler using brightnessctl

function cbright {
    brightnessctl i | grep '%' | awk -F'(' '{print $2}' | awk -F'%' '{print $1}'
}

function notify {
    brightness=`cbright`
    
    if [ "$brightness" = "0" ]; then
        icon_name="$ICONDIR/brightness-off"
    else    
        if [  "$brightness" -lt "10" ]; then
            icon_name="$ICONDIR/brightness-low"
        else
            if [ "$brightness" -lt "30" ]; then
                icon_name="$ICONDIR/brightness-low"
            else
                if [ "$brightness" -lt "70" ]; then
                    icon_name="$ICONDIR/brightness-medium"
                else
                    if [ "$brightness" -lt "100" ]; then
                        icon_name="$ICONDIR/brightness-high"
                    else
                        icon_name="$ICONDIR/brightness-full"
                    fi
                fi
            fi
        fi
    fi
    #echo "$brightness" > ~/.config/bspwm/scripts/brightness-current
    sed -i "7s_.*_BRIGHTNESS=${brightness}_" $HOME/.config/bspwm/.bspwm
    $NOTIFIER -i "$icon_name.png" -t 2000 -r 1234 "$brightness "
}

case $1 in
    up)
	# +5%
	brightnessctl set 2%+ > /dev/null
	notify
	;;
    down)
    # -5%
    brightnessctl set 2%- > /dev/null
	notify
	;;
    optimal)
    # Toggle optimal
	brightnessctl set 25% > /dev/null
    notify
	;;
esac    
