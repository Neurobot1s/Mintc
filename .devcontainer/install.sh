#!/bin/bash
set -e

echo "=== Installing XFCE + VNC + noVNC ==="

sudo apt-get update

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server \
    tigervnc-tools \
    novnc \
    websockify \
    dbus-x11 \
    x11-xserver-utils

mkdir -p "$HOME/.vnc"

cat > "$HOME/.vnc/xstartup" <<'EOF'
#!/bin/sh

unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS

export XDG_CURRENT_DESKTOP=XFCE
export XDG_SESSION_DESKTOP=xfce

exec dbus-launch --exit-with-session startxfce4
EOF

chmod +x "$HOME/.vnc/xstartup"

echo "=== Installation complete ==="
