filename="tree.jpg"
bg_path="$HOME/Pictures/Backgrounds/$filename"
blurred_path="$HOME/.cache/blurred-walls/$filename"

$HOME/scripts/bgprocessor.sh $bg_path
echo "blurred $bg_path"

echo "starting swww-daemon (overview)"
nohup swww-daemon --namespace oback &
>/dev/null
swww img -n oback $blurred_path

echo "starting swww-daemon"
nohup swww-daemon &
>/dev/null
swww img $bg_path
