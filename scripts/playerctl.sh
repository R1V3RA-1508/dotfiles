# Определение плеера
player_arg='-p spotify'
players=$(playerctl -l)
if [ "$players" == "No players found" ] || [ "$players" == "" ]; then
  player_arg=''
  status='Stopped'
  title='Тушёные перчатки'
  artist='DJ Назар Шишка'
  album='Тушеные перчатки'
elif [ "$players" != 'No players found' ] && [ "$players" != "" ]; then
  # Получение данных
  status=$(playerctl status $player_arg)
  title=$(playerctl metadata title $player_arg)
  artist=$(playerctl metadata artist $player_arg)
  album=$(playerctl metadata album $player_arg)
fi

# Формирование тултипа
tooltip="$artist - $title
С альбома \"$album\""
tooltip="${tooltip//&/&amp;}"
#tooltip=$(echo $tooltip | sed 's/&/&amp;/g')

# Определение иконки
if [ "$status" == 'Playing' ]; then
  icon='󰝚 '
elif [ "$status" == 'Stopped' ]; then
  icon='󰝛 '
elif [ "$status" == "Paused" ]; then
  icon='󰏤 '
fi

jq -n -c \
  --arg icon "$icon" \
  --arg tooltip "$tooltip" \
  '{text: $icon, tooltip: $tooltip}'
