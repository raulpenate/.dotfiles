if type "xrandr" > /dev/null 2>&1; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m "$HOME/.config/polybar/.sh" --forest &
  done
else
  "$HOME/.config/polybar/launch.sh" --forest &
fia
