#!/bin/bash
# Double-click this file to start Home Karaoke. Close this window to stop it.
cd "$(dirname "$0")"
PORT=8765
URL="http://localhost:$PORT/"
if ! lsof -i :$PORT >/dev/null 2>&1; then
  python3 -m http.server $PORT --bind 127.0.0.1 >/dev/null 2>&1 &
  SERVER=$!
  trap "kill $SERVER 2>/dev/null" EXIT
  sleep 1
fi
if [ -d "/Applications/Google Chrome.app" ]; then open -a "Google Chrome" "$URL"; else open "$URL"; fi
echo ""
echo "  🎤 Home Karaoke is running at $URL"
echo "  Keep this window open during the party. Close it when you're done."
echo ""
wait
