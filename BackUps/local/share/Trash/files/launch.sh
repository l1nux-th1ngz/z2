#!/usr/bin/env sh

# Kill all existing Polybar instances
killall -q polybar

# Wait until all Polybar processes have shut down
while pgrep -u "$UID" -x polybar >/dev/null; do
  sleep 1
done

# Detect current desktop session
desktop="${DESKTOP_SESSION}"

case "$desktop" in
  hypr|/usr/share/xsessions/hypr)
    # Hypr typically supports only one monitor for Polybar
    # Launch top and bottom bars on the primary monitor
    primary_monitor=$(xrandr --query | grep " connected primary" | cut -d" " -f1)

    # Fallback if no "primary" is set
    if [ -z "$primary_monitor" ]; then
      primary_monitor=$(xrandr --query | grep " connected" | head -n1 | cut -d" " -f1)
    fi

    if [ -n "$primary_monitor" ]; then
      MONITOR="$primary_monitor" polybar --reload mainbar0 -c ~/.config/hypr/polybar/polybartop.config &
    #  MONITOR="$primary_monitor" polybar --reload mainbar0 -c ~/.config/hypr/polybar/polybarbottom.config &
    else
      echo "No connected monitor found for Polybar."
    fi
    ;;
esac
