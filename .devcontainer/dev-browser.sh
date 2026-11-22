#!/usr/bin/env bash
# Starts the virtual display + VNC + noVNC stack so an automated (headed)
# Chromium is visible in the host browser at http://localhost:6080.
# Idempotent: safe to call multiple times; skips already-running parts.
set -euo pipefail

export DISPLAY="${DISPLAY:-:99}"

if ! pgrep -x Xvfb >/dev/null; then
    Xvfb :99 -screen 0 1440x900x24 -ac >/tmp/xvfb.log 2>&1 &
    sleep 1
fi

if ! pgrep -x x11vnc >/dev/null; then
    x11vnc -display "$DISPLAY" -forever -shared -rfbport 5900 -nopw \
        -quiet >/tmp/x11vnc.log 2>&1 &
fi

if ! pgrep -f websockify >/dev/null; then
    websockify --web /usr/share/novnc 6080 localhost:5900 \
        >/tmp/websockify.log 2>&1 &
fi

sleep 1
echo "noVNC ready: open http://localhost:6080/vnc.html on Windows"
echo "DISPLAY=$DISPLAY (use this env for headed Playwright runs)"
