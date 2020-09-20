SINK=$(pactl list sink-inputs | sed -r -n '/^Sink Input/{s@^[^#]+#@@g;p};/^[[:space:]]*(application.name)/{s@^[^=]+=[[:space:]]*@@g;p};/^:/{s@.*?[[:space:]]+([[:digit:]]+)%.*@\1@g;p};/^$/{s@.*@---@g;p}' | sed ':a;N;$!ba;s@\n@|@g' | sed -r -n 's@\|?---\|?@\n@g;p' | grep Spotify | sed 's/[a-zA-Z|"]//g')
$(pactl set-sink-input-volume $SINK -1%)