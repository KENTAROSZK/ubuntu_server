#!/bin/bash

# VIRTUAL_ENV を削除する
# lscr.io/linuxserver/webtopは、デフォルトでpython実行環境と
# pythonの仮想環境`VIRTUAL_ENV`を指定した状態で起動する
# そうすると`uv`が独自で指定したい`VIRTUAL_ENV`と異なるパスになってしまうため
# 警告が表示されてしまう
# それを起こさないために、`VIRTUAL_ENV`をアンセットしておく
unset VIRTUAL_ENV

# Get browser window dimensions from environment variable or use default
RESOLUTION=${RESOLUTION:-1920x1080}

# Start VNC server
vncserver -localhost no -SecurityTypes None -geometry $RESOLUTION --I-KNOW-THIS-IS-INSECURE

# Generate self-signed certificate for websockify
openssl req -new -subj "/C=JP" -x509 -days 365 -nodes -out /self.pem -keyout /self.pem

# Start websockify
websockify -D --web=/usr/share/novnc/ --cert=/self.pem 6080 localhost:5901

# Keep container running
tail -f /dev/null