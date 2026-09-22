#!/bin/bash

echo "=== Starting Linux Mint-style XFCE Desktop ==="

# Clean up old sessions
vncserver -kill :1 >/dev/null 2>&1 || true

pkill -f "websockify.*6080" >/dev/null 2>&1 || true

sleep 1

# Start VNC
vncserver :1 \
    -geometry 1280x800 \
    -depth 24 \
    -localhost no

# Start noVNC
nohup websockify \
    --web=/usr/share/novnc \
    6080 \
    127.0.0.1:5901 \
    > "$HOME/novnc.log" 2>&1 &

sleep 3

echo ""
echo "=========================================="
echo "      🐧 LINUX DESKTOP READY"
echo "=========================================="
echo ""
echo "VNC:"
ss -ltn | grep 5901 || true

echo ""
echo "noVNC:"
ss -ltn | grep 6080 || true

echo ""
echo "Open forwarded port 6080."
echo "=========================================="
