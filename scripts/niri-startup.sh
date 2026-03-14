bg_path="$HOME/Pictures/Backgrounds/pink-evening.jpg"
filename=${bg_path##*/}
blurred_path="$HOME/.cache/blurred-walls/$filename"
compositor="$1"

if [ "$compositor" != "hypr" ]; then
  $HOME/scripts/bgprocessor.sh $bg_path
  echo "blurred $bg_path"
fi

echo "generating colors"
wal -i $bg_path --backend modern_colorthief >/dev/null
mv -f "$HOME/.cache/wal/colors-swaylock" "$HOME/.swaylock/config"
mv -f "$HOME/.cache/wal/discord-wal.theme.css" "$HOME/.config/goofcord/GoofCord/themes/ClearVision-v7-BetterDiscord.theme.css"
python $HOME/scripts/oomox-handler.py $HOME/.cache/wal/wal.oomox
wait

#if [ $(cat $HOME/.cache/wal/wal.oomox) != $(cat $HOME/.config/oomox/colors/wal) ]; then
if ! diff -q "$HOME/.cache/wal/wal.oomox" "$HOME/.config/oomox/colors/wal"; then
  cp -f $HOME/.cache/wal/wal.oomox $HOME/.config/oomox/colors/wal
  echo "generating gtk theme"
  # oomox-cli $HOME/.cache/wal/colors-oomox -o oomox-wal >/dev/null & #-p $HOME/.config/oomox/export_config/multi_export_wal-theme-apply.json
  nohup themix-multi-export $HOME/.config/oomox/export_config/multi_export_wal-theme-apply.json $HOME/.config/oomox/colors/wal >/dev/null

  echo "applying gtk theme"
  gsettings set org.gnome.desktop.interface gtk-theme "oomox-wal"

  pkill thunar # for changing accent color
fi

echo "starting swww-daemons"
if [ "$compositor" != "hypr" ]; then
  nohup swww-daemon --namespace oback >/dev/null &
  swww img -n oback $blurred_path
else
  echo "did not started overview daemon"
fi
nohup swww-daemon >/dev/null &

echo "setting wallpapers"
swww img $bg_path

echo "generating telegram theme"
mkdir $HOME/Telegram-wal/
cp $bg_path $HOME/Telegram-wal/
mv $HOME/Telegram-wal/$filename $HOME/Telegram-wal/background.jpg
wait
$HOME/scripts/wal-to-tg.sh
wait
rm -f $HOME/Telegram-wal/wal.tdesktop-theme
zip $HOME/Telegram-wal/wal.tdesktop-theme $HOME/Telegram-wal/background.jpg $HOME/Telegram-wal/colors.tdesktop-palette
